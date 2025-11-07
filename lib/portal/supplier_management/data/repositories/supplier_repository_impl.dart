import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/api/supplier_api.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/dto/supplier_payload.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/repositories/supplier_repository.dart';

/// Concrete implementation of [SupplierRepository] that uses [SupplierApi] for API calls
/// and [BaseRepository] to centralize error handling.
class SupplierRepositoryImpl extends BaseRepository implements SupplierRepository {
  final SupplierApi _api;

  SupplierRepositoryImpl({required SupplierApi api}) : _api = api;

  @override
  Future<ApiResult<PaginatedList<Supplier>>> getSuppliers(PageQuery query) {
    return call(() async {
      final response = await _api.getSuppliers(query);
      return response.convert((item) => item.toDomain());
    });
  }

  @override
  Future<ApiResult<Supplier>> getSupplierById(int id) {
    return call(() async {
      final response = await _api.getSupplier(id);
      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<Supplier>> createSupplier(SupplierPayload payload) {
    return call(() async {
      final response = await _api.create(payload);
      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<Supplier>> updateSupplier(int id, SupplierPayload payload) {
    return call(() async {
      final response = await _api.update(id, payload);
      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<void>> deleteSupplier(int id) {
    return call(() async {
      return await _api.delete(id);
    });
  }
}
