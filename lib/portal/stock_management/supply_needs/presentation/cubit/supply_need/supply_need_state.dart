part of 'supply_need_cubit.dart';

class SupplyNeedState extends Equatable {
  const SupplyNeedState(this.purchaseOrderTargetBranch, this.stockTransferSourceBranch);

  final BranchPartial? purchaseOrderTargetBranch;
  final BranchPartial? stockTransferSourceBranch;

  @override
  List<Object?> get props => [purchaseOrderTargetBranch, stockTransferSourceBranch];
}
