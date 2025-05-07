import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch1.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/repository/branch1_repository.dart';

part 'branch_list_event.dart';
part 'branch_list_state.dart';
part 'branch_list_bloc.freezed.dart';

class BranchListBloc extends Bloc<BranchListEvent, BranchListState> {
  final Branch1Repository _repository;

  BranchListBloc(this._repository) : super(const BranchListState.initial()) {
    on<_GetBranches>(_onGetBranches);
  }

  Future<void> _onGetBranches(event, emit) async {
    emit(const BranchListState.loading());

    try {
      final result = await _repository.getBranches(
        page: event.page,
        size: event.size,
      );

      result.fold(
        (failure) => emit(BranchListState.failure(failure.message)),
        (data) => emit(BranchListState.success(data)),
      );
    } catch (e) {
      emit(BranchListState.failure(e.toString()));
    }
  }
}
