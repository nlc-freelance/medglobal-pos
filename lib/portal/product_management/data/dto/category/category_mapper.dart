import 'package:medglobal_admin_portal/portal/product_management/data/dto/category/category_dto.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';

class CategoryMapper {
  CategoryMapper._();

  /// Converts a [CategoryDto] to a [Category] entity
  static Category fromDto(CategoryDto dto) {
    return Category(
      id: dto.id,
      name: dto.name,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  /// Converts a list of [CategoryDto] to [Category] entities
  static List<Category> fromDtoList(List<CategoryDto> dtos) {
    return dtos.map(fromDto).toList();
  }
}
