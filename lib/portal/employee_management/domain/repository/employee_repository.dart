import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';

abstract class EmployeeRepository {
  /// Retrieves a list of all employees
  Future<ApiResult<PaginatedList<Employee>>> getEmployees(PageQuery query);

  /// Retrieves a employee by id
  Future<ApiResult<Employee>> getEmployee(int id);

  /// Retrieves branches assigned to employee
  Future<ApiResult<PaginatedList<Branch>>> getEmployeeAssignedBranches(int id, PageQuery query);

  /// Creates a new employee
  Future<ApiResult<Employee>> createEmployee(Employee employee);

  /// Updates an existing employee
  Future<ApiResult<Employee>> updateEmployee(Employee employee);

  /// Deletes a employee
  Future<ApiResult<void>> deleteEmployee(int id);
}
