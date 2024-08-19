import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

part 'refund_state.dart';

class RefundCubit extends Cubit<RefundState> {
  RefundCubit() : super(RefundState.initial());

  void setRefund(Transaction refund) => emit(RefundState(refund));

  void setRefundItemQty({required int id, required int qtyToRefund, required double subtotal}) {
    final refundItems = state.refund.items?.toList() ?? [];
    final updatedRefundItems = refundItems.map((item) {
      if (item.id == id) {
        return item.copyWith(
          qtyRefund: qtyToRefund,
          subtotal: subtotal,
          isSelected: qtyToRefund != 0,
        );
      }
      return item;
    }).toList();

    emit(RefundState(state.refund.copyWith(items: updatedRefundItems)));
  }

  void setReason(String reason) => emit(RefundState(state.refund.copyWith(reasonForReturn: reason)));
}
