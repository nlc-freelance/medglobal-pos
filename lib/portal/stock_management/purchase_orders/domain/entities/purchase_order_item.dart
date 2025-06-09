// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// part 'purchase_order_item.g.dart';

// @JsonSerializable()
// class PurchaseOrderItem extends Equatable {
//   final int? id;
//   final int? variantId;
//   final String? name;
//   final String? sku;
//   final int? quantityOnHand;
//   final int? qtyToOrder;
//   final int? qtyReceived;
//   final double? supplierPrice;
//   final double? sellingPrice;
//   final double? total;

//   const PurchaseOrderItem({
//     this.id,
//     this.variantId,
//     this.name,
//     this.sku,
//     this.qtyOnHand,
//     this.qtyToOrder,
//     this.qtyReceived,
//     this.supplierPrice,
//     this.sellingPrice,
//     this.total,
//   });

//   @override
//   List<Object?> get props =>
//       [id, variantId, name, sku, qtyOnHand, qtyToOrder, supplierPrice, sellingPrice, qtyReceived, total];

//   factory PurchaseOrderItem.fromJson(Map<String, dynamic> json) => _$PurchaseOrderItemFromJson(json);

//   DataGridRow toDataGridRowItems() => DataGridRow(
//         cells: [
//           DataGridCell<int>(columnName: 'id', value: id),
//           DataGridCell<String>(columnName: 'variant_name', value: name),
//           DataGridCell<String>(columnName: 'sku', value: sku),
//           DataGridCell<double>(columnName: 'selling_price', value: sellingPrice),
//           DataGridCell<int>(columnName: 'qty_on_hand', value: qtyOnHand),
//           DataGridCell<int>(columnName: 'qty_to_order', value: qtyToOrder),
//           DataGridCell<double>(columnName: 'supplier_price', value: supplierPrice),
//           DataGridCell<double>(columnName: 'total', value: total ?? 0),
//           const DataGridCell(columnName: 'action', value: null),
//         ],
//       );

//   DataGridRow toDataGridRowItemsReceived() => DataGridRow(
//         cells: [
//           DataGridCell<int>(columnName: 'id', value: id),
//           DataGridCell<String>(columnName: 'variant_name', value: name),
//           DataGridCell<String>(columnName: 'sku', value: sku),
//           DataGridCell<int>(columnName: 'qty_ordered', value: qtyToOrder),
//           DataGridCell<int>(columnName: 'qty_received', value: qtyReceived),
//           DataGridCell<double>(columnName: 'supplier_price', value: supplierPrice),
//           DataGridCell<double>(
//             columnName: 'total',
//             value: (qtyReceived ?? 0) * (supplierPrice ?? 0),
//           ),
//         ],
//       );

//   PurchaseOrderItem copyWith({
//     int? id,
//     int? variantId,
//     String? name,
//     String? sku,
//     int? qtyOnHand,
//     int? qtyToOrder,
//     int? qtyReceived,
//     double? sellingPrice,
//     double? supplierPrice,
//     double? total,
//     bool? nullQtyToOrder = false,
//     bool? nullQtyReceived = false,
//     bool? nullSupplierPrice = false,
//   }) {
//     return PurchaseOrderItem(
//       id: id ?? this.id,
//       variantId: variantId ?? this.variantId,
//       name: name ?? this.name,
//       sku: sku ?? this.sku,
//       sellingPrice: sellingPrice ?? this.sellingPrice,
//       qtyOnHand: qtyOnHand ?? this.qtyOnHand,
//       qtyToOrder: nullQtyToOrder == true ? null : qtyToOrder ?? this.qtyToOrder,
//       qtyReceived: nullQtyReceived == true ? null : qtyReceived ?? this.qtyReceived,
//       supplierPrice: nullSupplierPrice == true ? null : supplierPrice ?? this.supplierPrice,
//       total: total ?? this.total,
//     );
//   }

//   @override
//   String toString() {
//     return 'PurchaseOrderItem{id: $id, variantId: $variantId, name: $name, sku: $sku, sellingPrice: $sellingPrice, qtyOnHand: $qtyOnHand, qtyToOrder: $qtyToOrder, qtyReceived: $qtyReceived, supplierPrice: $supplierPrice, total: $total}';
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'purchase_order_item.freezed.dart';

@freezed
class PurchaseOrderItem with _$PurchaseOrderItem {
  const factory PurchaseOrderItem({
    int? id,
    required int variantId,
    required String name,
    String? sku,
    int? quantityOnHand,
    int? quantityOrdered,
    int? quantityReceived,
    required double supplierPrice,
    double? sellingPrice,
    double? total,
  }) = _PurchaseOrderItem;

  const PurchaseOrderItem._();

  DataGridRow toDataGridRowItems() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<double>(columnName: 'selling_price', value: sellingPrice),
          DataGridCell<int>(columnName: 'qty_on_hand', value: quantityOnHand),
          DataGridCell<int>(columnName: 'qty_to_order', value: quantityOrdered),
          DataGridCell<double>(columnName: 'supplier_price', value: supplierPrice),
          DataGridCell<double>(columnName: 'total', value: total ?? 0),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );

  DataGridRow toDataGridRowItemsReceived() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty_ordered', value: quantityOrdered),
          DataGridCell<int>(columnName: 'qty_received', value: quantityReceived),
          DataGridCell<double>(columnName: 'supplier_price', value: supplierPrice),
          DataGridCell<double>(
            columnName: 'total',
            value: (quantityReceived ?? 0) * (supplierPrice ?? 0),
          ),
        ],
      );
}
