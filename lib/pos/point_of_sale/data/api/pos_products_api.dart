// import 'package:medglobal_admin_portal/core/network/api_service.dart';
// import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
// import 'package:medglobal_admin_portal/portal/stock_management/variants/product_variant_dto.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/pos_product_paginated_list.dart';
//
// abstract class POSProductApi {
//   Future<POSProductPaginatedList> getProductCatalog({required int page, String? search, String? category});
// }
//
// class POSProductApiImpl implements POSProductApi {
//   final ApiService _apiService;
//
//   POSProductApiImpl(this._apiService);
//
//   @override
//   Future<POSProductPaginatedList> getProductCatalog({required int page, String? search, String? category}) async {
//     try {
//       final branchId = await SharedPreferencesService.getRegisterBranchId();
//
//       final response = await _apiService.collection<ProductVariantDto>(
//         '/products/variants',
//
//         /// TODO: Replace size to 10 when category filters are added
//         queryParams: {'page': page, 'size': 15, 'search': search, 'branch': branchId, 'category': category},
//         converter: ProductVariantDto.fromJson,
//       );
//
//       return POSProductPaginatedList(
//         data: response.items?.map((item) => item.toPOSProductEntity()).toList(),
//         currentPage: response.pageInfo?.page,
//         totalPages: response.pageInfo?.totalPages,
//         totalCount: response.pageInfo?.totalCount,
//       );
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
