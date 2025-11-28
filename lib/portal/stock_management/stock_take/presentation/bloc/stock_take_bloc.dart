import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/new_stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/create_stock_take_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/get_stock_take_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/get_stock_take_items_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/update_stock_take_usecase.dart';

part 'stock_take_event.dart';
part 'stock_take_state.dart';

class StockTakeBloc extends Bloc<StockTakeEvent, StockTakeBlocRemoteState> {
  final GetStockTakeByIdUseCase _getStockTakeByIdUsecase;
  final CreateStockTakeUseCase _createStockTakeUsecase;
  final UpdateStockTakeUseCase _updateStockTakeUsecase;
  final GetStockTakeItemsByIdUseCase _getItemsByIdUseCase;

  StockTakeBloc(
    this._createStockTakeUsecase,
    this._getStockTakeByIdUsecase,
    this._updateStockTakeUsecase,
    this._getItemsByIdUseCase,
  ) : super(StockTakeInitial()) {
    on<GetStockTakeByIdEvent>(getStockTakeById);
    on<StartStockTakePollingEvent>(startStockTakePolling);
    on<CreateStockTakeEvent>(create);
    on<SaveStockTakeEvent>(_saveStockTake);
    on<CheckUncountedItemForCompletionEvent>(_checkUncountedItemsBeforeCompletion);
    on<CompleteStockTakeEvent>(_completeStockTake);
    on<CancelStockTakeEvent>(_cancelStockTake);
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

  Future<void> _saveStockTake(event, emit) async {
    emit(StockTakeSaveLoading());

    try {
      final result = await _updateStockTakeUsecase.call(UpdateStockTakeParams(
        StockOrderUpdate.SAVE,
        id: event.id,
        stockTake: event.stockTake,
      ));
      result.when(
        success: (data) => emit(StockTakeSuccess(stockTake: data)),
        failure: (error) => emit(StockTakeMarkAsCompletedError(message: error.message)),
      );
    } catch (e) {
      emit(StockTakeMarkAsCompletedError(message: e.toString()));
    }
  }

  Future<void> _checkUncountedItemsBeforeCompletion(
    CheckUncountedItemForCompletionEvent event,
    Emitter<StockTakeBlocRemoteState> emit,
  ) async {
    emit(StockTakeCheckingItemsForCompletion());

    try {
      final result = await _getItemsByIdUseCase.call(
        GetStockTakeItemsByIdParams(
          id: event.stockTake.id!,
          page: 1,
          size: 20,
          isCounted: false,
        ),
      );

      result.when(
        success: (data) => data.totalCount == 0
            ? emit(StockTakeReadyForCompletion(stockTake: event.stockTake))
            : emit(StockTakeConfirmUncountedItemAction(stockTake: event.stockTake)),
        failure: (error) => emit(StockTakeConfirmUncountedItemError(message: error.message)),
      );
    } catch (e) {
      emit(StockTakeConfirmUncountedItemError(message: e.toString()));
    }
  }

  Future<void> _completeStockTake(CompleteStockTakeEvent event, Emitter<StockTakeBlocRemoteState> emit) async {
    emit(StockTakeMarkAsCompletedLoading());

    final uncountedItemsValue = event.action == StockTakeItemAction.SET_QTY_TO_ZERO ? 0 : null;

    try {
      final result = await _updateStockTakeUsecase.call(UpdateStockTakeParams(
        StockOrderUpdate.MARK_AS_COMPLETE,
        id: event.id,
        stockTake: event.stockTake,
        uncountedItemsValue: uncountedItemsValue,
      ));
      result.when(
        success: (data) => emit(StockTakeMarkAsCompletedSuccess(stockTake: data)),
        failure: (error) => emit(StockTakeMarkAsCompletedError(message: error.message)),
      );
    } catch (e) {
      emit(StockTakeMarkAsCompletedError(message: e.toString()));
    }
  }

  Future<void> _cancelStockTake(CancelStockTakeEvent event, Emitter<StockTakeBlocRemoteState> emit) async {
    emit(StockTakeCancelLoading());

    try {
      final result = await _updateStockTakeUsecase.call(UpdateStockTakeParams(
        StockOrderUpdate.CANCEL,
        id: event.id,
        stockTake: event.stockTake,
      ));
      result.when(
        success: (data) => emit(StockTakeCancelSuccess(stockTake: data)),
        failure: (error) => emit(StockTakeMarkAsCompletedError(message: error.message)),
      );
    } catch (e) {
      emit(StockTakeMarkAsCompletedError(message: e.toString()));
    }
  }
}
