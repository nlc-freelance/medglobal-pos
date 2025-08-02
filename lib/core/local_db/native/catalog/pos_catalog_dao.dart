import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/base_dao.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/local_db/native/catalog/pos_catalog_table.dart';
import 'package:medglobal_admin_portal/pos/pos_catalog/domain/entities/catalog_item.dart';

part 'pos_catalog_dao.g.dart';

@DriftAccessor(tables: [PosCatalog])
class PosCatalogDao extends DatabaseAccessor<AppDatabase> with _$PosCatalogDaoMixin {
  PosCatalogDao(super.db);

  /// Delta sync: Insert or update existing product catalog items
  Future<void> upsertProductCatalog(List<PosCatalogCompanion> items) async {
    // return safeCall(() async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(posCatalog, items);
    });
    // });
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
    // return safeCall(() async {
    // Calculate how many rows to skip based on the page number and page size
    final offset = (page - 1) * size;

    final query = select(posCatalog)
      ..limit(size, offset: offset)
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.name)]);

    applySimpleSearch(
      query: query,
      column: posCatalog.name,
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
    // });
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
    final query = selectOnly(posCatalog, distinct: true)..addColumns([posCatalog.id.count()]);

    if (search != null && search.trim().isNotEmpty) {
      final keyword = search.trim().toLowerCase();
      final hasMatch = posCatalog.name.lower().like(keyword);
      query.where(hasMatch);
    }

    final count = await query.getSingle().then((row) => row.read(posCatalog.id.count()));
    return count ?? 0;
    // });
  }

  /// Clear all product catalog items
  Future<void> clearAll() async {
    await delete(posCatalog).go();
  }
}

/// Mappers

extension CatalogItemMapper on CatalogItem {
  PosCatalogCompanion toDriftCompanion() {
    return PosCatalogCompanion.insert(
      id: id,
      name: displayName,
      stock: stock,
      price: price,
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
