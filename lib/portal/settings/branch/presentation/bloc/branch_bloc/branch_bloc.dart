import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch_repository.dart';

part 'branch_event.dart';
part 'branch_state.dart';
part 'branch_bloc.freezed.dart';

class BranchBloc extends Bloc<BranchEvent, BranchState> {
  final BranchRepository _repository;

  BranchBloc(this._repository) : super(const BranchState.initial()) {
    on<_GetBranchById>(_onGetBranchById);
    on<_CreateBranch>(_onCreateBranch);
    on<_UpdateBranch>(_onUpdateBranch);
    on<_DeleteBranch>(_onDeleteBranch);
  }

  Future<void> _onGetBranchById(event, emit) async {
    emit(const BranchState.loading());
    try {
      final result = await _repository.getBranch(event.id);

      result.fold(
        (failure) => emit(BranchState.loadFailed(failure.message)),
        (branch) => emit(BranchState.loaded(branch)),
      );
    } catch (e) {
      emit(BranchState.loadFailed(e.toString()));
    }
  }

  Future<void> _onCreateBranch(event, emit) async {
    emit(const BranchState.submitting());
    try {
      final result = await _repository.createBranch(event.branch);

      result.fold(
        (failure) => emit(BranchState.failure(failure.message)),
        (_) => emit(BranchState.success('${event.branch.name} successfully created.')),
      );
    } catch (e) {
      emit(BranchState.failure(e.toString()));
    }
  }

  Future<void> _onUpdateBranch(event, emit) async {
    emit(const BranchState.submitting());
    try {
      final result = await _repository.updateBranch(event.branch);

      result.fold(
        (failure) => emit(BranchState.failure(failure.message)),
        (_) => emit(BranchState.success('${event.branch.name} successfully updated.')),
      );
    } catch (e) {
      emit(BranchState.failure(e.toString()));
    }
  }

  Future<void> _onDeleteBranch(event, emit) async {
    emit(const BranchState.submitting());
    try {
      final result = await _repository.deleteBranch(event.branch.id);

      result.fold(
        (failure) => emit(BranchState.failure('Deletion failed. ${failure.message}')),
        (_) => emit(BranchState.success('${event.branch.name} successfully deleted.')),
      );
    } catch (e) {
      emit(BranchState.failure(e.toString()));
    }
  }
}
