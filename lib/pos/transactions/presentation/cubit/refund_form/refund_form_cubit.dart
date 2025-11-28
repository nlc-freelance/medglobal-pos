import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';

part 'refund_form_state.dart';
part 'refund_form_cubit.freezed.dart';

class RefundFormCubit extends Cubit<RefundFormState> {
  RefundFormCubit() : super(RefundFormState.initial());

  void loadItems(List<RefundItem> items) => emit(RefundFormState(items: items));

  void setRefundItemQty({required int id, required int? qtyToRefund}) {
    final updatedRefundItems = state.items.map((item) {
      if (item.id == id) {
        return item.copyWith(
          refundQuantity: qtyToRefund,
          subtotal: (qtyToRefund ?? 0) * item.price,
        );
      }
      return item;
    }).toList();

    emit(state.copyWith(items: updatedRefundItems));
  }

  void setReason(String reason) => emit(state.copyWith(reasonForRefund: reason));

  void reset() => emit(RefundFormState.initial());
}
