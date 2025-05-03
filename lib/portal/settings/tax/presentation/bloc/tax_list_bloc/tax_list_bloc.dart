import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entities/tax.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/repository/tax_repository.dart';

part 'tax_list_event.dart';
part 'tax_list_state.dart';
part 'tax_list_bloc.freezed.dart';

class TaxListBloc extends Bloc<TaxListEvent, TaxListState> {
  final TaxRepository _repository;

  TaxListBloc(this._repository) : super(const TaxListState.initial()) {
    on<_GetAllTaxCodes>(_onGetAllTaxCodes);
  }

  Future<void> _onGetAllTaxCodes(event, emit) async {
    emit(const TaxListState.loading());

    try {
      final result = await _repository.getTaxCodes(
        page: event.page,
        size: event.size,
      );

      result.fold(
        (failure) => emit(TaxListState.failure(failure.message)),
        (data) => emit(TaxListState.success(data)),
      );
    } catch (e) {
      emit(TaxListState.failure(e.toString()));
    }
  }
}
