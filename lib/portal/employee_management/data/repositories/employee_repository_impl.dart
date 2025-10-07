import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/api/employee_api.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/request/create_employee_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/request/update_employee_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/repository/employee_repository.dart';

/// Concrete implementation of [EmployeeRepository] that uses [EmployeeApi] for API calls
/// and [BaseRepository] to centralize error handling.
class EmployeeRepositoryImpl extends BaseRepository implements EmployeeRepository {
  final EmployeeApi _employeeApi;

  EmployeeRepositoryImpl(this._employeeApi);

  @override
  Future<ApiResult<PaginatedList<Employee>>> getEmployees(PageQuery query) {
    return call(() async {
      final response = await _employeeApi.getEmployees(query);
      return response.convert((item) => item.toDomain());
    });
  }

  @override
  Future<ApiResult<Employee>> getEmployee(int id) {
    return call(() async {
      final response = await _employeeApi.getEmployeeById(id);
      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<Employee>> createEmployee(Employee employee) {
    return call(() async {
      final payload = CreateEmployeeDto.fromDomain(employee);
      final response = await _employeeApi.createEmployee(payload);

      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<Employee>> updateEmployee(Employee employee) {
    return call(() async {
      final payload = UpdateEmployeeDto.fromDomain(employee);
      final response = await _employeeApi.updateEmployee(payload);

      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<void>> deleteEmployee(int id) {
    return call(() async {
      await _employeeApi.deleteEmployee(id);
    });
  }
}
