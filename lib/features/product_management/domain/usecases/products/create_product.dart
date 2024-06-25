import 'package:medglobal_admin_portal/features/product_management/data/dto/product_dto.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/variant.dart';

class CreateProductParams {
  final String name;
  final String category;
  final String? imageUrl;
  final List<Variant>? variants;

  CreateProductParams({required this.name, this.imageUrl, required this.category, this.variants});

  ProductDto get productDto => ProductDto(
        name: name,
        imageUrl: imageUrl,
        category: category,
        variants: variants?.map((variant) => variant.toDto()).toList(),
      );
}
