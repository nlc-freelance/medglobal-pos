// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// part 'transaction_item.g.dart';

// @JsonSerializable()
// class TransactionItem extends Equatable {
//   final int? id;
//   final int? itemId;
//   final String? name;
//   final String? sku;
//   final int? qty;
//   final int? qtyRefund;
//   final double? price;

//   /// Total discount per item (discountInPeso * qty)
//   final double? discountInPeso;
//   final double? discount;
//   final double? discountedPrice;
//   final DiscountType? discountType;
//   final DiscountCategory? discountCategory;
//   final double? subtotal;
//   final double? total;
//   final String? comment;
//   final int? restockQty;
//   final int? writeOffQty;

//   /// isSelected for refund
//   final bool isSelected;

//   const TransactionItem({
//     this.id,
//     this.itemId,
//     this.name,
//     this.sku,
//     this.qty,
//     this.qtyRefund,
//     this.price,
//     this.discountInPeso,
//     this.discount,
//     this.discountedPrice,
//     this.discountType,
//     this.discountCategory,
//     this.subtotal,
//     this.total,
//     this.comment,
//     this.restockQty,
//     this.writeOffQty,
//     this.isSelected = false,
//   });

//   @override
//   List<Object?> get props => [
//         id,
//         itemId,
//         name,
//         sku,
//         qty,
//         qtyRefund,
//         price,
//         discount,
//         discountedPrice,
//         discountType,
//         discountCategory,
//         discountInPeso,
//         subtotal,
//         total,
//         restockQty,
//         writeOffQty,
//         comment,
//         isSelected,
//       ];

//   factory TransactionItem.fromJson(Map<String, dynamic> json) => _$TransactionItemFromJson(json);

//   Map<String, dynamic> toJson() => _$TransactionItemToJson(this);

//   DataGridRow toSaleTransactionItemsRow() => DataGridRow(
//         cells: [
//           DataGridCell<int>(columnName: 'id', value: id),
//           DataGridCell<String>(columnName: 'name', value: name),
//           DataGridCell<String>(columnName: 'sku', value: sku),
//           DataGridCell<int>(columnName: 'qty', value: qty ?? 0),
//           DataGridCell<double>(columnName: 'price', value: price ?? 0),
//           DataGridCell<double>(columnName: 'discount', value: discountInPeso ?? 0),
//           DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
//         ],
//       );

//   DataGridRow toReturnTransactionItemsRow() => DataGridRow(
//         cells: [
//           DataGridCell<int>(columnName: 'id', value: id),
//           DataGridCell<String>(columnName: 'name', value: name),
//           DataGridCell<String>(columnName: 'sku', value: sku),
//           DataGridCell<int>(columnName: 'return_qty', value: qty ?? 0),
//           DataGridCell<int>(columnName: 'write_off_qty', value: writeOffQty ?? 0),
//           DataGridCell<int>(columnName: 'restock_qty', value: restockQty ?? 0),
//           DataGridCell<String>(columnName: 'comment', value: comment ?? Strings.empty),
//         ],
//       );

//   DataGridRow toTransactionItemsRow() => DataGridRow(
//         cells: [
//           DataGridCell<int>(columnName: 'id', value: id),
//           DataGridCell<String>(columnName: 'name', value: name),
//           DataGridCell<int>(columnName: 'qty', value: qty ?? 0),
//           DataGridCell<double>(columnName: 'price', value: price ?? 0),
//           DataGridCell<double>(columnName: 'discount', value: discountInPeso ?? 0),
//           DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
//         ],
//       );

//   DataGridRow toRefundableTransactionItemsRow() => DataGridRow(
//         cells: [
//           DataGridCell<int>(columnName: 'id', value: id),
//           DataGridCell<bool>(columnName: 'is_selected', value: isSelected),
//           DataGridCell<String>(columnName: 'name', value: name),
//           DataGridCell<int>(columnName: 'qty_to_refund', value: qtyRefund ?? 0),
//           DataGridCell<int>(columnName: 'qty', value: qty ?? 0),
//           DataGridCell<double>(columnName: 'price', value: price ?? 0),

//           /// Discount here is the discount per item unit which is being fetched on buildRow method of the data grid
//           const DataGridCell<double>(columnName: 'discount', value: 0),
//           DataGridCell<double>(columnName: 'subtotal', value: price! * (qtyRefund ?? 0)),
//         ],
//       );

//   DataGridRow toRefundedTransactionItemsRow() => DataGridRow(
//         cells: [
//           DataGridCell<int>(columnName: 'id', value: id),
//           DataGridCell<String>(columnName: 'name', value: name),
//           DataGridCell<int>(columnName: 'qty_refunded', value: qty ?? 0),
//           DataGridCell<double>(columnName: 'price', value: price ?? 0),
//           DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
//         ],
//       );

