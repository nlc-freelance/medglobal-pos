import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/get_suppliers.dart';

part 'supplier_list_state.dart';

class SupplierListCubit extends Cubit<SupplierListState> {
  final GetSuppliers _getSuppliers;

  SupplierListCubit(this._getSuppliers) : super(const SupplierListInitialState());

  Future<void> getSuppliers() async {
    emit(const SupplierListLoadingState());

    try {
      final result = await _getSuppliers.call(GetSuppliersParams(1));
      result.fold(
        (error) => emit(SupplierListErrorState(message: error.message)),
        (data) => emit(GetSupplierListState(suppliers: data)),
      );
    } catch (e) {
      emit(SupplierListErrorState(message: e.toString()));
    }
  }
}
