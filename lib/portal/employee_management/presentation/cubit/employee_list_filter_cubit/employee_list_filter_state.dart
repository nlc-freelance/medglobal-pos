part of 'employee_list_filter_cubit.dart';

@freezed
class EmployeeListFilterState with _$EmployeeListFilterState {
  const factory EmployeeListFilterState({
    @Default(1) int page,
    @Default(20) int size,
    String? search,
    String? role,
    int? branchId,
    // @Default(PageQuery()) PageQuery filters,
  }) = _EmployeeListFilterState;

  const EmployeeListFilterState._();

  factory EmployeeListFilterState.initial() => const EmployeeListFilterState();

  PageQuery get filters => PageQuery(
        page: page,
        size: size,
        search: search,
        extra: {
          'role': role,
          'assignedStoreId': branchId,
        },
      );
}
