import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/get_stock_takes_usecase.dart';

part 'stock_take_list_remote_state.dart';

class StockTakeListRemoteCubit extends Cubit<StockTakeListRemoteState> {
  final GetStockTakesUseCase _getStockTakesUseCase;

  StockTakeListRemoteCubit(this._getStockTakesUseCase) : super(StockTakeListInitial());

  Future<void> getStockTakes({
    int page = 1,
    int size = 20,
    StockOrderStatus? status,
    String? startDate,
    String? endDate,
  }) async {
    emit(StockTakeListLoading());

    try {
      final result = await _getStockTakesUseCase.call(GetStockTakesParams(
        page: page,
        size: size,
        status: status,
        startDate: startDate,
        endDate: endDate,
      ));
      result.when(
        success: (data) => emit(StockTakeListLoaded(data: data)),
        failure: (error) => emit(StockTakeListError(message: error.message)),
      );
    } catch (e) {
      emit(StockTakeListError(message: e.toString()));
    }
  }
}
