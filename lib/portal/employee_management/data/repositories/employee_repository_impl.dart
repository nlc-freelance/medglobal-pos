import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/api/employee_api.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/request/create_employee_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/request/update_employee_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/repository/employee_repository.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_mapper.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';

/// Concrete implementation of [EmployeeRepository] that uses [EmployeeApi] for API calls
/// and [BaseRepository] to centralize error handling.
class EmployeeRepositoryImpl extends BaseRepository implements EmployeeRepository {
  final EmployeeApi _api;

  EmployeeRepositoryImpl({required EmployeeApi api}) : _api = api;

  @override
  Future<ApiResult<PaginatedList<Employee>>> getEmployees(PageQuery query) {
    return call(() async {
      final response = await _api.getEmployees(query);
      return response.convert((item) => item.toDomain());
    });
  }

  @override
  Future<ApiResult<Employee>> getEmployee(int id) {
    return call(() async {
      final response = await _api.getEmployeeById(id);
      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<PaginatedList<Branch>>> getEmployeeAssignedBranches(int id, PageQuery query) {
    return call(() async {
      final response = await _api.getEmployeeAssignedBranches(id, query);
      return response.convert((item) => BranchMapper.fromDto(item));
    });
  }

  @override
  Future<ApiResult<Employee>> createEmployee(Employee employee) {
    return call(() async {
      final payload = CreateEmployeeDto.fromDomain(employee);
      final response = await _api.createEmployee(payload);

      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<Employee>> updateEmployee(Employee employee) {
    return call(() async {
      final payload = UpdateEmployeeDto.fromDomain(employee);
      final response = await _api.updateEmployee(payload);

      return response.toDomain();
    });
  }

  @override
  Future<ApiResult<void>> deleteEmployee(int id) {
    return call(() async {
      await _api.deleteEmployee(id);
    });
  }
}
