import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';

part 'lazy_list_event.dart';
part 'lazy_list_state.dart';
part 'lazy_list_bloc.freezed.dart';

class LazyListBloc<T> extends Bloc<LazyListEvent<T>, LazyListState<T>> {
  final int _pageSize = 10;
  int _currentPage = 1;

  final Future<Either<Failure, PaginatedList<T>>> Function({int? page, int? size}) _fetch;

  LazyListBloc(this._fetch) : super(LazyListState<T>.initial()) {
    on<_Fetch<T>>(_onFetch);
    on<_Refresh<T>>(_onRefresh);
    on<_Reset<T>>(_onReset);
  }

  Future<void> _onFetch(event, Emitter<LazyListState<T>> emit) async {
    // If is loading, or already reached max, do nothing
    if (state.isLoadingInitial || state.isLoadingMore || state.hasReachedMax) return;

    if (state.items.isEmpty) {
      emit(state.copyWith(isLoadingInitial: true));
    } else {
      emit(state.copyWith(isLoadingMore: true));
    }

    try {
      final result = await _fetch(page: _currentPage, size: _pageSize);

      result.fold(
        (failure) => emit(state.copyWith(
          isLoadingInitial: false,
          isLoadingMore: false,
          error: failure.message,
        )),
        (data) {
          final allItems = [...state.items, ...data.items];
          emit(state.copyWith(
            items: allItems,
            isLoadingInitial: false,
            isLoadingMore: false,
            hasReachedMax: data.hasReachedMax,
            hasNoData: data.hasNoItems,
            error: null,
          ));
        },
      );
      _currentPage++;
    } catch (e) {
      emit(state.copyWith(
        isLoadingInitial: false,
        isLoadingMore: false,
        error: e.toString(),
      ));
    }
  }

  Future<void> _onRefresh(event, Emitter<LazyListState<T>> emit) async {
    emit(state.copyWith(
      items: [],
      isLoadingInitial: true,
      isLoadingMore: false,
      hasReachedMax: false,
      hasNoData: false,
      error: null,
    ));

    try {
      _currentPage = 1;

      final result = await _fetch(page: _currentPage, size: _pageSize);

      result.fold(
        (failure) => emit(state.copyWith(
          isLoadingInitial: false,
          isLoadingMore: false,
          error: failure.message,
        )),
        (data) {
          emit(state.copyWith(
            items: data.items,
            isLoadingInitial: false,
            isLoadingMore: false,
            hasReachedMax: data.hasReachedMax,
            hasNoData: data.hasNoItems,
            error: null,
          ));
        },
      );

      _currentPage = 1;
    } catch (e) {
      emit(state.copyWith(
        isLoadingInitial: false,
        isLoadingMore: false,
        error: e.toString(),
      ));
    }
  }

  void _onReset(event, Emitter<LazyListState<T>> emit) => emit(LazyListState<T>.initial());
}
