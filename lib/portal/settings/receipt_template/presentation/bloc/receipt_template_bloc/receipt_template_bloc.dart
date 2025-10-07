import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/receipt_template_payload.dart';
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

  Future<void> _onGetReceiptTemplateById(_GetReceiptTemplateById event, Emitter<ReceiptTemplateState> emit) async {
    emit(const ReceiptTemplateState.loading());
    try {
      final result = await _repository.getReceiptTemplate(event.id);

      result.when(
        success: (template) => emit(ReceiptTemplateState.loaded(template)),
        failure: (failure) => emit(ReceiptTemplateState.loadFailed(failure.message)),
      );
    } catch (e) {
      emit(ReceiptTemplateState.loadFailed(e.toString()));
    }
  }

  Future<void> _onCreateReceiptTemplate(_CreateReceiptTemplate event, Emitter<ReceiptTemplateState> emit) async {
    emit(const ReceiptTemplateState.processing());
    try {
      final payload = ReceiptTemplatePayload.fromReceiptTemplate(event.template);
      final result = await _repository.createReceiptTemplate(payload);

      result.when(
        success: (template) => emit(ReceiptTemplateState.success('${template.name} successfully created.')),
        failure: (failure) => emit(ReceiptTemplateState.failure(failure.message)),
      );
    } catch (e) {
      emit(ReceiptTemplateState.failure(e.toString()));
    }
  }

  Future<void> _onUpdateReceiptTemplate(_UpdateReceiptTemplate event, Emitter<ReceiptTemplateState> emit) async {
    emit(const ReceiptTemplateState.processing());
    try {
      final template = event.template;
      final payload = ReceiptTemplatePayload.fromReceiptTemplate(template);

      final result = await _repository.updateReceiptTemplate(template.id!, payload);

      result.when(
        success: (template) => emit(ReceiptTemplateState.success('${template.name} successfully updated.')),
        failure: (failure) => emit(ReceiptTemplateState.failure(failure.message)),
      );
    } catch (e) {
      emit(ReceiptTemplateState.failure(e.toString()));
    }
  }

  Future<void> _onDeleteReceiptTemplate(_DeleteReceiptTemplate event, Emitter<ReceiptTemplateState> emit) async {
    emit(const ReceiptTemplateState.processing());
    try {
      final template = event.template;

      final result = await _repository.deleteReceiptTemplate(template.id!);

      result.when(
        success: (_) => emit(ReceiptTemplateState.success('${template.name} successfully deleted.')),
        failure: (failure) => emit(ReceiptTemplateState.failure(failure.message)),
      );
    } catch (e) {
      emit(ReceiptTemplateState.failure(e.toString()));
    }
  }
}
