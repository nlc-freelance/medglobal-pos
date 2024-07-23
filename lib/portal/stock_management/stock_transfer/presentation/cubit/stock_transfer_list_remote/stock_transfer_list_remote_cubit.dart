import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/usecases/get_stock_transfers_usecase.dart';

part 'stock_transfer_list_remote_state.dart';

class StockTransferListRemoteCubit extends Cubit<StockTransferListRemoteState> {
  final GetStockTransfersUseCase _getStockTransfersUseCase;

  StockTransferListRemoteCubit(this._getStockTransfersUseCase) : super(StockTransferListInitial());

  Future<void> getStockTransfers({int? page, StockOrderStatus? status}) async {
    emit(StockTransferListLoading());

    try {
      final result = await _getStockTransfersUseCase.call(GetStockTransfersParams(page: page, status: status));
      result.fold(
        (error) => emit(StockTransferListError(message: error.message)),
        (data) => emit(StockTransferListLoaded(stockTransfers: data.stockTransfers!)),
      );
    } catch (e) {
      emit(StockTransferListError(message: e.toString()));
    }
  }
}
