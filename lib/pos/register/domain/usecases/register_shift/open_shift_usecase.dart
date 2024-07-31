import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/usecases/usecase.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_shift/register_shift.dart';
import 'package:medglobal_admin_portal/pos/register/domain/repositories/register_shift_repository.dart';

class OpenShiftUseCase implements UseCase<RegisterShift, OpenShiftParams> {
  final RegisterShiftRepository repository;

  const OpenShiftUseCase(this.repository);

  @override
  Future<Either<Failure, RegisterShift>> call(OpenShiftParams params) => repository.openShift(params.shift);
}

class OpenShiftParams {
  final RegisterShift shift;

  OpenShiftParams(this.shift);
}
