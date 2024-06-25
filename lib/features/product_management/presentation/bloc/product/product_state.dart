part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class InitialProductState extends ProductState {
  const InitialProductState();

  @override
  List<Object?> get props => [];
}

class LoadingProductState extends ProductState {
  const LoadingProductState();

  @override
  List<Object?> get props => [];
}

class ErrorProductState extends ProductState {
  final String message;
  const ErrorProductState({required this.message});

  @override
  List<Object?> get props => [message];
}

///

class GetProductsState extends ProductState {
  final List<Product> products;
  const GetProductsState({required this.products});

  @override
  List<Object?> get props => [products];
}

class GetProductByIdState extends ProductState {
  final Product product;
  const GetProductByIdState({required this.product});

  @override
  List<Object?> get props => [product];
}

class CreateProductState extends ProductState {
  final String message = 'Product successfully created.';
  const CreateProductState();

  @override
  List<Object?> get props => [];
}

class UpdateProductState extends ProductState {
  final String message = 'Product successfully updated.';
  const UpdateProductState();

  @override
  List<Object?> get props => [];
}

class DeleteProductState extends ProductState {
  final String message = 'Product successfully deleted.';
  const DeleteProductState();

  @override
  List<Object?> get props => [];
}

class BulkUpdateProductState extends ProductState {
  final String message = 'All selected products have been successfully updated.';
  const BulkUpdateProductState();

  @override
  List<Object?> get props => [];
}

class BulkDeleteProductState extends ProductState {
  final String message = 'All selected products have been successfully deleted.';
  const BulkDeleteProductState();

  @override
  List<Object?> get props => [];
}
