import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';

part 'paginated_list_event.dart';
part 'paginated_list_state.dart';
part 'paginated_list_bloc.freezed.dart';

class PaginatedListBloc<T> extends Bloc<PaginatedListEvent<T>, PaginatedListState<T>> {
  final Future<Either<Failure, PaginatedList<T>>> Function({int? page, int? size}) _fetch;

  PaginatedListBloc(this._fetch) : super(PaginatedListState<T>.initial()) {
    on<_Fetch<T>>(_onFetch);
    on<_Reset<T>>(_onReset);
  }

  Future<void> _onFetch(event, Emitter<PaginatedListState<T>> emit) async {
    emit(PaginatedListState<T>.loading());

    try {
      final result = await _fetch(
        page: event.page,
        size: event.size,
      );

      result.fold(
        (failure) => emit(PaginatedListState<T>.failure(failure.message)),
        (data) => emit(PaginatedListState<T>.loaded(data)),
      );
    } catch (e) {
      emit(PaginatedListState<T>.failure(e.toString()));
    }
  }

  void _onReset(event, Emitter<PaginatedListState<T>> emit) => emit(PaginatedListState<T>.initial());
}
