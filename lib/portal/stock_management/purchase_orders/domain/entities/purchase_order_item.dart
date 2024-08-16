import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'purchase_order_item.g.dart';

@JsonSerializable()
class PurchaseOrderItem extends Equatable {
  final int? id;
  final int? variantId;
  final String? name;
  final String? sku;
  final int? qtyOnHand;
  final int? qtyToOrder;
  final int? qtyReceived;
  final double? supplierPrice;
  final double? subtotal;

  const PurchaseOrderItem({
    this.id,
    this.variantId,
    this.name,
    this.sku,
    this.qtyOnHand,
    this.qtyToOrder,
    this.qtyReceived,
    this.supplierPrice,
    this.subtotal,
  });

  @override
  List<Object?> get props => [id, variantId, name, sku, qtyOnHand, qtyToOrder, supplierPrice, qtyReceived, subtotal];

  factory PurchaseOrderItem.fromJson(Map<String, dynamic> json) => _$PurchaseOrderItemFromJson(json);

  DataGridRow toDataGridRowItems() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty_on_hand', value: qtyOnHand ?? 0),
          DataGridCell<int>(columnName: 'qty_to_order', value: qtyToOrder ?? 0),
          DataGridCell<double>(columnName: 'supplier_price', value: supplierPrice ?? 0),
          DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );
  DataGridRow toDataGridRowItemsReceived() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty_ordered', value: qtyToOrder ?? 0),
          DataGridCell<int>(columnName: 'qty_received', value: qtyReceived ?? 0),
          DataGridCell<double>(columnName: 'supplier_price', value: supplierPrice ?? 0),
          DataGridCell<double>(
            columnName: 'subtotal',
            value: (qtyReceived ?? 0) * (supplierPrice ?? 0),
          ),
        ],
      );

  PurchaseOrderItem copyWith({
    int? id,
    int? variantId,
    String? name,
    String? sku,
    int? qtyOnHand,
    int? qtyToOrder,
    int? qtyReceived,
    double? supplierPrice,
    double? subtotal,
  }) {
    return PurchaseOrderItem(
      id: id ?? this.id,
      variantId: variantId ?? this.variantId,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      qtyOnHand: qtyOnHand ?? this.qtyOnHand,
      qtyToOrder: qtyToOrder ?? this.qtyToOrder,
      qtyReceived: qtyReceived ?? this.qtyReceived,
      supplierPrice: supplierPrice ?? this.supplierPrice,
      subtotal: subtotal ?? this.subtotal,
    );
  }
}
