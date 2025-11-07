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

class SaveStockTakeEvent extends StockTakeEvent {
  final int id;
  final StockTake stockTake;

  const SaveStockTakeEvent({required this.id, required this.stockTake});

  @override
  List<Object?> get props => [id, stockTake];
}

class CheckUncountedItemForCompletionEvent extends StockTakeEvent {
  final StockTake stockTake;

  const CheckUncountedItemForCompletionEvent({required this.stockTake});

  @override
  List<Object?> get props => [stockTake];
}

class CompleteStockTakeEvent extends StockTakeEvent {
  final int id;
  final StockTake stockTake;
  final StockTakeItemAction? action;

  const CompleteStockTakeEvent({required this.id, required this.stockTake, this.action});

  @override
  List<Object?> get props => [id, stockTake, action];
}

class CancelStockTakeEvent extends StockTakeEvent {
  final int id;
  final StockTake stockTake;

  const CancelStockTakeEvent({required this.id, required this.stockTake});

  @override
  List<Object?> get props => [id, stockTake];
}
