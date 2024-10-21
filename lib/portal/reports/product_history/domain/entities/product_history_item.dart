import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'product_history_item.g.dart';

@JsonSerializable()
class ProductHistoryItem {
  final int? id;
  final DateTime? dateTime;
  final String? employeeName;
  final ProductHistoryAction? action;
  final int? qtyBefore;
  final int? qtyAfter;
  final int? change;

  const ProductHistoryItem({
    this.id,
    this.dateTime,
    this.employeeName,
    this.action,
    this.qtyBefore,
    this.qtyAfter,
    this.change,
  });

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(
              columnName: 'datetime',
              value: dateTime != null ? DateFormat('MM/dd/yyyy HH:mm').format(dateTime!.toLocal()) : '-'),
          DataGridCell<String>(columnName: 'employee_name', value: employeeName),
          DataGridCell<ProductHistoryAction>(columnName: 'action', value: action),
          DataGridCell<int>(columnName: 'qty_before', value: qtyBefore),
          DataGridCell<int>(columnName: 'change', value: change),
          DataGridCell<int>(columnName: 'qty_after', value: qtyAfter),
        ],
      );

  factory ProductHistoryItem.fromJson(Map<String, dynamic> json) => _$ProductHistoryItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductHistoryItemToJson(this);
}
