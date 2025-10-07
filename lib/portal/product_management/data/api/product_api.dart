import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/core/network/new/json_parser_utils.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_bulk_delete_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_bulk_update_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/payload/product_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product/product_dto.dart';

class ProductApi {
  final ApiService _api;

  ProductApi(this._api);

  Future<PaginatedList<ProductDto>> getProducts(PageQuery query) async {
    final data = await _api.getPaginated<ProductDto>(
      ApiEndpoints.products,
      queryParams: query.toJson(),
      parser: (json) => parse(json, ProductDto.fromJson),
    );

    return PaginatedList<ProductDto>(
      items: data.items,
      currentSize: data.size,
      currentPage: data.page,
      totalPages: data.totalPages,
      totalCount: data.totalCount,
    );
  }

  Future<ProductDto> getProductById(int id) async {
    final data = await _api.get(
      ApiEndpoints.productById(id),
      parser: (json) => parse(json, ProductDto.fromJson),
    );
    return data;
  }

  Future<ProductDto> createProduct(ProductPayload payload) async {
    final data = await _api.post(
      ApiEndpoints.products,
      data: payload.toJson(),
      parser: (json) => parse(json, ProductDto.fromJson),
    );

    return data;
  }

  Future<ProductDto> updateProduct(int id, ProductPayload payload) async {
    final data = await _api.update(
      ApiEndpoints.productById(id),
      data: payload.toJson(),
      parser: (json) => parse(json, ProductDto.fromJson),
    );
    return data;
  }

  Future<void> deleteProduct(int id) async {
    return await _api.delete(ApiEndpoints.productById(id));
  }

  Future<void> bulkDeleteProducts(ProductBulkDeletePayload payload) async {
    return await _api.deleteBulk<ProductDto>(
      ApiEndpoints.products,
      data: payload.toJson(),
    );
  }

  Future<void> bulkUpdateProducts(ProductBulkUpdatePayload payload) async {
    await _api.updateBulk<ProductDto>(
      ApiEndpoint.products(),
      data: payload.toJson(),
    );
  }

  Future<List<ProductDto>> getProductsBy({String? search}) async {
    final data = await _api.getList(
      ApiEndpoint.products(),
      queryParams: {'size': 10, 'search': search},
      parser: (json) => parse(json, ProductDto.fromJson),
    );

    return data;
  }
}

// class ProductApiImpl implements ProductApi {
//   final ApiService _apiService;

//   ProductApiImpl(this._apiService);

//   @override
//   Future<ProductPaginatedList> getProducts({required int page, required int size, String? search}) async {
//     try {
//       final response = await _apiService.collection<ProductDto>(
//         ApiEndpoint.products(),
//         queryParams: {'page': page, 'size': size, if (search != null) 'search': search},
//         converter: ProductDto.fromJson,
//       );

//       return ProductPaginatedList(
//         products: response.items?.map((item) => item.toDomain()).toList(),
//         currentPage: response.pageInfo?.page,
//         totalPages: response.pageInfo?.totalPages,
//         totalCount: response.pageInfo?.totalCount,
//       );
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<void> bulkDelete(List<int> ids) async {
//     try {
//       return await _apiService.delete<ProductDto>(
//         ApiEndpoint.products(),
//         data: {'ids': ids},
//       );
//     } catch (_) {
//       rethrow;
//     }
//   }

//   @override
//   Future<void> bulkUpdate(List<int> ids, Category? category) async {
//     try {
//       await _apiService.update<ProductDto>(
//         ApiEndpoint.products(),
//         data: {'category': category?.toJson(), 'productList': ids},
//         converter: ProductDto.fromJson,
//       );
//     } catch (_) {
//       rethrow;
//     }
//   }

//   @override
//   Future<ProductDto> getProductById(int id) async {
//     try {
//       return await _apiService.get<ProductDto>(
//         ApiEndpoint.products(id),
//         converter: ProductDto.fromJson,
//       );
//     } catch (_) {
//       rethrow;
//     }
//   }

//   @override
//   Future<ProductDto> create(Product product) async {
//     try {
//       return await _apiService.post<ProductDto>(
//         ApiEndpoint.products(),
//         data: product.toProductPostRequest(),
//         converter: ProductDto.fromJson,
//       );
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<ProductDto> update(int id, Product product) async {
//     try {
//       return await _apiService.update<ProductDto>(
//         ApiEndpoint.products(id),
//         data: product.toProductPostRequest(),
//         converter: ProductDto.fromJson,
//       );
//     } catch (_) {
//       rethrow;
//     }
//   }

//   @override
//   Future<void> delete(int id) async {
//     try {
//       await _apiService.delete<ProductDto>(ApiEndpoint.products(id));
//     } catch (_) {
//       rethrow;
//     }
//   }

//   @override
//   Future<List<ProductDto>> searchProducts({String? search}) async {
//     try {
//       final response = await _apiService.collection<ProductDto>(
//         ApiEndpoint.products(),
//         queryParams: {'size': 10, 'search': search},
//         converter: ProductDto.fromJson,
//       );

//       return response.items ?? [];
//     } catch (_) {
//       rethrow;
//     }
//   }
// }
