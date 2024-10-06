part of 'stock_take_bloc.dart';

@immutable
abstract class StockTakeEvent extends Equatable {
  const StockTakeEvent();

  @override
  List<Object?> get props => [];
}

class CreateStockTakeEvent extends StockTakeEvent {
  final NewStockTake payload;
  const CreateStockTakeEvent(this.payload);

  @override
  List<Object> get props => [payload];
}

class GetStockTakeByIdEvent extends StockTakeEvent {
  final int id;
  const GetStockTakeByIdEvent(this.id);

  @override
  List<Object> get props => [id];
}

class StartStockTakePollingEvent extends StockTakeEvent {
  final int id;
  final StockOrderStatus targetStatus;
  const StartStockTakePollingEvent(this.id, {required this.targetStatus});

  @override
  List<Object> get props => [id, targetStatus];
}

class UpdateStockTakeEvent extends StockTakeEvent {
  final StockOrderUpdate type;
  final int id;
  final StockTake stockTake;
  final StockTakeItemAction? action;

  const UpdateStockTakeEvent(this.type, {required this.id, required this.stockTake, this.action});

  @override
  List<Object?> get props => [type, id, stockTake, action];
}
