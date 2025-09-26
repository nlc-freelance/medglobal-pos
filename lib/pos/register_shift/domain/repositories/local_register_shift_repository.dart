import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';

import '../entities/register_shift.dart';

abstract class LocalRegisterShiftRepository {
  Future<Either<Failure, RegisterShift>> openShift(RegisterShift shift);
  Future<Either<Failure, RegisterShift?>> getOpenShift(int registerId);
  Future<Either<Failure, RegisterShift>> closeShift(int shiftId, double amount);
  Future<Either<Failure, RegisterShift?>> getLastClosedShift(int registerId);
  Future<Either<Failure, RegisterShift>> getShiftById(int id);
}
