// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:medglobal_admin_portal/pos/receipt_config/domain/entities/receipt_configuration.dart';
// import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch_repository.dart';
//
// part 'receipt_config_event.dart';
// part 'receipt_config_state.dart';
// part 'receipt_config_bloc.freezed.dart';
//
// class ReceiptConfigurationBloc extends Bloc<ReceiptConfigurationEvent, ReceiptConfigurationState> {
//   final BranchRepository _repository;
//   ReceiptConfigurationBloc(this._repository) : super(const ReceiptConfigurationState.initial()) {
//     on<_GetReceiptConfigurationByBranchId>(_getReceiptConfigurationByBranchId);
//   }
//
//   Future<void> _getReceiptConfigurationByBranchId(event, emit) async {
//     emit(const ReceiptConfigurationState.loading());
//     try {
//       final result = await _repository.getReceiptConfigurationByBranchId(event.id);
//
//       result.fold(
//         (failure) => emit(ReceiptConfigurationState.failure(failure.message)),
//         (config) => emit(ReceiptConfigurationState.loaded(config)),
//       );
//     } catch (e) {
//       emit(ReceiptConfigurationState.failure(e.toString()));
//     }
//   }
// }
