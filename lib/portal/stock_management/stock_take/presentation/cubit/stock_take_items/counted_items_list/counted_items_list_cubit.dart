import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_items_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/get_stock_take_items_by_id_usecase.dart';

part 'counted_items_list_state.dart';

class CountedItemsListCubit extends Cubit<CountedItemsListState> {
  final GetStockTakeItemsByIdUseCase _getItemsByIdUseCase;
  CountedItemsListCubit(this._getItemsByIdUseCase) : super(CountedItemsListInitial());

  void reset() => emit(CountedItemsListInitial());

  Future<void> getItems({required int id, int page = 1, int size = 20, String? search}) async {
    emit(CountedItemsListLoading());

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
      result.when(
        success: (data) => emit(CountedItemsListLoaded(data: data, search: search)),
        failure: (error) => emit(CountedItemsListError(message: error.message)),
      );
    } catch (e) {
      emit(CountedItemsListError(message: e.toString()));
    }
  }
}
