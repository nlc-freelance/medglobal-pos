import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'stock_transfer_item.g.dart';

@JsonSerializable()
class StockTransferItem extends Equatable {
  final int? id;
  final int? variantId;
  final String? name;
  final String? sku;
  final int? qtyAtSource;
  final int? qtyAtDestination;
  final int? qtyToTransfer;
  final int? qtyReceived;
  final double? cost;
  final double? total;

  const StockTransferItem({
    this.id,
    this.variantId,
    this.name,
    this.sku,
    this.qtyAtSource,
    this.qtyAtDestination,
    this.qtyToTransfer,
    this.qtyReceived,
    this.cost,
    this.total,
  });

  @override
  List<Object?> get props =>
      [id, variantId, name, sku, qtyAtSource, qtyAtDestination, qtyToTransfer, qtyReceived, cost, total];

  factory StockTransferItem.fromJson(Map<String, dynamic> json) => _$StockTransferItemFromJson(json);

  DataGridRow toDataGridRowItemsToTransfer() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty_at_source', value: qtyAtSource),
          DataGridCell<int>(columnName: 'qty_at_destination', value: qtyAtDestination ?? 0),
          DataGridCell<int>(columnName: 'qty_to_transfer', value: qtyToTransfer),
          DataGridCell<double>(columnName: 'cost', value: cost ?? 0),
          DataGridCell<double>(columnName: 'total', value: total ?? 0),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );
  DataGridRow toDataGridRowItemsShipped() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty_transferred', value: qtyToTransfer),
          DataGridCell<int>(columnName: 'qty_received', value: qtyReceived),
          DataGridCell<double>(columnName: 'cost', value: cost ?? 0),
          DataGridCell<double>(columnName: 'total', value: (qtyReceived ?? 0) * (cost ?? 0)),
        ],
      );
  DataGridRow toDataGridRowItemsTransferred() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty_transferred', value: qtyToTransfer),
          DataGridCell<int>(columnName: 'qty_received', value: qtyReceived),
          DataGridCell<double>(columnName: 'cost', value: cost),
          DataGridCell<double>(columnName: 'total', value: total),
        ],
      );

  StockTransferItem copyWith({
    int? id,
    int? variantId,
    String? name,
    String? sku,
    int? qtyAtSource,
    int? qtyAtDestination,
    int? qtyToTransfer,
    int? qtyReceived,
    double? cost,
    double? total,
    bool? nullQtyToTransfer = false,
    bool? nullQtyReceived = false,
  }) {
    return StockTransferItem(
      id: id ?? this.id,
      variantId: variantId ?? this.variantId,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      qtyAtSource: qtyAtSource ?? this.qtyAtSource,
      qtyAtDestination: qtyAtDestination ?? this.qtyAtDestination,
      qtyToTransfer: nullQtyToTransfer == true ? null : qtyToTransfer ?? this.qtyToTransfer,
      qtyReceived: nullQtyReceived == true ? null : qtyReceived ?? this.qtyReceived,
      cost: cost ?? this.cost,
      total: total ?? this.total,
    );
  }
}
