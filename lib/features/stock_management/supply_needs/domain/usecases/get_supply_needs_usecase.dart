import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/core.dart';

import 'package:medglobal_admin_portal/features/stock_management/supply_needs/domain/entities/supply_need.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/domain/repository/supply_needs_repository.dart';

class GetSupplyNeedsUseCase implements UseCase<List<SupplyNeed>, GetSupplyNeedsParams> {
  final SupplyNeedsRepository _repository;

  GetSupplyNeedsUseCase(this._repository);

  @override
  Future<Either<Failure, List<SupplyNeed>>> call(GetSupplyNeedsParams params) =>
      _repository.getSupplyNeeds(branchId: params.branchId);
}

class GetSupplyNeedsParams {
  final int? branchId;

  GetSupplyNeedsParams({this.branchId});
}
