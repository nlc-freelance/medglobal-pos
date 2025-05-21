import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/repository/receipt_template_repository.dart';

part 'receipt_template_event.dart';
part 'receipt_template_state.dart';
part 'receipt_template_bloc.freezed.dart';

class ReceiptTemplateBloc extends Bloc<ReceiptTemplateEvent, ReceiptTemplateState> {
  final ReceiptTemplateRepository _repository;

  ReceiptTemplateBloc(this._repository) : super(const ReceiptTemplateState.initial()) {
    on<_GetReceiptTemplateById>(_onGetReceiptTemplateById);
    on<_CreateReceiptTemplate>(_onCreateReceiptTemplate);
    on<_UpdateReceiptTemplate>(_onUpdateReceiptTemplate);
    on<_DeleteReceiptTemplate>(_onDeleteReceiptTemplate);
  }

  Future<void> _onGetReceiptTemplateById(event, emit) async {
    emit(const ReceiptTemplateState.loading());
    try {
      final result = await _repository.getReceiptTemplate(event.id);

      result.fold(
        (failure) => emit(ReceiptTemplateState.loadFailed(failure.message)),
        (template) => emit(ReceiptTemplateState.loaded(template)),
      );
    } catch (e) {
      emit(ReceiptTemplateState.loadFailed(e.toString()));
    }
  }

  Future<void> _onCreateReceiptTemplate(event, emit) async {
    emit(const ReceiptTemplateState.processing());
    try {
      final result = await _repository.createReceiptTemplate(event.template);

      result.fold(
        (failure) => emit(ReceiptTemplateState.failure(failure.message)),
        (template) => emit(ReceiptTemplateState.success('${template.name} successfully created.')),
      );
    } catch (e) {
      emit(ReceiptTemplateState.failure(e.toString()));
    }
  }

  Future<void> _onUpdateReceiptTemplate(event, emit) async {
    emit(const ReceiptTemplateState.processing());
    try {
      final result = await _repository.updateReceiptTemplate(event.template);

      result.fold(
        (failure) => emit(ReceiptTemplateState.failure(failure.message)),
        (template) => emit(ReceiptTemplateState.success('${template.name} successfully updated.')),
      );
    } catch (e) {
      emit(ReceiptTemplateState.failure(e.toString()));
    }
  }

  Future<void> _onDeleteReceiptTemplate(event, emit) async {
    emit(const ReceiptTemplateState.processing());
    try {
      final result = await _repository.deleteReceiptTemplate(event.template.id);

      result.fold(
        (failure) => emit(ReceiptTemplateState.failure(failure.message)),
        (_) => emit(ReceiptTemplateState.success('${event.template.name} successfully deleted.')),
      );
    } catch (e) {
      emit(ReceiptTemplateState.failure(e.toString()));
    }
  }
}
