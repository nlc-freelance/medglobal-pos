part of 'stock_transfer_cubit.dart';

class StockTransferState extends Equatable {
  const StockTransferState(this.stockTransfer);

  final StockTransfer stockTransfer;

  @override
  List<Object> get props => [stockTransfer];

  factory StockTransferState.initial() => const StockTransferState(StockTransfer());
}
