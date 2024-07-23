part of 'stock_transfer_list_remote_cubit.dart';

sealed class StockTransferListRemoteState extends Equatable {
  const StockTransferListRemoteState();

  @override
  List<Object> get props => [];
}

final class StockTransferListInitial extends StockTransferListRemoteState {}

final class StockTransferListLoading extends StockTransferListRemoteState {}

final class StockTransferListLoaded extends StockTransferListRemoteState {
  final List<StockTransfer> stockTransfers;
  const StockTransferListLoaded({required this.stockTransfers});

  @override
  List<Object> get props => [stockTransfers];
}

final class StockTransferListError extends StockTransferListRemoteState {
  final String message;
  const StockTransferListError({required this.message});

  @override
  List<Object> get props => [message];
}
