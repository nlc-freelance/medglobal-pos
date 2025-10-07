import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/new_stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/create_stock_take_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/get_stock_take_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/update_stock_take_usecase.dart';

part 'stock_take_event.dart';
part 'stock_take_state.dart';

class StockTakeBloc extends Bloc<StockTakeEvent, StockTakeBlocRemoteState> {
  final GetStockTakeByIdUseCase _getStockTakeByIdUsecase;
  final CreateStockTakeUseCase _createStockTakeUsecase;
  final UpdateStockTakeUseCase _updateStockTakeUsecase;

  StockTakeBloc(
    this._createStockTakeUsecase,
    this._getStockTakeByIdUsecase,
    this._updateStockTakeUsecase,
  ) : super(StockTakeInitial()) {
    on<GetStockTakeByIdEvent>(getStockTakeById);
    on<StartStockTakePollingEvent>(startStockTakePolling);
    on<CreateStockTakeEvent>(create);
    on<UpdateStockTakeEvent>(update);
  }

  bool _isPolling = false;

  Future<void> startStockTakePolling(event, emit) async {
    emit(StockTakePolling(event.targetStatus));
    _isPolling = true;

    while (_isPolling) {
      emit(StockTakePolling(event.targetStatus));
      try {
        final result = await _getStockTakeByIdUsecase.call(GetStockTakeByIdParams(event.id));
        result.when(
          success: (data) {
            if (data.status == event.targetStatus) {
              // Stop polling after receiving IN_PROGRESS/COMPLETED
              _isPolling = false;
              emit(StockTakeByIdSuccess(stockTake: data));
              emit(StockTakePollingComplete(event.targetStatus));
            }
          },
          failure: (error) => emit(StockTakeByIdError(message: error.message)),
        );
      } catch (e) {
        emit(StockTakeError(message: e.toString()));
      }

      // If still polling, wait before the next request
      if (_isPolling) {
        await Future.delayed(const Duration(seconds: 2));
      }
    }
  }

  Future<void> getStockTakeById(event, emit) async {
    emit(StockTakeByIdLoading());

    try {
      final result = await _getStockTakeByIdUsecase.call(GetStockTakeByIdParams(event.id));
      result.when(
        success: (data) => emit(StockTakeByIdSuccess(stockTake: data)),
        failure: (error) => emit(StockTakeByIdError(message: error.message)),
      );
    } catch (e) {
      emit(StockTakeByIdError(message: e.toString()));
    }
  }

  Future<void> create(event, emit) async {
    emit(StockTakeCreateLoading());

    try {
      final result = await _createStockTakeUsecase.call(CreateStockTakeParams(event.payload));
      result.when(
        success: (data) => emit(StockTakeCreateSuccess(stockTake: data)),
        failure: (error) => emit(StockTakeError(message: error.message)),
      );
    } catch (e) {
      emit(StockTakeError(message: e.toString()));
    }
  }

  Future<void> update(event, emit) async {
    if (event.type == StockOrderUpdate.MARK_AS_COMPLETE && event.action == null) {
      emit(const StockTakeMarkAsCompletedError(message: 'Please select an action.'));
      return;
    }

    if (event.type == StockOrderUpdate.SAVE) emit(StockTakeSaveLoading());
    if (event.type == StockOrderUpdate.MARK_AS_COMPLETE) emit(StockTakeMarkAsCompletedLoading());
    if (event.type == StockOrderUpdate.CANCEL) emit(StockTakeCancelLoading());

    final uncountedItemValue = event.action == StockTakeItemAction.SET_QTY_TO_ZERO ? 0 : null;

    try {
      final result = await _updateStockTakeUsecase.call(UpdateStockTakeParams(
        event.type,
        id: event.id,
        stockTake: event.stockTake,
        uncountedItemsValue: uncountedItemValue,
      ));
      result.when(
        success: (data) => event.type == StockOrderUpdate.MARK_AS_COMPLETE
            ? emit(StockTakeMarkAsCompletedSuccess(stockTake: data))
            : emit(StockTakeSuccess(stockTake: data)),
        failure: (error) => emit(StockTakeMarkAsCompletedError(message: error.message)),
      );
    } catch (e) {
      emit(StockTakeMarkAsCompletedError(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    // Added to stop infinite polling upon leaving Stock Take menu.
    // Remove this when error is being returned when something fails in the server.
    // As we might want the feature to still poll in the background as long as it is not infinite.
    _isPolling = false;
    return super.close();
  }
}
