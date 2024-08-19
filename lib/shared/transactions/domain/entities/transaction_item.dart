import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'transaction_item.g.dart';

@JsonSerializable()
class TransactionItem extends Equatable {
  final int? id;
  final int? itemId;
  final String? name;
  final String? sku;
  final int? qty;
  final int? qtyRefund;
  final double? price;
  final double? discountInPeso;
  final double? discount;
  final DiscountType? discountType;
  final double? subtotal;
  final double? total;
  final String? comment;
  final int? restockQty;
  final int? writeOffQty;

  /// isSelected for refund
  final bool isSelected;

  const TransactionItem({
    this.id,
    this.itemId,
    this.name,
    this.sku,
    this.qty,
    this.qtyRefund,
    this.price,
    this.discountInPeso,
    this.discount,
    this.discountType,
    this.subtotal,
    this.total,
    this.comment,
    this.restockQty,
    this.writeOffQty,
    this.isSelected = false,
  });

  @override
  List<Object?> get props => [
        id,
        itemId,
        name,
        sku,
        qty,
        qtyRefund,
        price,
        discount,
        discountType,
        discountInPeso,
        subtotal,
        total,
        restockQty,
        writeOffQty,
        comment,
        isSelected,
      ];

  factory TransactionItem.fromJson(Map<String, dynamic> json) => _$TransactionItemFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemToJson(this);

  DataGridRow toSaleTransactionItemsRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty', value: qty ?? 0),
          DataGridCell<double>(columnName: 'price', value: price ?? 0),
          DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
          DataGridCell<double>(columnName: 'discount_in_peso', value: discountInPeso ?? 0),
          DataGridCell<double>(columnName: 'total', value: total ?? 0),
        ],
      );

  DataGridRow toReturnTransactionItemsRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'return_qty', value: qty ?? 0),
          DataGridCell<int>(columnName: 'write_off_qty', value: writeOffQty ?? 0),
          DataGridCell<int>(columnName: 'restock_qty', value: restockQty ?? 0),
          DataGridCell<String>(columnName: 'comment', value: comment ?? Strings.empty),
        ],
      );

  DataGridRow toItemsOrderedRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<int>(columnName: 'qty', value: qty ?? 0),
          DataGridCell<double>(columnName: 'price', value: price ?? 0),
          DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
          DataGridCell<double>(columnName: 'discount_in_peso', value: discountInPeso ?? 0),
          DataGridCell<double>(columnName: 'total', value: total ?? 0),
        ],
      );

  DataGridRow toItemsOrderedRefundableRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<bool>(columnName: 'is_selected', value: isSelected),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<int>(columnName: 'qty_to_refund', value: qtyRefund ?? 0),
          DataGridCell<int>(columnName: 'qty', value: qty ?? 0),
          DataGridCell<double>(columnName: 'price', value: price ?? 0),
          DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
        ],
      );

  DataGridRow toItemsRefundedRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<int>(columnName: 'qty_refunded', value: qty ?? 0),
          DataGridCell<double>(columnName: 'price', value: price ?? 0),
          DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
        ],
      );

  TransactionItem copyWith({
    int? id,
    int? itemId,
    String? name,
    String? sku,
    int? qty,
    int? qtyRefund,
    double? price,
    double? discountInPeso,
    double? discount,
    DiscountType? discountType,
    double? subtotal,
    String? comment,
    int? restockQty,
    int? writeOffQty,
    bool? isSelected,
  }) {
    return TransactionItem(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      qty: qty ?? this.qty,
      qtyRefund: qtyRefund ?? this.qtyRefund,
      price: price ?? this.price,
      discountInPeso: discountInPeso ?? this.discountInPeso,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      subtotal: subtotal ?? this.subtotal,
      comment: comment ?? this.comment,
      restockQty: restockQty ?? this.restockQty,
      writeOffQty: writeOffQty ?? this.writeOffQty,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
