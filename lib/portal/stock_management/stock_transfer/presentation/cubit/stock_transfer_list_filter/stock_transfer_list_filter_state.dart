part of 'stock_transfer_list_filter_cubit.dart';

class StockTransferListFilterState extends Equatable {
  const StockTransferListFilterState(
      {this.size = 20, this.sourceBranch, this.destinationBranch, this.status, this.startDate, this.endDate});

  final int? size;
  final Branch? sourceBranch;
  final Branch? destinationBranch;
  final StockOrderStatus? status;
  final String? startDate;
  final String? endDate;

  @override
  List<Object?> get props => [size, sourceBranch, destinationBranch, status, startDate, endDate];

  int get filterCount => [sourceBranch, destinationBranch].where((branch) => branch != null).toList().length;

  StockTransferListFilterState copyWith({
    int? size,
    Branch? sourceBranch,
    Branch? destinationBranch,
    StockOrderStatus? status,
    String? startDate,
    String? endDate,
    bool? nullSourceBranch = false,
    bool? nullDestinationBranch = false,
    bool? nullStatus = false,
    bool? nullStartDate = false,
    bool? nullEndDate = false,
  }) {
    return StockTransferListFilterState(
      size: size ?? this.size,
      sourceBranch: nullSourceBranch == true ? null : sourceBranch ?? this.sourceBranch,
      destinationBranch: nullDestinationBranch == true ? null : destinationBranch ?? this.destinationBranch,
      status: nullStatus == true ? null : status ?? this.status,
      startDate: nullStartDate == true ? null : startDate ?? this.startDate,
      endDate: nullEndDate == true ? null : endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> get filters => {
        'status': status?.label.toLowerCase(),
        'fromBranch': sourceBranch?.id,
        'toBranch': destinationBranch?.id,
        'startDate': startDate,
        'endDate': endDate,
      };
}
