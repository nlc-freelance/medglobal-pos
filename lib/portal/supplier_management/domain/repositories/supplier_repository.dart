import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/dto/supplier_payload.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';

abstract class SupplierRepository {
  Future<ApiResult<PaginatedList<Supplier>>> getSuppliers(PageQuery query);

  Future<ApiResult<Supplier>> getSupplierById(int id);

  Future<ApiResult<Supplier>> createSupplier(SupplierPayload payload);

  Future<ApiResult<Supplier>> updateSupplier(int id, SupplierPayload payload);

  Future<ApiResult<void>> deleteSupplier(int id);
}
