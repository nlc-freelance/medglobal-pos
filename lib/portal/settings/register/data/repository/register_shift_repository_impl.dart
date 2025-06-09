import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/enums/register_shift_enum.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/api/register_shift_api.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/request/create_register_shift_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register_shift.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_shift_repository.dart';

class RegisterShiftRepositoryImpl implements RegisterShiftRepository {
  final RegisterShiftApi _registerShiftApi;

  RegisterShiftRepositoryImpl(this._registerShiftApi);

  @override
  Future<Either<Failure, RegisterShift>> openShift({required int registerId, required double amount}) async {
    try {
      final request = CreateRegisterShiftDto(
        register: registerId,
        status: RegisterShiftStatus.open.name,
        openingAmount: amount,
      );

      final response = await _registerShiftApi.shift(request);
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, RegisterShift>> closeShift({required int registerId, required double amount}) async {
    try {
      final request = CreateRegisterShiftDto(
        register: registerId,
        status: RegisterShiftStatus.close.name,
        closingAmount: amount,
      );

      final response = await _registerShiftApi.shift(request);
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
