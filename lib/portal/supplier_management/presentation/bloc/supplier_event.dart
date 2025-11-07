part of 'supplier_bloc.dart';

@freezed
class SupplierEvent with _$SupplierEvent {
  const factory SupplierEvent.getSupplierById(int id) = _GetSupplierById;
  const factory SupplierEvent.createSupplier(Supplier supplier) = _CreateSupplier;
  const factory SupplierEvent.updateSupplier(Supplier supplier) = _UpdateSupplier;
  const factory SupplierEvent.deleteSupplier(int supplierId, String supplierName) = _DeleteSupplier;
}
