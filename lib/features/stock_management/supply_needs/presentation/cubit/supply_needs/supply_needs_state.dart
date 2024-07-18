part of 'supply_needs_cubit.dart';

sealed class SupplyNeedsState extends Equatable {
  const SupplyNeedsState();

  @override
  List<Object> get props => [];
}

final class SupplyNeedsInitial extends SupplyNeedsState {}

final class SupplyNeedsLoading extends SupplyNeedsState {}

final class SupplyNeedsLoaded extends SupplyNeedsState {
  final List<SupplyNeed> supplyNeeds;
  const SupplyNeedsLoaded({required this.supplyNeeds});

  @override
  List<Object> get props => [supplyNeeds];
}

final class SupplyNeedsError extends SupplyNeedsState {
  final String message;
  const SupplyNeedsError({required this.message});

  @override
  List<Object> get props => [message];
}
