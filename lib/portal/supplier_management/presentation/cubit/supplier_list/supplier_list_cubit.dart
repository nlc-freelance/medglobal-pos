import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/usecases/get_suppliers_usecase.dart';

part 'supplier_list_state.dart';

class SupplierListCubit extends Cubit<SupplierListState> {
  final GetSuppliersUseCase _getSuppliersUseCase;

  SupplierListCubit(this._getSuppliersUseCase) : super(const SupplierListInitial());

  Future<void> getSuppliers({int page = 1, int size = 20, String? search}) async {
    emit(const SupplierListLoading());

    try {
      final result = await _getSuppliersUseCase.call(GetSuppliersParams(page: page, size: size, search: search));
      result.fold(
        (error) => emit(SupplierListError(message: error.message)),
        (data) {
          if (search != null && data.totalCount == 0 && data.suppliers?.isEmpty == true) {
            emit(SupplierSearchNoResult(message: 'No results found for \'$search\''));
          } else {
            emit(SupplierListLoaded(data: data));
          }
        },
      );
    } catch (e) {
      emit(SupplierListError(message: e.toString()));
    }
  }
}
