import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/data/dto/supply_need_dto.dart';

abstract class SupplyNeedsApi {
  Future<List<SupplyNeedDto>> getSupplyNeeds({int? branchId});
}

class SupplyNeedsApiImpl implements SupplyNeedsApi {
  final ApiService _apiService;

  SupplyNeedsApiImpl(this._apiService);

  @override
  Future<List<SupplyNeedDto>> getSupplyNeeds({int? branchId}) async {
    try {
      final response = await _apiService.getData<SupplyNeedDto>(
        '/products/supply-needs',
        queryParams: {'branch': branchId},
        converter: SupplyNeedDto.fromJson,
      );

      // Map<int, List<SupplyNeedItemDto>> supplyNeedsByBranch = {};
      // response.items?.forEach((item) {
      //   supplyNeedsByBranch[item.branch!.id!] = item.items ?? [];
      // });

      return response.items!;
    } catch (e) {
      rethrow;
    }
  }
}
