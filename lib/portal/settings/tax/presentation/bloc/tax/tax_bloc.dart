import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/entities/tax.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/domain/repository/tax_repository.dart';

part 'tax_event.dart';
part 'tax_state.dart';
part 'tax_bloc.freezed.dart';

class TaxBloc extends Bloc<TaxEvent, TaxState> {
  final TaxRepository _repository;

  TaxBloc(this._repository) : super(const TaxState.initial()) {
    on<_GetTaxCodeById>(_onGetTaxCodeById);
    on<_CreateTaxCode>(_onCreateTaxCode);
    on<_UpdateTaxCode>(_onUpdateTaxCode);
    on<_DeleteTaxCode>(_onDeleteTaxCode);
    on<_Reset>(_onReset);
  }

  Future<void> _onGetTaxCodeById(event, emit) async {
    emit(const TaxState.loading());
    try {
      final result = await _repository.getTaxCode(event.id);

      result.fold(
        (failure) => emit(TaxState.failure(failure.message)),
        (tax) => emit(TaxState.success(tax)),
      );
    } catch (e) {
      emit(TaxState.failure(e.toString()));
    }
  }

  Future<void> _onCreateTaxCode(event, emit) async {
    emit(const TaxState.loading());
    try {
      final result = await _repository.createTaxCode(event.tax);

      result.fold(
        (failure) => emit(TaxState.failure(failure.message)),
        (tax) {
          print('tax success');
          emit(TaxState.success(tax, message: 'Tax code successfully created.'));
        },
      );
    } catch (e) {
      emit(TaxState.failure(e.toString()));
    }
  }

  Future<void> _onUpdateTaxCode(event, emit) async {
    emit(const TaxState.loading());
    try {
      final result = await _repository.updateTaxCode(event.tax);

      result.fold(
        (failure) => emit(TaxState.failure(failure.message)),
        (tax) => emit(TaxState.success(tax, message: 'Tax code ${event.tax.code} successfully updated.')),
      );
    } catch (e) {
      emit(TaxState.failure(e.toString()));
    }
  }

  Future<void> _onDeleteTaxCode(event, emit) async {
    emit(const TaxState.loading());
    try {
      final result = await _repository.deleteTaxCode(event.id);

      result.fold(
        (failure) => emit(TaxState.failure(failure.message)),
        (tax) => emit(const TaxState.deleted('Tax code successfully deleted.')),
      );
    } catch (e) {
      emit(TaxState.failure(e.toString()));
    }
  }

  void _onReset(_, emit) => emit(const TaxState.initial());
}
