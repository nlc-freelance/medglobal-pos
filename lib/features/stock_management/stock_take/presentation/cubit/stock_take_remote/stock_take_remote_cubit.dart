import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/new_stock_take.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/usecases/create_stock_take_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/usecases/get_stock_take_by_id_usecase.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/usecases/update_stock_take_usecase.dart';

part 'stock_take_remote_state.dart';

class StockTakeRemoteCubit extends Cubit<StockTakeRemoteState> {
  final GetStockTakeByIdUseCase _getStockTakeByIdUsecase;
  final CreateStockTakeUseCase _createStockTakeUsecase;
  final UpdateStockTakeUseCase _updateStockTakeUsecase;

  StockTakeRemoteCubit(
    this._getStockTakeByIdUsecase,
    this._createStockTakeUsecase,
    this._updateStockTakeUsecase,
  ) : super(StockTakeInitial());

  Future<void> getStockTakeById(int id) async {
    emit(StockTakeByIdLoading());

    try {
      final result = await _getStockTakeByIdUsecase.call(GetStockTakeByIdParams(id));
      result.fold(
        (error) => emit(StockTakeByIdError(message: error.message)),
        (data) => emit(StockTakeByIdSuccess(stockTake: data)),
      );
    } catch (e) {
      emit(StockTakeByIdError(message: e.toString()));
    }
  }

  Future<void> create(NewStockTake payload) async {
    emit(StockTakeCreateLoading());

    try {
      final result = await _createStockTakeUsecase.call(CreateStockTakeParams(payload));
      result.fold(
        (error) => emit(StockTakeError(message: error.message)),
        (data) => emit(StockTakeCreateSuccess(stockTake: data)),
      );
    } catch (e) {
      emit(StockTakeError(message: e.toString()));
    }
  }

  Future<void> update(StockOrderUpdate type, {required int id, required StockTake stockTake}) async {
    if (type == StockOrderUpdate.SAVE) emit(StockTakeSaveLoading());
    if (type == StockOrderUpdate.MARK_AS_COMPLETE) emit(StockTakeMarkAsCompletedLoading());
    if (type == StockOrderUpdate.CANCEL) emit(StockTakeCancelLoading());

    try {
      final result = await _updateStockTakeUsecase.call(UpdateStockTakeParams(type, id: id, stockTake: stockTake));
      result.fold(
        (error) => emit(StockTakeMarkAsCompletedError(message: error.message)),
        (_) => emit(type == StockOrderUpdate.MARK_AS_COMPLETE
            ? const StockTakeMarkAsCompletedSuccess(message: 'Stock Take updated successfully.')
            : const StockTakeSuccess(message: 'Stock Take updated successfully.')),
      );
    } catch (e) {
      emit(StockTakeMarkAsCompletedError(message: e.toString()));
    }
  }
}
