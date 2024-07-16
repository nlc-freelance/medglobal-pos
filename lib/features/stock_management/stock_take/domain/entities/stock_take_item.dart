import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'stock_take_item.g.dart';

@JsonSerializable()
class StockTakeItem extends Equatable {
  final int? id;
  final String? name;
  final String? sku;
  final int? qtyCounted;
  final int? qtyExpected;
  final double? cost;

  const StockTakeItem({
    this.id,
    this.name,
    this.sku,
    this.qtyCounted,
    this.qtyExpected,
    this.cost,
  });

  @override
  List<Object?> get props => [id, name, sku, qtyCounted, qtyExpected, cost];

  factory StockTakeItem.fromJson(Map<String, dynamic> json) => _$StockTakeItemFromJson(json);

  DataGridRow toDataGridRowUncountedItems() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty_expected', value: qtyExpected ?? 0),
          DataGridCell<int>(columnName: 'qty_counted', value: qtyCounted ?? 0),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );
  DataGridRow toDataGridRowCountedItems() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty_expected', value: qtyExpected ?? 0),
          DataGridCell<int>(columnName: 'qty_counted', value: qtyCounted ?? 0),
          DataGridCell<int>(columnName: 'difference', value: (qtyExpected ?? 0) - (qtyCounted ?? 0)),
          const DataGridCell(columnName: 'action', value: null),
        ],
      );
  DataGridRow toDataGridRowCompleted() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty_expected', value: qtyExpected ?? 0),
          DataGridCell<int>(columnName: 'qty_counted', value: qtyCounted ?? 0),
          DataGridCell<int>(columnName: 'difference', value: (qtyExpected ?? 0) - (qtyCounted ?? 0)),
          DataGridCell<double>(
            columnName: 'cost_difference',
            value: (cost ?? 0) * ((qtyExpected ?? 0) - (qtyCounted ?? 0)),
          ),
        ],
      );

  StockTakeItem copyWith({
    int? id,
    String? name,
    String? sku,
    int? qtyCounted,
  }) {
    return StockTakeItem(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      qtyCounted: qtyCounted ?? this.qtyCounted,
    );
  }
}
