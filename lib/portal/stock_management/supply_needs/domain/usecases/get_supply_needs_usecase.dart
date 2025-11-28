import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/domain/entities/supply_need.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/domain/repository/supply_needs_repository.dart';

class GetSupplyNeedsUseCase implements UseCase<List<SupplyNeed>, GetSupplyNeedsParams> {
  final SupplyNeedsRepository _repository;

  GetSupplyNeedsUseCase(this._repository);

  @override
  Future<ApiResult<List<SupplyNeed>>> call(GetSupplyNeedsParams params) =>
      _repository.getSupplyNeeds(branchId: params.branchId);
}

class GetSupplyNeedsParams {
  final int? branchId;

  GetSupplyNeedsParams({this.branchId});
}
