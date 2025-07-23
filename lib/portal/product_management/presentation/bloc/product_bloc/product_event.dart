part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.getProductById(int id) = _GetProductById;
  const factory ProductEvent.createProduct(Product product) = _CreateProduct;
  const factory ProductEvent.updateProduct(Product product) = _UpdateProduct;
  const factory ProductEvent.deleteProduct(int productId, String productName) = _DeleteProduct;
}