//   TransactionItem copyWith({
//     int? id,
//     int? itemId,
//     String? name,
//     String? sku,
//     int? qty,
//     int? qtyRefund,
//     double? price,
//     double? discountedPrice,
//     double? discount,
//     double? discountInPeso,
//     DiscountType? discountType,
//     DiscountCategory? discountCategory,
//     double? subtotal,
//     double? total,
//     String? comment,
//     int? restockQty,
//     int? writeOffQty,
//     bool? isSelected,
//     bool? removeDiscount = false,
//   }) {
//     return TransactionItem(
//       id: id ?? this.id,
//       itemId: itemId ?? this.itemId,
//       name: name ?? this.name,
//       sku: sku ?? this.sku,
//       qty: qty ?? this.qty,
//       qtyRefund: qtyRefund ?? this.qtyRefund,
//       price: price ?? this.price,
//       discountedPrice: removeDiscount == true ? null : discountedPrice ?? this.discountedPrice,
//       discount: removeDiscount == true ? null : discount ?? this.discount,
//       discountInPeso: removeDiscount == true ? null : discountInPeso ?? this.discountInPeso,
//       discountCategory: removeDiscount == true ? null : discountCategory ?? this.discountCategory,
//       discountType: discountType ?? this.discountType,
//       subtotal: subtotal ?? this.subtotal,
//       total: total ?? this.total,
//       comment: comment ?? this.comment,
//       restockQty: restockQty ?? this.restockQty,
//       writeOffQty: writeOffQty ?? this.writeOffQty,
//       isSelected: isSelected ?? this.isSelected,
//     );
//   }

//   double get totalPerItem {
//     if (qty != null) {
//       if (discountedPrice != null) return discountedPrice! * qty!;
//       return price! * qty!;
//     }
//     return 0;
//   }

//   double get subtotalPerItem {
//     if (qty != null) return price! * qty!;
//     return 0;
//   }

//   /// Percentage discount in peso per item unit
//   double get discountInPesoPerItemUnit {
//     if (discount != null) return price! * (discount! / 100);
//     return 0;
//   }

//   bool hasChangedInQtyDiscountOrTypePerItem(TransactionItem other) {
//     return qty != other.qty || discount != other.discount;

//     /// This applies when there is a discount type of either peso or percentage
//     // discountType != other.discountType;
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/constants/constants.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'transaction_item.freezed.dart';
part 'transaction_item.g.dart';

@freezed
class TransactionItem with _$TransactionItem {
  const factory TransactionItem({
    int? id,
    int? itemId,
    String? name,
    String? sku,
    double? price,
    int? quantity,
    DiscountType? discountType,
    double? discountValue,
    double? discountAmount,
    double? subtotal,
    double? total,
    String? comment,
    int? restockQty,
    int? writeOffQty,
  }) = _TransactionItem;

  factory TransactionItem.fromJson(Map<String, dynamic> json) => _$TransactionItemFromJson(json);

  const TransactionItem._();

  DataGridRow toSaleTransactionItemsRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty', value: quantity),
          DataGridCell<double>(columnName: 'price', value: price ?? 0),
          DataGridCell<double>(columnName: 'discount', value: discountAmount ?? 0),
          DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
        ],
      );

  DataGridRow toReturnTransactionItemsRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'return_qty', value: quantity),
          DataGridCell<int>(columnName: 'write_off_qty', value: writeOffQty ?? 0),
          DataGridCell<int>(columnName: 'restock_qty', value: restockQty ?? 0),
          DataGridCell<String>(columnName: 'comment', value: comment ?? Strings.empty),
        ],
      );

  DataGridRow toTransactionItemsRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<int>(columnName: 'qty', value: quantity),
          DataGridCell<double>(columnName: 'price', value: price ?? 0),
          DataGridCell<double>(columnName: 'discount', value: discountAmount ?? 0),
          DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
        ],
      );

  DataGridRow toRefundedTransactionItemsRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<int>(columnName: 'qty_refunded', value: quantity),
          DataGridCell<double>(columnName: 'price', value: price ?? 0),
          DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
        ],
      );

  /// Map to RefundItem when issuing a refund
  RefundItem get toRefundItem => RefundItem(
        id: id!,
        name: name!,
        sku: sku!,
        quantity: quantity!,
        price: price!,
        discountValue: discountAmount,
        discountType: discountType,
      );

  /// Percentage discount in peso per item unit
  double get discountInPesoPerItemUnit {
    if (discountValue != null) return price! * (discountValue! / 100);
    return 0;
  }
}
