import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/dropdown.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/employee_list_filter_cubit/employee_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/access_control/role_section.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class EmployeeFilters extends StatefulWidget {
  const EmployeeFilters({super.key});

  @override
  State<EmployeeFilters> createState() => _EmployeeFiltersState();
}

class _EmployeeFiltersState extends State<EmployeeFilters> {
  late final EmployeeListFilterCubit _employeeListFilterCubit;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _employeeListFilterCubit = context.read<EmployeeListFilterCubit>();
    _employeeListFilterCubit.reset();
  }

  @override
  Widget build(BuildContext context) {
    return DataGridToolbar(
      search: UISearchField(
        fieldWidth: 500.0,
        hint: 'Search employee name',
        icon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Assets.icons.search.svg(),
        ),
        onChanged: (value) => _debouncer.run(
          (() {
            _employeeListFilterCubit.setSearch(value);
            context
                .read<PaginatedListBloc<Employee>>()
                .add(PaginatedListEvent.fetch(filters: _employeeListFilterCubit.state.filters));
          }),
        ),
      ),
      filters: [
        const UIHorizontalSpace(8),
        Dropdown<EmployeeRole>.list(
          items: EmployeeRole.values,
          hint: 'All Roles',
          getName: (item) => item.name.capitalized,
          onSelectItem: (item) {
            context.read<EmployeeListFilterCubit>().setRole(item.name);
            context
                .read<PaginatedListBloc<Employee>>()
                .add(PaginatedListEvent.fetch(filters: _employeeListFilterCubit.state.filters));
          },
          onRemoveSelectedItem: () {
            context.read<EmployeeListFilterCubit>().setRole(null);
            context
                .read<PaginatedListBloc<Employee>>()
                .add(PaginatedListEvent.fetch(filters: _employeeListFilterCubit.state.filters));
          },
        ),
        const UIHorizontalSpace(8),
        BranchDropdown.select(
          onRemoveSelectedItem: () {
            context.read<EmployeeListFilterCubit>().setBranch(null);
            context
                .read<PaginatedListBloc<Employee>>()
                .add(PaginatedListEvent.fetch(filters: _employeeListFilterCubit.state.filters));
          },
          onSelectItem: (branch) {
            context.read<EmployeeListFilterCubit>().setBranch(branch.id);
            context
                .read<PaginatedListBloc<Employee>>()
                .add(PaginatedListEvent.fetch(filters: _employeeListFilterCubit.state.filters));
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }
}
