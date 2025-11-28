import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';

class ProductBulkUpdatePayload {
  final List<int> productList;
  final Category? category;

  const ProductBulkUpdatePayload({
    required this.productList,
    this.category,
  });
}

extension ProductBulkUpdatePayloadExt on ProductBulkUpdatePayload {
  Map<String, dynamic> toJson() {
    return {
      'productList': productList,
      'category': category != null
          ? {
              'id': category!.id,
              'name': category!.name,
              'createdAt': category!.createdAt!.toIso8601String(),
              'updatedAt': category!.updatedAt!.toIso8601String(),
            }
          : null,
    };
  }
}
