import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/pos/register/data/api/register_shift_api.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift/register_shift.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/register_shift_repository.dart';

class RegisterShiftRepositoryImpl implements RegisterShiftRepository {
  final RegisterShiftApi _registerShiftApi;

  RegisterShiftRepositoryImpl(this._registerShiftApi);

  @override
  Future<Either<Failure, RegisterShift>> openShift(RegisterShift shift) async {
    try {
      final response = await _registerShiftApi.openShift(shift);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, RegisterShift>> closeShift(RegisterShift shift) async {
    try {
      final response = await _registerShiftApi.openShift(shift);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
