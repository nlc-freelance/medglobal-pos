import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_items/register_item_paginated_list.dart';

abstract class RegisterItemApi {
  Future<RegisterItemPaginatedList> getRegisterItems({String? search, String? category});
}

class RegisterItemApiImpl implements RegisterItemApi {
  final ApiService _apiService;

  RegisterItemApiImpl(this._apiService);

  @override
  Future<RegisterItemPaginatedList> getRegisterItems({String? search, String? category}) async {
    try {
      final branchId = await SharedPreferencesService.getRegisterBranchId();

      final response = await _apiService.collection<ProductVariantDto>(
        '/products/variants',
        queryParams: {'size': 100, 'branch': branchId, 'search': search, 'category': category},
        converter: ProductVariantDto.fromJson,
      );

      return RegisterItemPaginatedList(
        items: response.items?.map((item) => item.toRegisterItemEntity()).toList(),
        currentPage: response.pageInfo?.page,
        totalPages: response.pageInfo?.totalPages,
        totalCount: response.pageInfo?.totalCount,
      );
    } catch (e) {
      rethrow;
    }
  }
}

// List<RegisterItem> mock = [
//   const RegisterItem(id: 1, displayName: 'Absolute distilled water 350 ML', stock: 20, price: 25.75),
//   const RegisterItem(id: 2, displayName: 'Absolute distilled water 500 ML', stock: 20, price: 20.50),
//   const RegisterItem(id: 3, displayName: 'Absolute distilled water 1L', stock: 20, price: 20.50),
//   const RegisterItem(id: 4, displayName: 'Absolute distilled water 4L', stock: 20, price: 20.50),
//   const RegisterItem(id: 5, displayName: 'Absolute distilled water 6L', stock: 20, price: 30.50),
//   const RegisterItem(id: 7, displayName: 'Alaska 150g', stock: 50, price: 10.50),
//   const RegisterItem(id: 8, displayName: 'Alaska 450g', stock: 50, price: 10.50),
//   const RegisterItem(id: 9, displayName: 'Amoxicillin 100mg/ml', stock: 50, price: 10.50),
//   const RegisterItem(id: 10, displayName: 'Amoxicillin 125mg/5ml', stock: 50, price: 10.50),
//   const RegisterItem(id: 11, displayName: 'Amoxicillin 250mg', stock: 50, price: 10.50),
//   const RegisterItem(id: 12, displayName: 'Appebon Kid 60ml', stock: 50, price: 10.50),
//   const RegisterItem(id: 13, displayName: 'Appebon w/ iron 60ml', stock: 50, price: 10.50),
//   const RegisterItem(id: 14, displayName: 'Appebon w/ iron 120ml', stock: 50, price: 10.50),
//   const RegisterItem(id: 15, displayName: 'Babyflo powder blushy pink 50g', stock: 50, price: 10.50),
//   const RegisterItem(id: 16, displayName: 'Babyflo powder charming blue 50g', stock: 50, price: 10.50),
//   const RegisterItem(id: 17, displayName: 'Babyflo powder heavenly white 25g', stock: 50, price: 10.50),
//   const RegisterItem(id: 18, displayName: 'Babyflo powder heavenly white 50g', stock: 50, price: 10.50),
//   const RegisterItem(id: 19, displayName: 'Babyflo powder sweetie purple 25g', stock: 50, price: 10.50),
//   const RegisterItem(id: 20, displayName: 'Babyflo powder sweetie purple 50g', stock: 50, price: 10.50),
// ];
