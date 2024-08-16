import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_items/register_item_paginated_list.dart';

abstract class RegisterItemApi {
  Future<RegisterItemPaginatedList> getRegisterItems({required int page, String? search, String? category});
}

class RegisterItemApiImpl implements RegisterItemApi {
  final ApiService _apiService;

  RegisterItemApiImpl(this._apiService);

  @override
  Future<RegisterItemPaginatedList> getRegisterItems({required int page, String? search, String? category}) async {
    try {
      final branchId = await SharedPreferencesService.getRegisterBranchId();

      final response = await _apiService.collection<ProductVariantDto>(
        '/products/variants',
        queryParams: {'page': page, 'size': 20, 'search': search, 'branch': branchId, 'category': category},
        converter: ProductVariantDto.fromJson,
      );

      return RegisterItemPaginatedList(
        data: response.items?.map((item) => item.toRegisterItemEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (e) {
      rethrow;
    }
  }
}
