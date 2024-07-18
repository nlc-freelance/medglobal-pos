part of 'new_stock_return_cubit.dart';

class NewStockReturnState extends Equatable {
  const NewStockReturnState(this.payload);

  final StockReturnRequest payload;

  @override
  List<Object?> get props => [payload];

  factory NewStockReturnState.initial() => NewStockReturnState(StockReturnRequest());
}
