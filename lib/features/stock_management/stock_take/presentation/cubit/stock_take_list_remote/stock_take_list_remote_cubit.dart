import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/usecases/get_stock_takes_usecase.dart';

part 'stock_take_list_remote_state.dart';

class StockTakeListRemoteCubit extends Cubit<StockTakeListRemoteState> {
  final GetStockTakesUseCase _getStockTakesUseCase;

  StockTakeListRemoteCubit(this._getStockTakesUseCase) : super(StockTakeListInitial());

  Future<void> getStockTakes({int? page, StockOrderStatus? status}) async {
    emit(StockTakeListLoading());

    try {
      final result = await _getStockTakesUseCase.call(GetStockTakesParams(page: page, status: status));
      result.fold(
        (error) => emit(StockTakeListError(message: error.message)),
        (data) => emit(StockTakeListLoaded(stockTakes: data.stockTakes!)),
      );
    } catch (e) {
      emit(StockTakeListError(message: e.toString()));
    }
  }
}
