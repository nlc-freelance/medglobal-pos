import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/data/dto/tax_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entity/tax.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/repository/tax_repository.dart';

part 'tax_event.dart';
part 'tax_state.dart';
part 'tax_bloc.freezed.dart';

class TaxBloc extends Bloc<TaxEvent, TaxState> {
  final TaxRepository _repository;

  TaxBloc(this._repository) : super(const TaxState.initial()) {
    on<_GetDefaultTaxCode>(_onGetDefaultTaxCode);
    on<_CreateTaxCode>(_onCreateTaxCode);
    on<_UpdateTaxCode>(_onUpdateTaxCode);
    on<_DeleteTaxCode>(_onDeleteTaxCode);
    on<_Reset>(_onReset);
  }

  Future<void> _onGetDefaultTaxCode(_GetDefaultTaxCode event, Emitter<TaxState> emit) async {
    emit(const TaxState.processing());
    try {
      final result = await _repository.getDefaultTaxCode();

      result.when(
        success: (defaultTax) => emit(TaxState.hasExistingDefault(defaultTax)),
        failure: (failure) => emit(TaxState.failure(failure.message)),
      );
    } catch (e) {
      emit(TaxState.failure(e.toString()));
    }
  }

  Future<void> _onCreateTaxCode(_CreateTaxCode event, Emitter<TaxState> emit) async {
    emit(const TaxState.processing());
    try {
      final payload = TaxPayload.fromTax(event.tax);
      final result = await _repository.createTaxCode(payload);

      result.when(
        success: (tax) => emit(TaxState.success('${tax.code} successfully created.')),
        failure: (failure) => emit(TaxState.failure(failure.message)),
      );
    } catch (e) {
      emit(TaxState.failure(e.toString()));
    }
  }

  Future<void> _onUpdateTaxCode(_UpdateTaxCode event, Emitter<TaxState> emit) async {
    emit(const TaxState.processing());
    try {
      final payload = TaxPayload.fromTax(event.tax);
      final result = await _repository.updateTaxCode(event.id, payload);

      result.when(
        success: (tax) => emit(TaxState.success('${tax.code} successfully updated.')),
        failure: (failure) => emit(TaxState.failure(failure.message)),
      );
    } catch (e) {
      emit(TaxState.failure(e.toString()));
    }
  }

  Future<void> _onDeleteTaxCode(_DeleteTaxCode event, Emitter<TaxState> emit) async {
    emit(const TaxState.processing());
    try {
      final result = await _repository.deleteTaxCode(event.id);

      result.when(
        success: (_) => emit(TaxState.deleted('${event.tax.code} successfully deleted.')),
        failure: (failure) => emit(TaxState.failure(failure.message)),
      );
    } catch (e) {
      emit(TaxState.failure(e.toString()));
    }
  }

  void _onReset(_, emit) => emit(const TaxState.initial());
}
