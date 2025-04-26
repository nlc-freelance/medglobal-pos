import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/enums/register_shift.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/shared/register/data/api/register_shift_api.dart';
import 'package:medglobal_admin_portal/shared/register/data/dto/register_shift_request_dto.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register_shift.dart';
import 'package:medglobal_admin_portal/shared/register/domain/repositories/register_shift_repository.dart';

class RegisterShiftRepositoryImpl implements RegisterShiftRepository {
  final RegisterShiftApi _registerShiftApi;

  RegisterShiftRepositoryImpl(this._registerShiftApi);

  @override
  Future<Either<Failure, RegisterShift>> openShift({required int registerId, required double amount}) async {
    try {
      final request = RegisterShiftRequestDto(
        register: registerId,
        status: RegisterShiftStatus.open.name,
        openingAmount: amount,
      );

      final response = await _registerShiftApi.shift(request);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, RegisterShift>> closeShift({required int registerId, required double amount}) async {
    try {
      final request = RegisterShiftRequestDto(
        register: registerId,
        status: RegisterShiftStatus.close.name,
        closingAmount: amount,
      );

      final response = await _registerShiftApi.shift(request);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
