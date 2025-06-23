import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';

part 'employee_list_filter_state.dart';
part 'employee_list_filter_cubit.freezed.dart';

class EmployeeListFilterCubit extends Cubit<EmployeeListFilterState> {
  EmployeeListFilterCubit() : super(EmployeeListFilterState.initial());

  void setPageAndSize(int page, int size) => emit(state.copyWith(page: page, size: size));

  void setSearch(String search) => emit(state.copyWith(search: search));

  void setRole(String? role) => emit(state.copyWith(role: role));

  void setBranch(int? branchId) => emit(state.copyWith(branchId: branchId));

  // void setPageAndSize(int page, int size) {
  //   final updatedFilters = state.filters.copyWith(page: page, size: size);
  //   emit(state.copyWith(filters: updatedFilters));
  // }

  // void setSearch(String search) {
  //   final updatedFilters = state.filters.copyWith(search: search);
  //   emit(state.copyWith(filters: updatedFilters));
  // }

  // void setRole(String? role) {
  //   final extras = Map<String, dynamic>.from(state.filters.extra);
  //   role == null ? extras.remove('role') : extras['role'] = role;
  //   final updatedFilters = state.filters.copyWith(extra: extras);
  //   emit(state.copyWith(filters: updatedFilters));
  // }

  // void setBranch(int? branchId) {
  //   final extras = Map<String, dynamic>.from(state.filters.extra);
  //   branchId == null ? extras.remove('branchId') : extras['branchId'] = branchId;
  //   final updatedFilters = state.filters.copyWith(extra: extras);
  //   emit(state.copyWith(filters: updatedFilters));
  // }

  void reset() => emit(EmployeeListFilterState.initial());
}
