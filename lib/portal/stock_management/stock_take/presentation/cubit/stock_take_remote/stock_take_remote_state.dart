part of 'stock_take_remote_cubit.dart';

sealed class StockTakeRemoteState extends Equatable {
  const StockTakeRemoteState();

  @override
  List<Object?> get props => [];
}

final class StockTakeInitial extends StockTakeRemoteState {}

/// GetById
///
final class StockTakeByIdSuccess extends StockTakeRemoteState {
  final StockTake stockTake;
  const StockTakeByIdSuccess({required this.stockTake});

  @override
  List<Object?> get props => [stockTake];
}

/// Create
///
final class StockTakeCreateLoading extends StockTakeRemoteState {}

final class StockTakeCreateSuccess extends StockTakeRemoteState {
  final StockTake stockTake;
  const StockTakeCreateSuccess({required this.stockTake});

  @override
  List<Object?> get props => [stockTake];
}

/// Update
final class StockTakeSuccess extends StockTakeRemoteState {
  final StockTake stockTake;
  const StockTakeSuccess({required this.stockTake});

  @override
  List<Object?> get props => [stockTake];
}

final class StockTakeMarkAsCompletedSuccess extends StockTakeRemoteState {
  final StockTake stockTake;
  const StockTakeMarkAsCompletedSuccess({required this.stockTake});

  @override
  List<Object?> get props => [stockTake];
}

/// Loading
///
final class StockTakeByIdLoading extends StockTakeRemoteState {}

final class StockTakeSaveLoading extends StockTakeRemoteState {}

final class StockTakeMarkAsCompletedLoading extends StockTakeRemoteState {}

final class StockTakeCancelLoading extends StockTakeRemoteState {}

/// Error
///
final class StockTakeByIdError extends StockTakeRemoteState {
  final String message;
  const StockTakeByIdError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class StockTakeError extends StockTakeRemoteState {
  final String message;
  const StockTakeError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class StockTakeMarkAsCompletedError extends StockTakeRemoteState {
  final String message;
  const StockTakeMarkAsCompletedError({required this.message});

  @override
  List<Object?> get props => [message];
}
