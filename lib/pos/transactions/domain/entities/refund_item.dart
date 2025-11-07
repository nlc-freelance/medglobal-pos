import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'refund_item.freezed.dart';
part 'refund_item.g.dart';

@freezed
class RefundItem with _$RefundItem {
  const factory RefundItem({
    required int id,
    required String name,
    required int quantity,
    required double price,
    int? refundQuantity,
    DiscountType? discountType,
    double? discount,
    double? discountedPrice,
    @Default(0) double subtotal,
  }) = _RefundItem;

  factory RefundItem.fromJson(Map<String, dynamic> json) => _$RefundItemFromJson(json);
}

extension RefundItemExt on RefundItem {
  /// Discount amount per unit
  double getDiscountAmountPerUnit() {
    if (discount != null) return price * (discount! / 100);
    return 0;
  }

  /// Unit price after discount
  double getDiscountedPricePerUnit() {
    return price - getDiscountAmountPerUnit();
  }

  /// Subtotal per item (price * refundQty)
  double getSubtotal() {
    return price * (refundQuantity ?? 0);
  }

  /// Total per item (discounted unit price * refundQty)
  double getTotal() {
    return getDiscountedPricePerUnit() * (refundQuantity ?? 0);
  }

  /// Total discount amount
  double getTotalDiscountAmount() {
    return (price * (refundQuantity ?? 0)) - getTotal();
  }

  bool get isSelectedForRefund => refundQuantity != null && refundQuantity != 0;

  DataGridRow toRefundableTransactionItemsRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<bool>(columnName: 'is_selected', value: isSelectedForRefund),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<int?>(columnName: 'qty_to_refund', value: refundQuantity),
          DataGridCell<int>(columnName: 'qty', value: quantity),
          DataGridCell<double>(columnName: 'price', value: price),
          const DataGridCell<double>(
            columnName: 'discount',
            value: 0, // Discount per item unit is fetched on buildRow method of the data grid
          ),
          DataGridCell<double>(columnName: 'subtotal', value: subtotal),
        ],
      );

  TransactionItem get toTransactionItem {
    return TransactionItem(
      itemId: id,
      name: name,
      quantity: refundQuantity,
      price: price,
      discount: discount,
      discountType: discountType,
      discountAmount: getDiscountAmountPerUnit(),
      subtotal: subtotal,
      total: getTotal(),
    );
  }
}

extension RefundItemsExt on List<RefundItem> {
  /// Get total discount for all items selected for refund
  double getRefundTotalDiscountAmount() {
    return fold(0.0, (discount, item) => discount + (item.getDiscountAmountPerUnit() * item.quantity));
  }

  /// Get subtotal for the refund
  double getRefundSubtotal() {
    return fold(0.0, (subtotal, item) => subtotal + item.getSubtotal());
  }

  /// Get total refund amount
  double getRefundTotal() {
    final subtotal = fold(0.0, (subtotal, item) => subtotal + item.getSubtotal());
    final discount = getRefundTotalDiscountAmount();

    return subtotal - discount;
  }

  bool hasInvalidRefundQuantity() {
    return any((item) => (item.refundQuantity ?? 0) > item.quantity);
  }
}
