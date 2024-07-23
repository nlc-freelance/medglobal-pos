import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift.dart';

abstract class RegisterShiftRepository {
  Future<Either<Failure, void>> openShift(RegisterShift shift);
  Future<Either<Failure, void>> closeShift(RegisterShift shift);
}
