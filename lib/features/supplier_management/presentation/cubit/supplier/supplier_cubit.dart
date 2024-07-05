import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/create_supplier_usecase.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/delete_supplier_usecase.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/get_supplier_by_id_usecase.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/update_supplier_usecase.dart';

part 'supplier_state.dart';

class SupplierCubit extends Cubit<SupplierState> {
  final GetSupplierByIdUseCase _getSupplierByIdUseCase;
  final CreateSupplierUseCase _createSupplierUseCase;
  final UpdateSupplierUseCase _updateSupplierUseCase;
  final DeleteSupplierUseCase _deleteSupplierUseCase;

  SupplierCubit(
    this._getSupplierByIdUseCase,
    this._createSupplierUseCase,
    this._updateSupplierUseCase,
    this._deleteSupplierUseCase,
  ) : super(SupplierInitial());

  Future<void> getSupplierById(int id) async {
    emit(SupplierDetailsLoading());

    try {
      final result = await _getSupplierByIdUseCase.call(GetSupplierByIdParams(id));
      result.fold(
        (error) => emit(SupplierError(message: error.message)),
        (data) => emit(SupplierDetailsLoaded(supplier: data)),
      );
    } catch (e) {
      emit(SupplierError(message: e.toString()));
    }
  }

  Future<void> create(Supplier supplier) async {
    emit(SupplierSaveLoading());

    try {
      final result = await _createSupplierUseCase.call(CreateSupplierParams(supplier));
      result.fold(
        (error) => emit(SupplierError(message: error.message)),
        (_) => emit(const SupplierSuccess(message: 'Supplier successfully created.')),
      );
    } catch (e) {
      emit(SupplierError(message: e.toString()));
    }
  }

  Future<void> update(Supplier supplier) async {
    emit(SupplierSaveLoading());

    try {
      final result = await _updateSupplierUseCase.call(UpdateSupplierParams(supplier));
      result.fold(
        (error) => emit(SupplierError(message: error.message)),
        (_) => emit(const SupplierSuccess(message: 'Supplier successfully updated.')),
      );
    } catch (e) {
      emit(SupplierError(message: e.toString()));
    }
  }

  Future<void> delete(int id) async {
    emit(SupplierDeleteLoading());

    try {
      final result = await _deleteSupplierUseCase.call(DeleteSupplierParams(id));
      result.fold(
        (error) => emit(SupplierError(message: error.message)),
        (_) => emit(const SupplierSuccess(message: 'Supplier successfully deleted.')),
      );
    } catch (e) {
      emit(SupplierError(message: e.toString()));
    }
  }
}
