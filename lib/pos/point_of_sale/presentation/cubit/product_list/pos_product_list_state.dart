part of 'pos_product_list_cubit.dart';

sealed class PosProductListState extends Equatable {
  const PosProductListState();

  @override
  List<Object> get props => [];
}

final class POSProductListInitial extends PosProductListState {}

final class POSProductListLoading extends PosProductListState {}

final class POSProductListLoaded extends PosProductListState {
  final List<POSProduct> products;
  final bool hasReachedMax;
  const POSProductListLoaded({required this.products, required this.hasReachedMax});

  @override
  List<Object> get props => [products, hasReachedMax];
}

final class POSProductListError extends PosProductListState {
  final String message;
  const POSProductListError({required this.message});

  @override
  List<Object> get props => [message];
}
