part of 'product_bulk_bloc.dart';

@freezed
class ProductBulkEvent with _$ProductBulkEvent {
  const factory ProductBulkEvent.bulkUpdateProduct({required List<int> ids, required Category category}) =
      _BulkUpdateProduct;
  const factory ProductBulkEvent.bulkDeleteProduct(List<int> ids) = _BulkDeleteProduct;
}
