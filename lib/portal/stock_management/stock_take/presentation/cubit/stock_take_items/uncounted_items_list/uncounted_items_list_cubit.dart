import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_items_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/usecases/get_stock_take_items_by_id_usecase.dart';

part 'uncounted_items_list_state.dart';

class UncountedItemsListCubit extends Cubit<UncountedItemsListState> {
  final GetStockTakeItemsByIdUseCase _getItemsByIdUseCase;
  UncountedItemsListCubit(this._getItemsByIdUseCase) : super(UncountedItemsListInitial());

  void reset() => emit(UncountedItemsListInitial());

  Future<void> getItems({required int id, int page = 1, int size = 20, String? search}) async {
    emit(UncountedItemsListLoading());

    try {
      final result = await _getItemsByIdUseCase.call(
        GetStockTakeItemsByIdParams(
          id: id,
          page: page,
          size: size,
          isCounted: false,
          search: search,
        ),
      );
      result.fold(
        (error) => emit(UncountedItemsListError(message: error.message)),
        (data) => emit(UncountedItemsListLoaded(data: data, search: search)),
      );
    } catch (e) {
      emit(UncountedItemsListError(message: e.toString()));
    }
  }
}
