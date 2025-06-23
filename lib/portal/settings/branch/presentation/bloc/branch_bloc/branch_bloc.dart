import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
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

  Future<void> _onGetDefaultReceipt(event, emit) async {
    emit(const BranchState.initializingNewBranch());

    try {
      final result = await _receiptTemplateRepository.getReceiptTemplates(filters: const FilterList());

      result.fold(
        (failure) => emit(BranchState.failure(failure.message)),
        (data) {
          // Check if there's a user-defined default receipt template
          // If not, use the system default
          // TODO: Check if BE has an endpoint that returns the default receipt template and the system default
          final userDefault = data.items.firstWhereOrNull((item) => item.isDefault);
          final systemDefault = data.items.firstWhere((item) => item.isSystemDefault);

          if (userDefault != null) {
            emit(BranchState.newBranch(userDefault));
          } else {
            emit(BranchState.newBranch(systemDefault));
          }
        },
      );
    } catch (e) {
      emit(BranchState.failure(e.toString()));
    }
  }

  Future<void> _onGetBranchById(event, emit) async {
    emit(const BranchState.loading());
    try {
      final result = await _branchRepository.getBranch(event.id);

      result.fold(
        (failure) => emit(BranchState.loadFailed(failure.message)),
        (branch) => emit(BranchState.loaded(branch)),
      );
    } catch (e) {
      emit(BranchState.loadFailed(e.toString()));
    }
  }

  Future<void> _onCreateBranch(event, emit) async {
    emit(const BranchState.processing());
    try {
      final result = await _branchRepository.createBranch(event.branch);

      result.fold(
        (failure) => emit(BranchState.failure(failure.message)),
        (_) => emit(BranchState.success('${event.branch.name} successfully created.')),
      );
    } catch (e) {
      emit(BranchState.failure(e.toString()));
    }
  }

  Future<void> _onUpdateBranch(event, emit) async {
    emit(const BranchState.processing());
    try {
      final result = await _branchRepository.updateBranch(event.branch);

      result.fold(
        (failure) => emit(BranchState.failure(failure.message)),
        (_) => emit(BranchState.success('${event.branch.name} successfully updated.')),
      );
    } catch (e) {
      emit(BranchState.failure(e.toString()));
    }
  }

  Future<void> _onDeleteBranch(event, emit) async {
    emit(const BranchState.processing());
    try {
      final result = await _branchRepository.deleteBranch(event.branch.id);

      result.fold(
        (failure) => emit(BranchState.failure('Deletion failed. ${failure.message}')),
        (_) => emit(BranchState.success('${event.branch.name} successfully deleted.')),
      );
    } catch (e) {
      emit(BranchState.failure(e.toString()));
    }
  }
}
