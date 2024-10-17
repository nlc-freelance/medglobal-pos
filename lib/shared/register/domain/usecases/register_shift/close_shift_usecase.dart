import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register_shift.dart';
import 'package:medglobal_admin_portal/shared/register/domain/repositories/register_shift_repository.dart';

class CloseShiftUseCase implements UseCase<RegisterShift, CloseShiftParams> {
  final RegisterShiftRepository repository;

  const CloseShiftUseCase(this.repository);

  @override
  Future<Either<Failure, RegisterShift>> call(CloseShiftParams params) => repository.closeShift(params.shift);
}

class CloseShiftParams {
  final RegisterShift shift;

  CloseShiftParams(this.shift);
}
