import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/api/base_api_service.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/data/dto/supply_need_dto.dart';

class SupplyNeedsApi {
  final ApiService _api;

  SupplyNeedsApi({required ApiService api}) : _api = api;

  Future<List<SupplyNeedDto>> getSupplyNeeds({int? branchId}) async {
    final data = await _api.getList<SupplyNeedDto>(
      '/products/supply-needs',
      queryParams: {'branch': branchId},
      parser: (json) => parse(json, SupplyNeedDto.fromJson),
    );

    // Map<int, List<SupplyNeedItemDto>> supplyNeedsByBranch = {};
    // response.items?.forEach((item) {
    //   supplyNeedsByBranch[item.branch!.id!] = item.items ?? [];
    // });

    return data;
  }
}
