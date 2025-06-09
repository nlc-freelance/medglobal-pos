import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'refund_item.freezed.dart';
part 'refund_item.g.dart';

@freezed
class RefundItem with _$RefundItem {
  const factory RefundItem({
    required int id,
    required String name,
    required String sku,
    required int quantity,
    required double price,
    DiscountType? discountType,
    double? discountValue,
    double? discountedPrice,
    int? refundQuantity,
  }) = _RefundItem;

  const RefundItem._();

  factory RefundItem.fromJson(Map<String, dynamic> json) => _$RefundItemFromJson(json);

  double get discountAmountPerUnit {
    if (discountValue != null) return price * (discountValue! / 100);
    return 0;
  }

  double get totalPrice => price * quantity;

  bool get isSelectedForRefund => refundQuantity != null && refundQuantity != 0;

  DataGridRow toRefundableTransactionItemsRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<bool>(columnName: 'is_selected', value: isSelectedForRefund),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<int>(columnName: 'qty_to_refund', value: refundQuantity),
          DataGridCell<int>(columnName: 'qty', value: quantity),
          DataGridCell<double>(columnName: 'price', value: price),

          /// Discount here is the discount per item unit which is being fetched on buildRow method of the data grid
          const DataGridCell<double>(columnName: 'discount', value: 0),
          DataGridCell<double>(columnName: 'subtotal', value: totalPrice),
        ],
      );
}
