part of 'register_item_list_remote_cubit.dart';

sealed class POSProductListRemoteState extends Equatable {
  const POSProductListRemoteState();

  @override
  List<Object> get props => [];
}

final class POSProductListInitial extends POSProductListRemoteState {}

final class POSProductListLoading extends POSProductListRemoteState {}

final class POSProductListLoaded extends POSProductListRemoteState {
  final List<POSProduct> products;
  final bool hasReachedMax;
  const POSProductListLoaded({required this.products, required this.hasReachedMax});

  @override
  List<Object> get props => [products, hasReachedMax];
}

final class POSProductListError extends POSProductListRemoteState {
  final String message;
  const POSProductListError({required this.message});

  @override
  List<Object> get props => [message];
}
