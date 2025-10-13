import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/app_dropdown.dart';
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
  late final EmployeeListFilterCubit _filterCubit;
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _filterCubit = context.read<EmployeeListFilterCubit>();
    _filterCubit.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        UISearchField(
          fieldWidth: 450.0,
          hint: 'Search employee name',
          icon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Assets.icons.search.svg(),
          ),
          onChanged: (value) => _debouncer.run(
            (() {
              _filterCubit.setSearch(value);
              _fetchWithAppliedFilters();
            }),
          ),
        ),
        AppDropdown<EmployeeRole>.static(
          items: EmployeeRole.values,
          hint: 'All Roles',
          getName: (item) => item.name.capitalized,
          onSelectItem: (item) {
            context.read<EmployeeListFilterCubit>().setRole(item.name);
            _fetchWithAppliedFilters();
          },
          onRemoveSelectedItem: () {
            context.read<EmployeeListFilterCubit>().setRole(null);
            _fetchWithAppliedFilters();
          },
        ),
        BranchDropdown.select(
          onRemoveSelectedItem: () {
            context.read<EmployeeListFilterCubit>().setBranch(null);
            _fetchWithAppliedFilters();
          },
          onSelectItem: (branch) {
            context.read<EmployeeListFilterCubit>().setBranch(branch.id);
            _fetchWithAppliedFilters();
          },
        ),
      ],
    );
  }

  void _fetchWithAppliedFilters() {
    final query = _filterCubit.state.toPageQuery;
    context.read<PaginatedListBloc<Employee>>().add(PaginatedListEvent.fetch(query: query));
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }
}
