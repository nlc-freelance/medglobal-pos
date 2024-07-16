import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'stock_transfer_item.g.dart';

@JsonSerializable()
class StockTransferItem extends Equatable {
  final int? id;
  final String? name;
  final String? sku;
  final int? qtyAtSource;
  final int? qtyAtDestination;
  final int? qtyToTransfer;
  final double? cost;
  final double? subtotal;

  const StockTransferItem({
    this.id,
    this.name,
    this.sku,
    this.qtyAtSource,
    this.qtyAtDestination,
    this.qtyToTransfer,
    this.cost,
    this.subtotal,
  });

  @override
  List<Object?> get props => [id, name, sku, qtyAtSource, qtyAtDestination, qtyToTransfer, cost, subtotal];

  factory StockTransferItem.fromJson(Map<String, dynamic> json) => _$StockTransferItemFromJson(json);

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty_at_source', value: qtyAtSource ?? 0),
          DataGridCell<int>(columnName: 'qty_at_destination', value: qtyAtDestination ?? 0),
          DataGridCell<int>(columnName: 'qty_to_transfer', value: qtyToTransfer ?? 0),
          DataGridCell<double>(columnName: 'cost', value: cost ?? 0),
          DataGridCell<double>(columnName: 'subtotal', value: (qtyToTransfer ?? 0) * (cost ?? 0)),
        ],
      );

  StockTransferItem copyWith({
    int? id,
    String? name,
    String? sku,
    int? qtyAtSource,
    int? qtyAtDestination,
    int? qtyToTransfer,
    double? cost,
    double? subtotal,
  }) {
    return StockTransferItem(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      qtyAtSource: qtyAtSource ?? this.qtyAtSource,
      qtyAtDestination: qtyAtDestination ?? this.qtyAtDestination,
      qtyToTransfer: qtyToTransfer ?? this.qtyToTransfer,
      cost: cost ?? this.cost,
      subtotal: subtotal ?? this.subtotal,
    );
  }
}
