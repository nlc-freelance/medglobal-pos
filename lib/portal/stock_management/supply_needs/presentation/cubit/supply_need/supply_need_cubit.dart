import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';

part 'supply_need_state.dart';

class SupplyNeedCubit extends Cubit<SupplyNeedState> {
  SupplyNeedCubit() : super(const SupplyNeedState(null, null));

  void setPurchaseOrderTargetBranch(BranchPartial branch) => emit(SupplyNeedState(branch, null));
  void setStockTransferSourceBranch(BranchPartial branch) => emit(SupplyNeedState(null, branch));
}
