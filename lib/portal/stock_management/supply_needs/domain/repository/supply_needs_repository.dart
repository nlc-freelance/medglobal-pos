import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/domain/entities/supply_need.dart';

abstract class SupplyNeedsRepository {
  Future<ApiResult<List<SupplyNeed>>> getSupplyNeeds({int? branchId});
}
