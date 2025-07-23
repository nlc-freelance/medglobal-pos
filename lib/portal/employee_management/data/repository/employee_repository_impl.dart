import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/api/employee_api.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/request/create_employee_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/request/update_employee_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/repository/employee_repository.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeApi _employeeApi;

  EmployeeRepositoryImpl(this._employeeApi);

  @override
  Future<Either<Failure, PaginatedList<Employee>>> getEmployees(PageQuery query) async {
    try {
      final responseDto = await _employeeApi.getEmployees(query);

      return Right(responseDto.convert((item) => item.toDomain()));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Employee>> getEmployee(int id) async {
    try {
      final responseDto = await _employeeApi.getEmployeeById(id);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Employee>> createEmployee(Employee employee) async {
    try {
      final requestDto = CreateEmployeeDto.fromDomain(employee);
      final responseDto = await _employeeApi.createEmployee(requestDto);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Employee>> updateEmployee(Employee employee) async {
    try {
      final requestDto = UpdateEmployeeDto.fromDomain(employee);
      final responseDto = await _employeeApi.updateEmployee(requestDto);

      return Right(responseDto.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteEmployee(int id) async {
    try {
      return Right(await _employeeApi.deleteEmployee(id));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.message));
    }
  }
}
