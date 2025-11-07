import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';

part 'purchase_order_form_state.dart';
part 'purchase_order_form_cubit.freezed.dart';

class PurchaseOrderFormCubit extends Cubit<PurchaseOrderFormState> {
  PurchaseOrderFormCubit() : super(PurchaseOrderFormState.initial());

  void loadPurchaseOrder(PurchaseOrder purchaseOrder) => emit(state.copyWith(purchaseOrder: purchaseOrder));

  void setEstimatedDateOfArrival(DateTime value) {
    final purchaseOrder = state.purchaseOrder.copyWith(estimatedDateOfArrival: value);
    emit(state.copyWith(purchaseOrder: purchaseOrder));
  }

  void setQuantityToOrderPerItem({required int id, required int? qty}) {
    final updatedItems = state.purchaseOrder.items?.map((item) {
          if (item.id == id) {
            return item.copyWith(
              quantityOrdered: qty,
              total: (qty ?? 0) * (item.supplierPrice ?? 0), // total.roundToTwoDecimalPlaces(), //
            );
          }
          return item;
        }).toList() ??
        [];

    final updatedPurchaseOrder = state.purchaseOrder.copyWith(items: updatedItems);
    emit(state.copyWith(purchaseOrder: updatedPurchaseOrder));
  }

  void setQuantityReceivedPerItem({required int id, required int? qty}) {
    final updatedItems = state.purchaseOrder.items?.map((item) {
          if (item.id == id) {
            return item.copyWith(
              quantityReceived: qty,
              total: (qty ?? 0) * (item.supplierPrice ?? 0), // total.roundToTwoDecimalPlaces(), //
            );
          }

          return item;
        }).toList() ??
        [];

    final updatedPurchaseOrder = state.purchaseOrder.copyWith(items: updatedItems);
    emit(state.copyWith(purchaseOrder: updatedPurchaseOrder));
  }

  void setSupplierPricePerItem({required int id, double? price}) {
    final updatedItems = state.purchaseOrder.items?.map((item) {
          if (item.id == id) {
            return item.copyWith(
              supplierPrice: price,
              total: (price ?? 0) * (item.quantityOrdered ?? 0), // total.roundToTwoDecimalPlaces(),
            );
          }
          return item;
        }).toList() ??
        [];

    final updatedPurchaseOrder = state.purchaseOrder.copyWith(items: updatedItems);
    emit(state.copyWith(purchaseOrder: updatedPurchaseOrder));
  }

  void addItem(PurchaseOrderItem item) {
    final updatedItems = [...?state.purchaseOrder.items, item];
    final updatePurchaseOrder = state.purchaseOrder.copyWith(items: updatedItems);
    emit(state.copyWith(purchaseOrder: updatePurchaseOrder));
  }

  void removeItem(int id) {
    final updatedItems = state.purchaseOrder.items?.where((item) => item.id != id).toList();
    final updatePurchaseOrder = state.purchaseOrder.copyWith(items: updatedItems);

    emit(state.copyWith(purchaseOrder: updatePurchaseOrder));
  }

  void setTax(double value) {
    final purchaseOrder = state.purchaseOrder.copyWith(tax: value);
    emit(state.copyWith(purchaseOrder: purchaseOrder));
  }

  void setDiscount(double? value) {
    final purchaseOrder = state.purchaseOrder.copyWith(
      discount: value.roundToTwoDecimalPlaces(),
      totalAmount: (state.purchaseOrder.totalAmount ?? 0) - (value ?? 0),
    );
    emit(state.copyWith(purchaseOrder: purchaseOrder));
  }

  void setTotal(double value) {
    final purchaseOrder = state.purchaseOrder.copyWith(totalAmount: value);
    emit(state.copyWith(purchaseOrder: purchaseOrder));
  }

  void setNotes(String value) {
    final purchaseOrder = state.purchaseOrder.copyWith(notes: value);
    emit(state.copyWith(purchaseOrder: purchaseOrder));
  }

  void reset() => emit(PurchaseOrderFormState.initial());
}
