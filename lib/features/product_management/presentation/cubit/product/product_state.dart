part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductByIdLoading extends ProductState {}

final class ProductByIdSuccess extends ProductState {
  final Product product;
  const ProductByIdSuccess({required this.product});

  @override
  List<Object?> get props => [product];
}

final class ProductByIdError extends ProductState {
  final String message;
  const ProductByIdError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final String message;
  const ProductSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

final class ProductError extends ProductState {
  final String message;
  const ProductError({required this.message});

  @override
  List<Object?> get props => [message];
}
