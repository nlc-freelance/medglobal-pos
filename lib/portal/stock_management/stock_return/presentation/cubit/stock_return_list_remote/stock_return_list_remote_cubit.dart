import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/usecases/get_stock_returns_usecase.dart';

part 'stock_return_list_remote_state.dart';

class StockReturnListRemoteCubit extends Cubit<StockReturnListRemoteState> {
  final GetStockReturnsUseCase _getStockReturnsUseCase;

  StockReturnListRemoteCubit(this._getStockReturnsUseCase) : super(StockReturnTransactionListInitial());

  Future<void> getStockReturns({int? page, StockOrderStatus? status}) async {
    emit(StockReturnTransactionListLoading());

    try {
      final result = await _getStockReturnsUseCase.call(GetStockReturnsParams(page: page, status: status));
      result.fold(
        (error) => emit(StockReturnTransactionListError(message: error.message)),
        (data) => emit(StockReturnTransactionListLoaded(stockReturns: data.stockReturns!)),
      );
    } catch (e) {
      emit(StockReturnTransactionListError(message: e.toString()));
    }
  }
}
