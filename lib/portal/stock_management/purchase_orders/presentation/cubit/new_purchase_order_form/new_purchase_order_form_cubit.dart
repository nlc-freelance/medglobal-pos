import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/new_purchase_order.dart';

part 'new_purchase_order_form_state.dart';

class NewPurchaseOrderFormCubit extends Cubit<NewPurchaseOrderFormState> {
  NewPurchaseOrderFormCubit() : super(NewPurchaseOrderFormState.initial());

  void setBranchId(int value) => emit(NewPurchaseOrderFormState(state.newPurchaseOrder.copyWith(branchId: value)));
  void setSupplierId(int value) => emit(NewPurchaseOrderFormState(state.newPurchaseOrder.copyWith(supplierId: value)));
  void setAutoFill(bool value) => emit(NewPurchaseOrderFormState(state.newPurchaseOrder.copyWith(isAutoFill: value)));

  void reset() => emit(NewPurchaseOrderFormState.initial());
}
