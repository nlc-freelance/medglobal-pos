import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/entities/product_history_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/domain/usecases/get_product_history_usecase.dart';

part 'product_history_list_state.dart';

class ProductHistoryListCubit extends Cubit<ProductHistoryListState> {
  final GetProductHistoryUseCase _getProductHistoryUseCase;

  ProductHistoryListCubit(this._getProductHistoryUseCase) : super(const ProductHistoryListInitial());

  Future<void> getProductHistory({
    required int variantId,
    required int branchId,
    required String startDate,
    int page = 1,
    int size = 20,
  }) async {
    emit(const ProductHistoryListLoading());

    try {
      final result = await _getProductHistoryUseCase.call(GetProductHistoryParams(
        variantId: variantId,
        branchId: branchId,
        startDate: startDate,
        page: page,
        size: size,
      ));
      result.fold(
        (error) => emit(ProductHistoryListError(message: error.message)),
        (data) => emit(ProductHistoryListLoaded(data: data)),
      );
    } catch (e) {
      emit(ProductHistoryListError(message: e.toString()));
    }
  }

  /// For the data grid view to display the default message
  void reset() => emit(const ProductHistoryListInitial());
}
