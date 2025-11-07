import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/data/api/supply_needs_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/domain/entities/supply_need.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/domain/repository/supply_needs_repository.dart';

/// Concrete implementation of [SupplyNeedsRepository] that uses [SupplyNeedsApi] for API calls
/// and [BaseRepository] to centralize error handling.
class SupplyNeedsRepositoryImpl extends BaseRepository implements SupplyNeedsRepository {
  final SupplyNeedsApi _api;

  SupplyNeedsRepositoryImpl(this._api);

  @override
  Future<ApiResult<List<SupplyNeed>>> getSupplyNeeds({int? branchId}) {
    return call(() async {
      final response = await _api.getSupplyNeeds(branchId: branchId);
      return response.map((dto) => dto.toEntity()).toList();
    });
  }
}
