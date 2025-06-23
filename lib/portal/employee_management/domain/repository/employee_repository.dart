import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';

abstract class EmployeeRepository {
  /// Retrieves a list of all employees
  Future<Either<Failure, PaginatedList<Employee>>> getEmployees({required FilterList filters});

  /// Retrieves a employee by id
  Future<Either<Failure, Employee>> getEmployee(int id);

  /// Creates a new employee
  Future<Either<Failure, Employee>> createEmployee(Employee employee);

  /// Updates an existing employee
  Future<Either<Failure, Employee>> updateEmployee(Employee employee);

  /// Deletes a employee
  Future<Either<Failure, void>> deleteEmployee(int id);
}
