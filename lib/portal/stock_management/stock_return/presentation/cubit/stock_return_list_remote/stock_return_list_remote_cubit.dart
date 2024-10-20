import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/usecases/get_stock_returns_usecase.dart';

part 'stock_return_list_remote_state.dart';

class StockReturnListRemoteCubit extends Cubit<StockReturnListRemoteState> {
  final GetStockReturnsUseCase _getStockReturnsUseCase;

  StockReturnListRemoteCubit(this._getStockReturnsUseCase) : super(StockReturnListInitial());

  Future<void> getStockReturns({
    int page = 1,
    int size = 20,
    StockOrderStatus? status,
    int? branchId,
    String? startDate,
    String? endDate,
  }) async {
    emit(StockReturnListLoading());

    try {
      final result = await _getStockReturnsUseCase.call(GetStockReturnsParams(
        page: page,
        size: size,
        status: status,
        branchId: branchId,
        startDate: startDate,
        endDate: endDate,
      ));
      result.fold(
        (error) => emit(StockReturnListError(message: error.message)),
        (data) => emit(StockReturnListLoaded(data: data)),
      );
    } catch (e) {
      emit(StockReturnListError(message: e.toString()));
    }
  }
}
