part of 'supply_need_cubit.dart';

class SupplyNeedState extends Equatable {
  const SupplyNeedState(this.purchaseOrderTargetBranch, this.stockTransferSourceBranch);

  final Branch? purchaseOrderTargetBranch;
  final Branch? stockTransferSourceBranch;

  @override
  List<Object?> get props => [purchaseOrderTargetBranch, stockTransferSourceBranch];
}
