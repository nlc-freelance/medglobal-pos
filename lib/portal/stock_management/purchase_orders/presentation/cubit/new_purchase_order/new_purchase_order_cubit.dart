import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/new_purchase_order.dart';

part 'new_purchase_order_state.dart';

class NewPurchaseOrderCubit extends Cubit<NewPurchaseOrderState> {
  NewPurchaseOrderCubit() : super(NewPurchaseOrderState.initial());

  void setBranchId(int value) => emit(NewPurchaseOrderState(state.payload.copyWith(branchId: value)));
  void setSupplierId(int value) => emit(NewPurchaseOrderState(state.payload.copyWith(supplierId: value)));
  void setAutoFill(bool value) => emit(NewPurchaseOrderState(state.payload.copyWith(isAutoFill: value)));
}
