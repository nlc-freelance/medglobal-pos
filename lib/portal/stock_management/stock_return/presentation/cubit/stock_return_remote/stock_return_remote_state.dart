part of 'stock_return_remote_cubit.dart';

sealed class StockReturnRemoteState extends Equatable {
  const StockReturnRemoteState();

  @override
  List<Object?> get props => [];
}

final class StockReturnInitial extends StockReturnRemoteState {}

/// GetById
///
final class StockReturnByIdSuccess extends StockReturnRemoteState {
  final StockReturn stockReturn;
  const StockReturnByIdSuccess({required this.stockReturn});

  @override
  List<Object?> get props => [stockReturn];
}

/// Create
///
final class StockReturnCreateLoading extends StockReturnRemoteState {}

final class StockReturnCreateSuccess extends StockReturnRemoteState {
  final StockReturn stockReturn;
  const StockReturnCreateSuccess({required this.stockReturn});

  @override
  List<Object?> get props => [stockReturn];
}

/// Update
final class StockReturnSuccess extends StockReturnRemoteState {
  final StockReturn stockReturn;
  const StockReturnSuccess({required this.stockReturn});

  @override
  List<Object?> get props => [stockReturn];
}

/// Loading
///
final class StockReturnByIdLoading extends StockReturnRemoteState {}

final class StockReturnSaveLoading extends StockReturnRemoteState {}

final class StockReturnSaveAndMarkAsShippedLoading extends StockReturnRemoteState {}

/// Error
///
final class StockReturnByIdError extends StockReturnRemoteState {
  final String message;
  const StockReturnByIdError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class StockReturnError extends StockReturnRemoteState {
  final String message;
  const StockReturnError({required this.message});

  @override
  List<Object?> get props => [message];
}
