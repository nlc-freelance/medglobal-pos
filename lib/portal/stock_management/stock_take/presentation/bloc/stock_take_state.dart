part of 'stock_take_bloc.dart';

sealed class StockTakeBlocRemoteState extends Equatable {
  const StockTakeBlocRemoteState();

  @override
  List<Object?> get props => [];
}

final class StockTakeInitial extends StockTakeBlocRemoteState {}

/// GetById
///
final class StockTakeByIdSuccess extends StockTakeBlocRemoteState {
  final StockTake stockTake;
  const StockTakeByIdSuccess({required this.stockTake});

  @override
  List<Object?> get props => [stockTake];
}

/// Create
///
final class StockTakeCreateLoading extends StockTakeBlocRemoteState {}

final class StockTakeCreateSuccess extends StockTakeBlocRemoteState {
  final StockTake stockTake;
  const StockTakeCreateSuccess({required this.stockTake});

  @override
  List<Object?> get props => [stockTake];
}

final class StockTakePolling extends StockTakeBlocRemoteState {
  final StockOrderStatus status;
  const StockTakePolling(this.status);

  @override
  List<Object?> get props => [status];
}

final class StockTakePollingComplete extends StockTakeBlocRemoteState {
  /// Status is IN_PROGRESS, fetch both uncounted and counted items
  /// Status is COMPLETED, fetch counted items
  final StockOrderStatus status;
  const StockTakePollingComplete(this.status);

  @override
  List<Object?> get props => [status];
}

/// Update
final class StockTakeSuccess extends StockTakeBlocRemoteState {
  final StockTake stockTake;
  const StockTakeSuccess({required this.stockTake});

  @override
  List<Object?> get props => [stockTake];
}

/// Cancel
final class StockTakeCancelSuccess extends StockTakeBlocRemoteState {
  final StockTake stockTake;
  const StockTakeCancelSuccess({required this.stockTake});

  @override
  List<Object?> get props => [stockTake];
}

final class StockTakeMarkAsCompletedSuccess extends StockTakeBlocRemoteState {
  final StockTake stockTake;
  const StockTakeMarkAsCompletedSuccess({required this.stockTake});

  @override
  List<Object?> get props => [stockTake];
}

/// Loading
///
final class StockTakeByIdLoading extends StockTakeBlocRemoteState {}

final class StockTakeSaveLoading extends StockTakeBlocRemoteState {}

final class StockTakeMarkAsCompletedLoading extends StockTakeBlocRemoteState {}

final class StockTakeCancelLoading extends StockTakeBlocRemoteState {}

/// Error
///
final class StockTakeByIdError extends StockTakeBlocRemoteState {
  final String message;
  const StockTakeByIdError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class StockTakeError extends StockTakeBlocRemoteState {
  final String message;
  const StockTakeError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class StockTakeMarkAsCompletedError extends StockTakeBlocRemoteState {
  final String message;
  const StockTakeMarkAsCompletedError({required this.message});

  @override
  List<Object?> get props => [message];
}
