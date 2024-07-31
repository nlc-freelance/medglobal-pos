import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift/register_shift.dart';

abstract class RegisterShiftRepository {
  Future<Either<Failure, RegisterShift>> openShift(RegisterShift shift);
  Future<Either<Failure, RegisterShift>> closeShift(RegisterShift shift);
}
