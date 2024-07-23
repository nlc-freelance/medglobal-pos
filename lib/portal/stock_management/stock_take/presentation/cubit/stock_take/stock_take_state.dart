part of 'stock_take_cubit.dart';

class StockTakeState extends Equatable {
  const StockTakeState(this.stockTake);

  final StockTake stockTake;

  @override
  List<Object?> get props => [stockTake];

  factory StockTakeState.initial() => const StockTakeState(StockTake());
}
