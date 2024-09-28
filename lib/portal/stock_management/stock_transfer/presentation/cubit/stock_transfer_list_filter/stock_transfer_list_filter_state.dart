part of 'stock_transfer_list_filter_cubit.dart';

class StockTransferListFilterState extends Equatable {
  const StockTransferListFilterState({this.size = 20, this.sourceBranch, this.destinationBranch, this.status});

  final int? size;
  final Branch? sourceBranch;
  final Branch? destinationBranch;
  final StockOrderStatus? status;

  @override
  List<Object?> get props => [size, sourceBranch, destinationBranch, status];

  int get filterCount => [sourceBranch, destinationBranch].where((branch) => branch != null).toList().length;

  StockTransferListFilterState copyWith({
    int? size,
    Branch? sourceBranch,
    Branch? destinationBranch,
    StockOrderStatus? status,
    bool? nullSourceBranch = false,
    bool? nullDestinationBranch = false,
    bool? nullStatus = false,
  }) {
    return StockTransferListFilterState(
      size: size ?? this.size,
      sourceBranch: nullSourceBranch == true ? null : sourceBranch ?? this.sourceBranch,
      destinationBranch: nullDestinationBranch == true ? null : destinationBranch ?? this.destinationBranch,
      status: nullStatus == true ? null : status ?? this.status,
    );
  }
}
