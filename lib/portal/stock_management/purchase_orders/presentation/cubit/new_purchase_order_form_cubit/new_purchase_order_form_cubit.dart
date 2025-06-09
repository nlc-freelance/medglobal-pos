import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_purchase_order_form_state.dart';
part 'new_purchase_order_form_cubit.freezed.dart';

class NewPurchaseOrderFormCubit extends Cubit<NewPurchaseOrderFormState> {
  NewPurchaseOrderFormCubit() : super(NewPurchaseOrderFormState.initial());

  void setBranchId(int value) => emit(state.copyWith(branchId: value));

  void setSupplierId(int value) => emit(state.copyWith(supplierId: value));

  void setAutoFill(bool value) => emit(state.copyWith(isAutoFill: value));
}
