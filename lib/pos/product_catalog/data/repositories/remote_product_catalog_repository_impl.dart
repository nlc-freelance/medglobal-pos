import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/query_params.dart';
import 'package:medglobal_admin_portal/core/models/paginated_list.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/data/datasources/remote_product_catalog_datasource.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/entities/catalog_item.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/domain/repositories/remote_product_catalog_repository.dart';

class RemoteProductCatalogRepositoryImpl extends BaseRepository implements RemoteProductCatalogRepository {
  final RemoteProductCatalogDataSource _remoteDataSource;

  RemoteProductCatalogRepositoryImpl({
    required RemoteProductCatalogDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<ApiResult<PaginatedList<CatalogItem>>> getProducts(PageQuery query, {bool isDeltaSync = false}) {
    return call(() async {
      final data = await _remoteDataSource.getProducts(query, isDeltaSync: isDeltaSync);

      return PaginatedList<CatalogItem>(
        items: data.items.map((item) => item.toCatalogItem).toList(),
        currentSize: data.currentSize,
        currentPage: data.currentPage,
        totalPages: data.totalPages,
        totalCount: data.totalCount,
      );
    });
  }
}
