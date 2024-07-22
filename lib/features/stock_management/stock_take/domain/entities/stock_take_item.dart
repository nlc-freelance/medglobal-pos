import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'stock_take_item.g.dart';

@JsonSerializable()
class StockTakeItem extends Equatable {
  final int? id;
  final int? variantId;
  final String? name;
  final String? sku;
  final int? qtyCounted;
  final int? qtyExpected;
  final int? difference;
  final double? costDifference;

  const StockTakeItem({
    this.id,
    this.variantId,
    this.name,
    this.sku,
    this.qtyCounted,
    this.qtyExpected,
    this.difference,
    this.costDifference,
  });

  @override
  List<Object?> get props => [id, variantId, name, sku, qtyCounted, qtyExpected, difference, costDifference];

  factory StockTakeItem.fromJson(Map<String, dynamic> json) => _$StockTakeItemFromJson(json);

  DataGridRow toDataGridRowUncountedItems() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'variant_name', value: name),
          DataGridCell<String>(columnName: 'sku', value: sku),
          DataGridCell<int>(columnName: 'qty_expected', value: qtyExpected ?? 0),
          DataGridCell<int>(columnName: 'qty_counted', value: qtyCounted),
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
          DataGridCell<int>(columnName: 'difference', value: (qtyCounted ?? 0) - (qtyExpected ?? 0)),
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
          DataGridCell<int>(columnName: 'difference', value: difference ?? 0),
          DataGridCell<double>(columnName: 'cost_difference', value: costDifference),
        ],
      );

  StockTakeItem copyWith({
    int? id,
    int? variantId,
    String? name,
    String? sku,
    int? qtyCounted,
    int? qtyExpected,
    int? difference,
    double? costDifference,
  }) {
    return StockTakeItem(
      id: id ?? this.id,
      variantId: variantId ?? this.variantId,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      qtyCounted: qtyCounted,
      qtyExpected: qtyExpected ?? this.qtyExpected,
      difference: difference ?? this.difference,
      costDifference: costDifference ?? this.costDifference,
    );
  }
}
