import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/request/create_employee_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/response/employee_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/request/update_employee_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_dto.dart';

class EmployeeApi {
  final ApiService _api;

  EmployeeApi({required ApiService api}) : _api = api;

  Future<PaginatedList<EmployeeDto>> getEmployees(PageQuery query) async {
    final data = await _api.getPaginated<EmployeeDto>(
      ApiEndpoints.employees,
      queryParams: query.toJson(),
      parser: (json) => parse(json, EmployeeDto.fromJson),
    );

    return PaginatedList<EmployeeDto>(
      items: data.items,
      currentSize: data.size,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<EmployeeDto> getEmployeeById(int id) async {
    final data = await _api.get(
      ApiEndpoints.employeeById(id),
      parser: (json) => parse(json, EmployeeDto.fromJson),
    );
    return data;
  }

  Future<PaginatedList<BranchDto>> getEmployeeAssignedBranches(int id, PageQuery query) async {
    final data = await _api.getPaginated<BranchDto>(
      ApiEndpoints.employeeAssignedBranches(id),
      queryParams: query.toJson(),
      parser: (json) => parse(json, BranchDto.fromJson),
    );

    return PaginatedList<BranchDto>(
      items: data.items,
      currentSize: data.size,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<EmployeeDto> createEmployee(CreateEmployeeDto dto) async {
    final data = await _api.post(
      ApiEndpoints.employees,
      data: dto.toJson(),
      parser: (json) => parse(json, EmployeeDto.fromJson),
    );
    return data;
  }

  Future<EmployeeDto> updateEmployee(UpdateEmployeeDto dto) async {
    final data = await _api.update(
      ApiEndpoints.employeeById(dto.id),
      data: dto.toJson(),
      parser: (json) => parse(json, EmployeeDto.fromJson),
    );
    return data;
  }

  Future<void> deleteEmployee(int id) async {
    return await _api.delete(ApiEndpoints.employeeById(id));
  }
}
