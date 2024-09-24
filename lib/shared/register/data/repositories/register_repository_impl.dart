import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/shared/register/data/api/register_api.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register_paginated_list.dart';
import 'package:medglobal_admin_portal/shared/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterApi _registerApi;

  RegisterRepositoryImpl(this._registerApi);

  @override
  Future<Either<Failure, RegisterPaginatedList>> getRegisters({required int page}) async {
    try {
      final response = await _registerApi.getRegisters(page: page);
      return Right(response);
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
