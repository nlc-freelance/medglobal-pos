part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class GetProductsEvent extends ProductEvent {
  final int page;
  const GetProductsEvent(this.page);

  @override
  List<Object> get props => [page];
}

class GetProductByIdEvent extends ProductEvent {
  final int id;
  const GetProductByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}

class CreateProductEvent extends ProductEvent {
  final Product product;
  const CreateProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

class UpdateProductEvent extends ProductEvent {
  final Product product;
  const UpdateProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

class DeleteProductEvent extends ProductEvent {
  final int id;
  const DeleteProductEvent(this.id);

  @override
  List<Object> get props => [id];
}

class BulkUpdateProductsEvent extends ProductEvent {
  final List<int> ids;
  final Category category;
  const BulkUpdateProductsEvent(this.ids, this.category);

  @override
  List<Object> get props => [ids, category];
}

class BulkDeleteProductsEvent extends ProductEvent {
  final List<int> ids;
  const BulkDeleteProductsEvent(this.ids);

  @override
  List<Object> get props => [ids];
}
