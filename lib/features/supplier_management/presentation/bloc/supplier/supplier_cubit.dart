import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/create_supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/delete_supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/get_supplier_by_id.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/update_supplier.dart';

part 'supplier_state.dart';

class SupplierCubit extends Cubit<SupplierState> {
  final GetSupplierById _getSupplierById;
  final CreateSupplier _createSupplier;
  final UpdateSupplier _updateSupplier;
  final DeleteSupplier _deleteSupplier;

  SupplierCubit(
    this._getSupplierById,
    this._createSupplier,
    this._updateSupplier,
    this._deleteSupplier,
  ) : super(const SupplierInitialState());

  Future<void> getSupplierById(int id) async {
    emit(const GetSupplierLoadingState());

    try {
      final result = await _getSupplierById.call(GetSupplierByIdParams(id));
      result.fold(
        (error) => emit(SupplierErrorState(message: error.message)),
        (data) => emit(GetSupplierState(supplier: data)),
      );
    } catch (e) {
      emit(SupplierErrorState(message: e.toString()));
    }
  }

  Future<void> create(Supplier supplier) async {
    emit(const SaveSupplierLoadingState());

    try {
      final result = await _createSupplier.call(CreateSupplierParams(supplier));
      result.fold(
        (error) => emit(SupplierErrorState(message: error.message)),
        (_) => emit(const SupplierSuccessState(message: 'Supplier successfully created.')),
      );
    } catch (e) {
      emit(SupplierErrorState(message: e.toString()));
    }
  }

  Future<void> update(Supplier supplier) async {
    emit(const SaveSupplierLoadingState());

    try {
      final result = await _updateSupplier.call(UpdateSupplierParams(supplier));
      result.fold(
        (error) => emit(SupplierErrorState(message: error.message)),
        (_) => emit(const SupplierSuccessState(message: 'Supplier successfully updated.')),
      );
    } catch (e) {
      emit(SupplierErrorState(message: e.toString()));
    }
  }

  Future<void> delete(int id) async {
    emit(const DeleteSupplierLoadingState());

    try {
      final result = await _deleteSupplier.call(DeleteSupplierParams(id));
      result.fold(
        (error) => emit(SupplierErrorState(message: error.message)),
        (_) => emit(const SupplierSuccessState(message: 'Supplier successfully deleted.')),
      );
    } catch (e) {
      emit(SupplierErrorState(message: e.toString()));
    }
  }
}
