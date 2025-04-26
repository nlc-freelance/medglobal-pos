import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register_shift.dart';

abstract class RegisterShiftRepository {
  Future<Either<Failure, RegisterShift>> openShift({required int registerId, required double amount});
  Future<Either<Failure, RegisterShift>> closeShift({required int registerId, required double amount});
}
