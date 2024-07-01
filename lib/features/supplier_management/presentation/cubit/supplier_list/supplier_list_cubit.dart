import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/features/supplier_management/data/api/supplier_api.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/usecases/get_suppliers.dart';

part 'supplier_list_state.dart';

class SupplierListCubit extends Cubit<SupplierListState> {
  final GetSuppliersUseCase _getSuppliers;

  SupplierListCubit(this._getSuppliers) : super(const SupplierListInitialState());

  Future<void> getSuppliers() async {
    emit(const SupplierListLoadingState());

    try {
      final result = await _getSuppliers.call(GetSuppliersParams(1));
      result.fold(
        (error) => emit(SupplierListErrorState(message: error.message)),
        (data) => emit(GetSupplierListState(suppliers: data.suppliers!)),
      );
    } catch (e) {
      emit(SupplierListErrorState(message: e.toString()));
    }
  }

  List<Supplier> _suppliers = [];
  int _currentPage = 1;
  int? _totalPages;

  Future<void> getSuppliersByPage({bool isLoadMore = false}) async {
    if (isLoadMore && _currentPage > _totalPages!) return;

    emit(const SupplierListLoadingState());

    try {
      _currentPage = isLoadMore ? _currentPage + 1 : _currentPage;

      final res = await GetIt.I<SupplierApi>().getSuppliers(_currentPage);

      // final result = await _getCategoriesUseCase.call(GetCategoriesParams(_currentPage));

      // result.fold(
      //   (error) => emit(CategoryListError(message: error.message)),
      //   (data) {
      final data = res.toEntity();
      _totalPages = data.totalPages!;
      _suppliers = _suppliers..addAll(data.suppliers!);

      emit(GetSupplierListState(suppliers: _suppliers.toSet().toList()));
      // },
      // );
    } catch (e) {
      emit(SupplierListErrorState(message: e.toString()));
    }
  }
}
