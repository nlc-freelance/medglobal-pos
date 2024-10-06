part of 'stock_take_list_filter_cubit.dart';

class StockTakeListFilterState extends Equatable {
  const StockTakeListFilterState({this.size = 20, this.status});

  final int? size;
  final StockOrderStatus? status;

  @override
  List<Object?> get props => [size, status];

  StockTakeListFilterState copyWith({
    int? size,
    StockOrderStatus? status,
    bool? nullStatus = false,
  }) {
    return StockTakeListFilterState(
      size: size ?? this.size,
      status: nullStatus == true ? null : status ?? this.status,
    );
  }
}
