part of 'new_stock_take_cubit.dart';

class NewStockTakeState extends Equatable {
  const NewStockTakeState(this.payload);

  final NewStockTake payload;

  @override
  List<Object> get props => [payload];

  factory NewStockTakeState.initial() => NewStockTakeState(NewStockTake());
}
