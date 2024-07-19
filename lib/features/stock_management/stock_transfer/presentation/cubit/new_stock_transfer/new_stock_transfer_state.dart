part of 'new_stock_transfer_cubit.dart';

class NewStockTransferState extends Equatable {
  const NewStockTransferState(this.payload);

  final NewStockTransfer payload;

  @override
  List<Object> get props => [payload];

  factory NewStockTransferState.initial() => NewStockTransferState(NewStockTransfer());
}
