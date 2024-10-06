import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_items_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/get_stock_take_items_by_id_usecase.dart';

part 'counted_items_list_state.dart';

class CountedItemsListCubit extends Cubit<CountedItemsListState> {
  final GetStockTakeItemsByIdUseCase _getItemsByIdUseCase;
  CountedItemsListCubit(this._getItemsByIdUseCase) : super(StockTakeCountedItemsListInitial());

  Future<void> getItems({required int id, int page = 1, int size = 20, String? search}) async {
    emit(StockTakeCountedItemsListLoading());

    try {
      final result = await _getItemsByIdUseCase.call(
        GetStockTakeItemsByIdParams(
          id: id,
          page: page,
          size: size,
          isCounted: true,
          search: search,
        ),
      );
      result.fold(
        (error) => emit(StockTakeCountedItemsListError(message: error.message)),
        (data) => emit(StockTakeCountedItemsListLoaded(data: data, search: search)),
      );
    } catch (e) {
      emit(StockTakeCountedItemsListError(message: e.toString()));
    }
  }
}
