part of 'supplier_bloc.dart';

@freezed
class SupplierState with _$SupplierState {
  const factory SupplierState.initial() = _Initial;
  const factory SupplierState.loading() = _Loading;
  const factory SupplierState.loaded(Supplier supplier) = _Loaded;
  const factory SupplierState.loadFailed(String message) = _LoadFailed;
  const factory SupplierState.processing() = _Processing;
  const factory SupplierState.success(String message) = _Success;
  const factory SupplierState.failure(String message) = _Failure;
}
