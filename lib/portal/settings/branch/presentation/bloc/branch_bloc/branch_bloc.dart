import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/repository/receipt_template_repository.dart';

part 'branch_event.dart';
part 'branch_state.dart';
part 'branch_bloc.freezed.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final BranchRepository _branchRepository;
  final ReceiptTemplateRepository _receiptTemplateRepository;

  BranchBloc(
    this._branchRepository,
    this._receiptTemplateRepository,
  ) : super(const BranchState.initial()) {
    on<_GetDefaultReceipt>(_onGetDefaultReceipt);
    on<_GetBranchById>(_onGetBranchById);
    on<_CreateBranch>(_onCreateBranch);
    on<_UpdateBranch>(_onUpdateBranch);
    on<_DeleteBranch>(_onDeleteBranch);
  }

  Future<void> _onGetDefaultReceipt(_GetDefaultReceipt event, Emitter<BranchState> emit) async {
    emit(const BranchState.initializingNewBranch());

    try {
      final result = await _receiptTemplateRepository.getReceiptTemplates(const PageQuery());

      result.when(
        success: (data) {
          // Check if there's a user-defined default receipt template
          // If not, use the system default
          final userDefault = data.items.firstWhereOrNull((item) => item.isDefault);
          final systemDefault = data.items.firstWhere((item) => item.isSystemDefault);

          if (userDefault != null) {
            emit(BranchState.newBranch(userDefault));
          } else {
            emit(BranchState.newBranch(systemDefault));
          }
        },
        failure: (failure) => emit(BranchState.failure(failure.message)),
      );
    } catch (e) {
      emit(BranchState.failure(e.toString()));
    }
  }

  Future<void> _onGetBranchById(_GetBranchById event, Emitter<BranchState> emit) async {
    emit(const BranchState.loading());
    try {
      final result = await _branchRepository.getBranch(event.id);

      result.when(
        success: (branch) => emit(BranchState.loaded(branch)),
        failure: (failure) => emit(BranchState.loadFailed(failure.message)),
      );
    } catch (e) {
      emit(BranchState.loadFailed(e.toString()));
    }
  }

  Future<void> _onCreateBranch(_CreateBranch event, Emitter<BranchState> emit) async {
    emit(const BranchState.processing());
    try {
      final payload = BranchPayload.fromBranch(event.branch);
      final result = await _branchRepository.createBranch(payload);

      result.when(
        success: (branch) => emit(BranchState.success('${branch.name} successfully created.')),
        failure: (failure) => emit(BranchState.failure(failure.message)),
      );
    } catch (e) {
      emit(BranchState.failure(e.toString()));
    }
  }

  Future<void> _onUpdateBranch(_UpdateBranch event, Emitter<BranchState> emit) async {
    emit(const BranchState.processing());
    try {
      final branch = event.branch;
      final payload = BranchPayload.fromBranch(branch);

      final result = await _branchRepository.updateBranch(branch.id!, payload);

      result.when(
        success: (branch) => emit(BranchState.success('${branch.name} successfully updated.')),
        failure: (failure) => emit(BranchState.failure(failure.message)),
      );
    } catch (e) {
      emit(BranchState.failure(e.toString()));
    }
  }

  Future<void> _onDeleteBranch(_DeleteBranch event, Emitter<BranchState> emit) async {
    emit(const BranchState.processing());
    try {
      final result = await _branchRepository.deleteBranch(event.id);

      result.when(
        success: (_) => emit(BranchState.success('${event.name} successfully deleted.')),
        failure: (failure) => emit(BranchState.failure('Deletion failed. ${failure.message}')),
      );
    } catch (e) {
      emit(BranchState.failure(e.toString()));
    }
  }
}
