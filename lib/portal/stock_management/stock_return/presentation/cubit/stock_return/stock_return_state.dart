part of 'stock_return_cubit.dart';

class StockReturnState extends Equatable {
  const StockReturnState(this.stockReturn);

  final StockReturn stockReturn;

  @override
  List<Object> get props => [stockReturn];

  factory StockReturnState.initial() => const StockReturnState(StockReturn());
}
