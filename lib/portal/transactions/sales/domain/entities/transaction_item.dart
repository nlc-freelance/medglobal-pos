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
  final double? price;
  final double? discountedPrice;
  final double? discount;
  final DiscountType? discountType;
  final double? subtotal;

  const TransactionItem({
    this.id,
    this.itemId,
    this.name,
    this.sku,
    this.qty,
    this.price,
    this.discountedPrice,
    this.discount,
    this.discountType,
    this.subtotal,
  });

  @override
  List<Object?> get props => [id, itemId, name, sku, qty, price, subtotal, discount, discountType, discountedPrice];

  factory TransactionItem.fromJson(Map<String, dynamic> json) => _$TransactionItemFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemToJson(this);

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty', value: qty ?? 0),
          DataGridCell<double>(columnName: 'price', value: price ?? 0),
          DataGridCell<double>(columnName: 'discount', value: discount ?? 0),
          DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
        ],
      );
}
