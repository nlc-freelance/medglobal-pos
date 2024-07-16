part of 'supply_needs_list_cubit.dart';

sealed class SupplyNeedListState extends Equatable {
  const SupplyNeedListState();

  @override
  List<Object> get props => [];
}

final class SupplyNeedListInitial extends SupplyNeedListState {}

final class SupplyNeedListLoading extends SupplyNeedListState {}

final class SupplyNeedListLoaded extends SupplyNeedListState {
  // final List<SupplyNeed> products;
  // const SupplyNeedListLoaded({required this.products});

  @override
  List<Object> get props => [];
}

final class SupplyNeedListError extends SupplyNeedListState {
  final String message;
  const SupplyNeedListError({required this.message});

  @override
  List<Object> get props => [message];
}
