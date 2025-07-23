import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';

part 'lazy_list_event.dart';
part 'lazy_list_state.dart';
part 'lazy_list_bloc.freezed.dart';

class LazyListBloc<T> extends Bloc<LazyListEvent<T>, LazyListState<T>> {
  final Future<Either<Failure, PaginatedList<T>>> Function(PageQuery query) _fetch;

  LazyListBloc(this._fetch) : super(LazyListState<T>.initial()) {
    on<LazyListEvent<T>>(_onEvent);
  }

  int _currentPage = 1;
  int _totalCount = -1;
  final List<T> _cachedItems = [];

  Future<void> _onEvent(event, Emitter<LazyListState<T>> emit) async {
    await event.when(
      fetch: (forceRefresh) async {
        if (forceRefresh) {
          _currentPage = 1;
          _totalCount = -1;
          _cachedItems.clear();
        }

        // If is loading, or already reached max, do nothing
        if (state.hasReachedMax || state.isLoadingInitial || state.isLoadingMore) return;

        emit(state.copyWith(
          isLoadingInitial: _currentPage == 1,
          isLoadingMore: _currentPage > 1,
        ));

        try {
          final result = await _fetch(PageQuery(page: _currentPage, size: 10));

          result.fold(
            (error) => emit(state.copyWith(
              isLoadingInitial: false,
              isLoadingMore: false,
              error: error.message,
            )),
            (data) {
              _cachedItems.addAll(data.items);
              _totalCount = data.totalCount;

              final hasReachedMax = _cachedItems.length >= _totalCount;

              emit(state.copyWith(
                items: List.unmodifiable(_cachedItems),
                isLoadingInitial: false,
                isLoadingMore: false,
                hasReachedMax: hasReachedMax,
                hasNoData: data.hasNoItems,
                error: null,
              ));

              if (!hasReachedMax) _currentPage++;
            },
          );
        } catch (e) {
          emit(state.copyWith(
            isLoadingInitial: false,
            isLoadingMore: false,
            error: e.toString(),
          ));
        }
      },
      reset: () {
        _currentPage = 1;
        _totalCount = -1;
        _cachedItems.clear();
        emit(LazyListState<T>.initial());
      },
    );
  }
}
