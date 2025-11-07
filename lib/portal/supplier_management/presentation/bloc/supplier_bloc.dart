import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/data/dto/supplier_payload.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/repositories/supplier_repository.dart';

part 'supplier_event.dart';
part 'supplier_state.dart';
part 'supplier_bloc.freezed.dart';

class SupplierBloc extends Bloc<SupplierEvent, SupplierState> {
  final SupplierRepository _repository;

  SupplierBloc({required SupplierRepository repository})
      : _repository = repository,
        super(const SupplierState.initial()) {
    on<_GetSupplierById>(_onGetSupplierById);
    on<_CreateSupplier>(_onCreateSupplier);
    on<_UpdateSupplier>(_onUpdateSupplier);
    on<_DeleteSupplier>(_onDeleteSupplier);
  }

  Future<void> _onGetSupplierById(_GetSupplierById event, Emitter<SupplierState> emit) async {
    emit(const SupplierState.loading());
    try {
      final result = await _repository.getSupplierById(event.id);

      result.when(
        success: (supplier) => emit(SupplierState.loaded(supplier)),
        failure: (failure) => emit(SupplierState.loadFailed(failure.message)),
      );
    } catch (e) {
      emit(SupplierState.loadFailed(e.toString()));
    }
  }

  Future<void> _onCreateSupplier(_CreateSupplier event, Emitter<SupplierState> emit) async {
    emit(const SupplierState.processing());
    try {
      final payload = SupplierPayload.fromSupplier(event.supplier);

      final result = await _repository.createSupplier(payload);

      result.when(
        success: (supplier) => emit(SupplierState.success('${supplier.name} successfully created.')),
        failure: (failure) => emit(SupplierState.failure(failure.message)),
      );
    } catch (e) {
      emit(SupplierState.failure(e.toString()));
    }
  }

  Future<void> _onUpdateSupplier(_UpdateSupplier event, Emitter<SupplierState> emit) async {
    emit(const SupplierState.processing());
    try {
      final supplier = event.supplier;
      final payload = SupplierPayload.fromSupplier(event.supplier);

      final result = await _repository.updateSupplier(supplier.id!, payload);

      result.when(
        success: (supplier) => emit(SupplierState.success('${supplier.name} successfully updated.')),
        failure: (failure) => emit(SupplierState.failure(failure.message)),
      );
    } catch (e) {
      emit(SupplierState.failure(e.toString()));
    }
  }

  Future<void> _onDeleteSupplier(_DeleteSupplier event, Emitter<SupplierState> emit) async {
    emit(const SupplierState.processing());
    try {
      final result = await _repository.deleteSupplier(event.supplierId);

      result.when(
        success: (_) => emit(SupplierState.success('${event.supplierName} successfully deleted.')),
        failure: (failure) => emit(SupplierState.failure(failure.message)),
      );
    } catch (e) {
      emit(SupplierState.failure(e.toString()));
    }
  }
}
