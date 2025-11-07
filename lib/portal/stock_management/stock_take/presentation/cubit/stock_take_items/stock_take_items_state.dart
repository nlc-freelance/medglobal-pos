part of 'stock_take_items_cubit.dart';

sealed class StockTakeItemsState extends Equatable {
  const StockTakeItemsState();

  @override
  List<Object?> get props => [];
}

final class StockTakeItemsInitial extends StockTakeItemsState {}

final class StockTakeItemsLoading extends StockTakeItemsState {
  final int id;

  const StockTakeItemsLoading(this.id);
  @override
  List<Object> get props => [id];
}

final class StockTakeItemsSuccess extends StockTakeItemsState {
  final int? stockItemId;
  const StockTakeItemsSuccess([this.stockItemId]);

  @override
  List<Object?> get props => [stockItemId];
}

final class StockTakeItemsNullCountedQtyError extends StockTakeItemsState {
  final String message;
  final int id;

  const StockTakeItemsNullCountedQtyError(this.id, {required this.message});

  @override
  List<Object> get props => [id, message];
}

final class StockTakeItemsError extends StockTakeItemsState {
  final String message;
  final int id;

  const StockTakeItemsError(this.id, {required this.message});

  @override
  List<Object> get props => [id, message];
}
