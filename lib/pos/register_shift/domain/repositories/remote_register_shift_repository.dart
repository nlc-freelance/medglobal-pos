import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/enums/register_shift_enum.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';

import '../entities/register_shift.dart';

abstract class RemoteRegisterShiftRepository {
  Future<Either<Failure, void>> sendShift(Map<String, dynamic> payload);
  // Future<Either<Failure, void>> sendShift(RegisterShift shift);
}
