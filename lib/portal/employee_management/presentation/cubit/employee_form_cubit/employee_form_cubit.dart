import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/cubit/role_access_cubit/role_access_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';

part 'employee_form_state.dart';
part 'employee_form_cubit.freezed.dart';

class EmployeeFormCubit extends Cubit<EmployeeFormState> {
  EmployeeFormCubit() : super(EmployeeFormState.initial());

  void loadEmployee(Employee employee) => emit(EmployeeFormState.fromEmployee(employee));

  void setFirstName(String firstName) => emit(state.copyWith(firstName: firstName));

  void setLastName(String lastName) => emit(state.copyWith(lastName: lastName));

  void setEmail(String email) => emit(state.copyWith(email: email));

  void setPhone(String phone) => emit(state.copyWith(phone: phone));

  void toggleAssignedBranch(BranchPartial branch) {
    final branches = state.assignedBranches;
    final exists = branches.any((b) => b.id == branch.id);

    if (exists) {
      removeAssignedBranch(branch);
      return;
    }

    final updatedAssignedBranches = [...branches, branch];
    emit(state.copyWith(assignedBranches: updatedAssignedBranches));
  }

  void removeAssignedBranch(BranchPartial branch) {
    final updatedAssignedBranches = state.assignedBranches.where((b) => b.id != branch.id).toList();
    emit(state.copyWith(assignedBranches: updatedAssignedBranches));
  }

  Employee toEmployee(RoleAccessState rbac) {
    return Employee(
      id: state.id,
      firstName: state.firstName!,
      lastName: state.lastName!,
      phone: state.phone!,
      email: state.email!,
      assignedBranches: state.assignedBranches,
      role: rbac.role!,
      systemAccess:
          rbac.systemAccess.entries.where((entry) => entry.value == true).map((system) => system.key).toList(),
      accessControls: rbac.accessControls.map((access) => access.toAccessControl()).toList(),
    );
  }
}
