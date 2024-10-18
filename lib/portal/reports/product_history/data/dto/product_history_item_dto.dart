import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'product_history_item_dto.g.dart';

@JsonSerializable()
class ProductHistoryItemDto {
  final int? id;
  final DateTime? dateTime;
  final String? employeeName;
  final String? action;
  final int? qtyBefore;
  final int? qtyAfter;
  final int? difference;

  const ProductHistoryItemDto({
    this.id,
    this.dateTime,
    this.employeeName,
    this.action,
    this.qtyBefore,
    this.qtyAfter,
    this.difference,
  });

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(
              columnName: 'datetime',
              value: dateTime != null ? DateFormat('MM/dd/yyyy HH:mm').format(dateTime!.toLocal()) : '-'),
          DataGridCell<String>(columnName: 'employee_name', value: employeeName),
          DataGridCell<String>(columnName: 'action', value: action),
          DataGridCell<int>(columnName: 'qty_before', value: qtyBefore),
          DataGridCell<int>(columnName: 'change', value: difference),
          DataGridCell<int>(columnName: 'qty_after', value: qtyAfter),
        ],
      );

  factory ProductHistoryItemDto.fromJson(Map<String, dynamic> json) => _$ProductHistoryItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductHistoryItemDtoToJson(this);
}
