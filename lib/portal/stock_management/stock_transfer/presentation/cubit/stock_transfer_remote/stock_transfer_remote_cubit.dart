import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/new_stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/usecases/create_stock_transfer_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/usecases/get_stock_transfer_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/usecases/update_stock_transfer_usecase.dart';

part 'stock_transfer_remote_state.dart';

class StockTransferRemoteCubit extends Cubit<StockTransferRemoteState> {
  final GetStockTransferByIdUseCase _getStockTransferByIdUsecase;
  final CreateStockTransferUseCase _createStockTransferUsecase;
  final UpdateStockTransferUseCase _updateStockTransferUsecase;

  StockTransferRemoteCubit(
    this._getStockTransferByIdUsecase,
    this._createStockTransferUsecase,
    this._updateStockTransferUsecase,
  ) : super(StockTransferInitial());

  void reset() => emit(StockTransferInitial());

  Future<void> getStockTransferById(int id) async {
    emit(StockTransferByIdLoading());

    try {
      final result = await _getStockTransferByIdUsecase.call(GetStockTransferByIdParams(id));
      result.fold(
        (error) => emit(StockTransferByIdError(message: error.message)),
        (data) => emit(StockTransferByIdSuccess(stockTransfer: data)),
      );
    } catch (e) {
      emit(StockTransferByIdError(message: e.toString()));
    }
  }

  Future<void> create(NewStockTransfer payload) async {
    emit(StockTransferCreateLoading());

    try {
      final result = await _createStockTransferUsecase.call(CreateStockTransferParams(payload));
      result.fold(
        (error) => emit(StockTransferError(message: error.message)),
        (data) => emit(StockTransferCreateSuccess(stockTransfer: data)),
      );
    } catch (e) {
      emit(StockTransferError(message: e.toString()));
    }
  }

  Future<void> update(StockOrderUpdate type, {required int id, required StockTransfer stockTransfer}) async {
    if (type == StockOrderUpdate.SAVE) emit(StockTransferSaveLoading());
    if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED ||
        type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS) {
      emit(StockTransferSaveAndMarkAsShippedLoading());
    }
    if (type == StockOrderUpdate.SAVE_AND_RECEIVED) emit(StockTransferSaveAndReceivedLoading());
    if (type == StockOrderUpdate.CANCEL) emit(StockTransferCancelLoading());

    try {
      final result =
          await _updateStockTransferUsecase.call(UpdateStockTransferParams(type, id: id, stockTransfer: stockTransfer));
      result.fold(
        (error) => emit(StockTransferError(message: error.message)),
        (_) => emit(const StockTransferSuccess(message: 'Stock Transfer updated successfully.')),
      );
    } catch (e) {
      emit(StockTransferError(message: e.toString()));
    }
  }
}
