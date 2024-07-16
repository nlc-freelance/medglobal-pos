import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'stock_return_item.g.dart';

@JsonSerializable()
class StockReturnItem extends Equatable {
  final int? id;
  final String? name;
  final String? sku;
  final int? qtyOnHand;
  final int? qtyToReturn;
  final double? supplierPrice;
  final double? total;

  const StockReturnItem({
    this.id,
    this.name,
    this.sku,
    this.qtyOnHand,
    this.qtyToReturn,
    this.supplierPrice,
    this.total,
  });

  @override
  List<Object?> get props => [id, name, sku, qtyOnHand, qtyToReturn, supplierPrice, total];

  factory StockReturnItem.fromJson(Map<String, dynamic> json) => _$StockReturnItemFromJson(json);

  DataGridRow toDataGridRowItems() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty_on_hand', value: qtyOnHand ?? 0),
          DataGridCell<int>(columnName: 'qty_to_return', value: qtyToReturn ?? 0),
          DataGridCell<double>(columnName: 'supplier_price', value: supplierPrice ?? 0.00),
          DataGridCell<double>(columnName: 'total', value: total),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );
  DataGridRow toDataGridRowItemsReceived() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty_on_hand', value: qtyOnHand ?? 0),
          DataGridCell<int>(columnName: 'qty_returned', value: qtyToReturn ?? 0),
          DataGridCell<double>(columnName: 'supplier_price', value: supplierPrice ?? 0.00),
          DataGridCell<double>(columnName: 'total', value: total),
        ],
      );

  StockReturnItem copyWith({
    int? id,
    String? name,
    String? sku,
    int? qtyOnHand,
    int? qtyToReturn,
    double? supplierPrice,
    double? total,
  }) {
    return StockReturnItem(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      qtyOnHand: qtyOnHand ?? this.qtyOnHand,
      qtyToReturn: qtyToReturn ?? this.qtyToReturn,
      supplierPrice: supplierPrice ?? this.supplierPrice,
      total: total ?? this.total,
    );
  }
}
