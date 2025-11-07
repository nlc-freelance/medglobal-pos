part of 'stock_transfer_remote_cubit.dart';

sealed class StockTransferRemoteState extends Equatable {
  const StockTransferRemoteState();

  @override
  List<Object?> get props => [];
}

final class StockTransferInitial extends StockTransferRemoteState {}

/// GetById
///
final class StockTransferByIdSuccess extends StockTransferRemoteState {
  final StockTransfer stockTransfer;
  const StockTransferByIdSuccess({required this.stockTransfer});

  @override
  List<Object?> get props => [stockTransfer];
}

/// Create
///
final class StockTransferCreateLoading extends StockTransferRemoteState {}

final class StockTransferCreateSuccess extends StockTransferRemoteState {
  final StockTransfer stockTransfer;
  const StockTransferCreateSuccess({required this.stockTransfer});

  @override
  List<Object?> get props => [stockTransfer];
}

/// Update
final class StockTransferSuccess extends StockTransferRemoteState {
  final StockTransfer stockTransfer;
  const StockTransferSuccess({required this.stockTransfer});

  @override
  List<Object?> get props => [stockTransfer];
}

/// Delete
final class StockTransferDeleteSuccess extends StockTransferRemoteState {}

/// Loading
///
final class StockTransferByIdLoading extends StockTransferRemoteState {}

final class StockTransferSaveLoading extends StockTransferRemoteState {}

final class StockTransferSaveAndMarkAsShippedLoading extends StockTransferRemoteState {}

final class StockTransferSaveAndReceivedLoading extends StockTransferRemoteState {}

final class StockTransferCancelLoading extends StockTransferRemoteState {}

final class StockTransferDeleteLoading extends StockTransferRemoteState {}

/// Error
///
final class StockTransferByIdError extends StockTransferRemoteState {
  final String message;
  const StockTransferByIdError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class StockTransferError extends StockTransferRemoteState {
  final String message;
  const StockTransferError({required this.message});

  @override
  List<Object?> get props => [message];
}
