import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/receipt_config.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch_repository.dart';

part 'receipt_config_event.dart';
part 'receipt_config_state.dart';
part 'receipt_config_bloc.freezed.dart';

class ReceiptConfigBloc extends Bloc<ReceiptConfigEvent, ReceiptConfigState> {
  final BranchRepository _repository;
  ReceiptConfigBloc(this._repository) : super(const ReceiptConfigState.initial()) {
    on<_GetReceiptConfigByBranchId>(_getReceiptConfigByBranchId);
  }

  Future<void> _getReceiptConfigByBranchId(event, emit) async {
    emit(const ReceiptConfigState.loading());
    try {
      final result = await _repository.getReceiptConfigByBranchId(event.id);

      result.fold(
        (failure) => emit(ReceiptConfigState.failure(failure.message)),
        (config) => emit(ReceiptConfigState.loaded(config)),
      );
    } catch (e) {
      emit(ReceiptConfigState.failure(e.toString()));
    }
  }
}
