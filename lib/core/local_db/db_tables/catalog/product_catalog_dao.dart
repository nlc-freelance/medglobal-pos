import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/base_dao.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';

part 'product_catalog_dao.g.dart';

@DriftAccessor(tables: [ProductCatalog])
class ProductCatalogDao extends DatabaseAccessor<AppDatabase> with _$ProductCatalogDaoMixin, BaseDao {
  ProductCatalogDao(super.db);

  /// Insert or update products
  Future<void> upsertProducts(List<ProductCatalogCompanion> items) async {
    return safeCall(() async {
      await batch((batch) {
        batch.insertAllOnConflictUpdate(productCatalog, items);
      });
    });
  }

  Future<void> updateStock(int productId, int quantityToDeduct) async {
    final product = await (select(productCatalog)..where((p) => p.id.equals(productId))).getSingle();

    final newStock = product.stock - quantityToDeduct;

    await (update(productCatalog)..where((tbl) => tbl.id.equals(productId))).write(
      ProductCatalogCompanion(
        stock: Value(newStock),
      ),
    );
  }

  /// Delete products
  Future<void> deleteProducts(List<ProductCatalogCompanion> items) {
    final idsForDeletion = items.map((item) => item.id.value).toList();

    return safeCall(() async {
      await (delete(productCatalog)..where((tbl) => tbl.id.isIn(idsForDeletion))).go();
    });
  }

  /// Fetches a paginated list of [CatalogItemModel]s from the local database, with search filter.
  ///
  /// This method retrieves a specific "page" of products based on [page] and [size].
  /// If [search] is provided, it performs a case-insensitive string match on the `name` column.
  Future<PaginatedList<CatalogItemModel>> getProductCatalog({
    required int page,
    int size = 20,
    String? search,
  }) async {
    return safeCall(() async {
      // Calculate how many rows to skip based on the page number and page size
      final offset = (page - 1) * size;

      final query = select(productCatalog)
        ..limit(size, offset: offset)
        ..orderBy([(tbl) => OrderingTerm(expression: tbl.name)]);

      applySimpleSearch(
        query: query,
        column: productCatalog.name,
        search: search,
      );

      final data = await query.get();

      final totalCount = await _countItems(search: search);
      final totalPages = getTotalPages(totalCount: totalCount, size: size);

      return PaginatedList<CatalogItemModel>(
        items: data,
        currentSize: size,
        currentPage: page,
        totalPages: totalPages,
        totalCount: totalCount,
      );
    });
  }

  /// Calculates total pages based on [size] and a filtered count query.
  int getTotalPages({
    required int totalCount,
    required int size,
  }) {
    return (totalCount / size).ceil();
  }

  void applySimpleSearch({
    required SimpleSelectStatement<dynamic, dynamic> query,
    required Expression<String> column,
    String? search,
  }) {
    // try {
    if (search != null && search.trim().isNotEmpty) {
      final keyword = search.trim().toLowerCase();
      query.where((_) => column.lower().like('%$keyword%'));
    }
    // } catch (e) {
    //   throw _mapDriftException(e);
    // }
  }

  /// Helper method to count total number of items matching the optional [search] filter.
  ///
  /// Performs a `COUNT(*)` query on the product catalog with optional case-insensitive filtering.
  /// Returns the total number of matching rows as an integer.
  Future<int> _countItems({String? search}) async {
    // return safeCall(() async {
    final query = selectOnly(productCatalog, distinct: true)..addColumns([productCatalog.id.count()]);

    if (search != null && search.trim().isNotEmpty) {
      final keyword = search.trim().toLowerCase();
      final hasMatch = productCatalog.name.lower().like(keyword);
      query.where(hasMatch);
    }

    final count = await query.getSingle().then((row) => row.read(productCatalog.id.count()));
    return count ?? 0;
    // });
  }

  /// Clear all product catalog items
  Future<void> clearAll() async {
    await delete(productCatalog).go();
  }
}

/// Mappers

extension CatalogItemMapper on CatalogItem {
  ProductCatalogCompanion get toProductCatalogCompanion {
    return ProductCatalogCompanion(
      id: Value(id),
      name: Value(displayName),
      stock: Value(stock),
      price: Value(price),
    );
  }
}

extension CatalogItemModelMapper on CatalogItemModel {
  CatalogItem toDomain() {
    return CatalogItem(
      id: id,
      displayName: name,
      stock: stock,
      price: price,
    );
  }
}
