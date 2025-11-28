import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/usecases/get_stock_transfers_usecase.dart';

part 'stock_transfer_list_remote_state.dart';

class StockTransferListRemoteCubit extends Cubit<StockTransferListRemoteState> {
  final GetStockTransfersUseCase _getStockTransfersUseCase;

  StockTransferListRemoteCubit(this._getStockTransfersUseCase) : super(StockTransferListInitial());

  Future<void> getStockTransfers({
    int page = 1,
    int size = 20,
    StockOrderStatus? status,
    int? sourceBranchId,
    int? destinationBranchId,
    String? startDate,
    String? endDate,
  }) async {
    emit(StockTransferListLoading());

    try {
      final result = await _getStockTransfersUseCase.call(GetStockTransfersParams(
        page: page,
        size: size,
        status: status,
        sourceBranchId: sourceBranchId,
        destinationBranchId: destinationBranchId,
        startDate: startDate,
        endDate: endDate,
      ));
      result.when(
        success: (data) => emit(StockTransferListLoaded(data: data)),
        failure: (error) => emit(StockTransferListError(message: error.message)),
      );
    } catch (e) {
      emit(StockTransferListError(message: e.toString()));
    }
  }
}
