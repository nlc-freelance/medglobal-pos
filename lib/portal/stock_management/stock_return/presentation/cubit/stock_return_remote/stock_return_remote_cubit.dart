import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/new_stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/usecases/create_stock_return_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/usecases/get_stock_return_by_id_usecase.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/usecases/update_stock_return_usecase.dart';

part 'stock_return_remote_state.dart';

class StockReturnRemoteCubit extends Cubit<StockReturnRemoteState> {
  final GetStockReturnByIdUseCase _getStockReturnByIdUsecase;
  final CreateStockReturnUseCase _createStockReturnUsecase;
  final UpdateStockReturnUseCase _updateStockReturnUsecase;

  StockReturnRemoteCubit(
    this._getStockReturnByIdUsecase,
    this._createStockReturnUsecase,
    this._updateStockReturnUsecase,
  ) : super(StockReturnInitial());

  void reset() => emit(StockReturnInitial());

  Future<void> getStockReturnById(int id) async {
    emit(StockReturnByIdLoading());

    try {
      final result = await _getStockReturnByIdUsecase.call(GetStockReturnByIdParams(id));
      result.when(
        success: (data) => emit(StockReturnByIdSuccess(stockReturn: data)),
        failure: (error) => emit(StockReturnByIdError(message: error.message)),
      );
    } catch (e) {
      emit(StockReturnByIdError(message: e.toString()));
    }
  }

  Future<void> create(NewStockReturn payload) async {
    emit(StockReturnCreateLoading());

    try {
      final result = await _createStockReturnUsecase.call(CreateStockReturnParams(payload));
      result.when(
        success: (data) => emit(StockReturnCreateSuccess(stockReturn: data)),
        failure: (error) => emit(StockReturnError(message: error.message)),
      );
    } catch (e) {
      emit(StockReturnError(message: e.toString()));
    }
  }

  Future<void> update(StockOrderUpdate type, {required int id, required StockReturn stockReturn}) async {
    if (type == StockOrderUpdate.SAVE) emit(StockReturnSaveLoading());
    if (type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED ||
        type == StockOrderUpdate.SAVE_AND_MARK_AS_SHIPPED_WITH_NEW_ITEMS) {
      emit(StockReturnSaveAndMarkAsShippedLoading());
    }

    try {
      final result = await _updateStockReturnUsecase.call(UpdateStockReturnParams(
        type,
        id: id,
        stockReturn: stockReturn,
      ));
      result.when(
        success: (data) => emit(StockReturnSuccess(stockReturn: data)),
        failure: (error) => emit(StockReturnError(message: error.message)),
      );
    } catch (e) {
      emit(StockReturnError(message: e.toString()));
    }
  }
}
