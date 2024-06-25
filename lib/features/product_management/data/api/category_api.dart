import 'package:medglobal_admin_portal/core/network/api_endpoint.dart';
import 'package:medglobal_admin_portal/core/network/api_service.dart';
import 'package:medglobal_admin_portal/features/product_management/data/dto/category_dto.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/category.dart';

abstract class CategoryApi {
  Future<void> add(Category category);
}

class CategoryApiImpl implements CategoryApi {
  final ApiService api;

  const CategoryApiImpl(this.api);

  @override
  Future<void> add(Category category) async {
    try {
      await api.post<CategoryDto>(
        ApiEndpoint.products(),
        data: category.toJson(),
        converter: CategoryDto.fromJson,
      );
    } catch (_) {
      rethrow;
    }
  }
}
