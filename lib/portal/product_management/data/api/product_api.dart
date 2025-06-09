import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/product_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';

class ProductApi {
  final BaseApiService _api;

  ProductApi(this._api);

  Future<List<ProductDto>> getProductList({String? search}) async {
    final response = await _api.getList(
      ApiEndpoint.products(),
      queryParams: {'size': 10, 'search': search},
      fromJson: ProductDto.fromJson,
    );

    return response.data;
  }

  Future<PaginatedList<ProductDto>> getProducts({int? page, int? size, String? search}) async {
    final response = await _api.getPaginated<ProductDto>(
      ApiEndpoints.products,
      queryParams: {
        if (page != null) 'page': page,
        'size': size ?? Sizes.defaultPageSize,
        if (search?.isNotEmpty != true) 'search': search,
      },
      fromJson: ProductDto.fromJson,
    );

    return PaginatedList<ProductDto>(
      items: response.data.items,
      currentSize: response.data.size,
      currentPage: response.data.page,
      totalPages: response.data.totalPages,
      totalCount: response.data.totalCount,
    );
  }

  Future<ProductDto> getProductById(int id) async {
    final response = await _api.get(
      ApiEndpoints.productById(id),
      fromJson: ProductDto.fromJson,
    );
    return response.data;
  }

  Future<ProductDto> createProduct(Product product) async {
    final response = await _api.post(
      ApiEndpoints.products,
      data: product.toProductPostRequest(),
      fromJson: ProductDto.fromJson,
    );

    return response.data;
  }

  Future<ProductDto> updateProduct(Product product) async {
    final response = await _api.update(
      ApiEndpoints.productById(product.id!),
      data: product.toProductPostRequest(),
      fromJson: ProductDto.fromJson,
    );
    return response.data;
  }

  Future<void> deleteProduct(int id) async {
    return await _api.delete(ApiEndpoints.productById(id));
  }

  Future<void> bulkDelete(List<int> ids) async {
    return await _api.deleteBulk<ProductDto>(
      ApiEndpoints.products,
      data: {'ids': ids},
    );
  }

  Future<void> bulkUpdate(List<int> ids, Category? category) async {
    await _api.update<ProductDto>(
      ApiEndpoint.products(),
      data: {'category': category?.toJson(), 'productList': ids},
      fromJson: ProductDto.fromJson,
    );
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
