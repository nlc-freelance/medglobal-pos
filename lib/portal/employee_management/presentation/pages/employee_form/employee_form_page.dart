import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/bloc/employee_bloc/employee_bloc.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/employee_form_cubit/employee_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/role_access_cubit/role_access_cubit.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/employee_form_view.dart';

class EmployeeFormPage extends StatelessWidget {
  const EmployeeFormPage({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => EmployeeFormCubit()),
        BlocProvider(create: (_) => RoleAccessCubit()),
        BlocProvider(create: (_) => GetIt.I<EmployeeBloc>()),
      ],
      child: EmployeeForm(id: id),
    );
  }
}

class EmployeeForm extends StatefulWidget {
  const EmployeeForm({super.key, this.id});

  final String? id;

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  late final EmployeeFormCubit _employeeFormCubit;

  @override
  void initState() {
    super.initState();
    _employeeFormCubit = context.read<EmployeeFormCubit>();

    if (_isEditMode) {
      final employeeId = int.parse(widget.id!);
      context.read<EmployeeBloc>().add(EmployeeEvent.getEmployee(employeeId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeBloc, EmployeeState>(
      listener: (_, state) => state.maybeWhen(
        loaded: (employee) => _onLoadEmployee(employee),
        processing: () => PageLoader.show(context),
        success: (message) => _onSuccess(context, message),
        failure: (message) => _onFailure(context, message),
        orElse: () => {},
      ),
      builder: (context, state) => state.maybeWhen(
        initial: () => _isEditMode ? const LoadingView() : const EmployeeFormView(),
        loading: () => const LoadingView(),
        loadFailed: (message) => FailureView(message),
        orElse: () => EmployeeFormView(isEditMode: _isEditMode),
      ),
    );
  }

  bool get _isEditMode => widget.id != null;

  void _onLoadEmployee(Employee employee) {
    _employeeFormCubit.loadEmployee(employee);
    context.read<RoleAccessCubit>().loadRoleAccess(employee);
  }

  void _onSuccess(BuildContext context, String message) {
    // Reload the list of employees
    context.read<PaginatedListBloc<Employee>>().add(const PaginatedListEvent.fetch());

    PageLoader.close();
    SnackbarUtil.success(context, message);

    context.goNamed('employeeList');
  }

  void _onFailure(BuildContext context, String message) {
    PageLoader.close();
    SnackbarUtil.error(context, message);
  }
}
