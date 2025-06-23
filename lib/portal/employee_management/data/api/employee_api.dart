import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/request/create_employee_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/response/employee_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/request/update_employee_dto.dart';

class EmployeeApi {
  final BaseApiService _api;

  EmployeeApi(this._api);

  Future<PaginatedList<EmployeeDto>> getEmployees({required FilterList filters}) async {
    final response = await _api.getPaginated<EmployeeDto>(
      ApiEndpoints.employees,
      queryParams: filters.toJson(),
      fromJson: EmployeeDto.fromJson,
    );

    return PaginatedList<EmployeeDto>(
      items: response.data.items,
      currentSize: response.data.size,
      currentPage: response.data.page,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
  }

  Future<EmployeeDto> getEmployeeById(int id) async {
    final response = await _api.get(
      ApiEndpoints.employeeById(id),
      fromJson: EmployeeDto.fromJson,
    );
    return response.data;
  }

  Future<EmployeeDto> createEmployee(CreateEmployeeDto dto) async {
    final response = await _api.post(
      ApiEndpoints.employees,
      data: dto.toJson(),
      fromJson: EmployeeDto.fromJson,
    );
    return response.data;
  }

  Future<EmployeeDto> updateEmployee(UpdateEmployeeDto dto) async {
    final response = await _api.update(
      ApiEndpoints.employeeById(dto.id),
      data: dto.toJson(),
      fromJson: EmployeeDto.fromJson,
    );
    return response.data;
  }

  Future<void> deleteEmployee(int id) async {
    return await _api.delete(ApiEndpoints.employeeById(id));
  }
}
