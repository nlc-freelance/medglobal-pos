import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'sales_per_shift.g.dart';

@JsonSerializable()
class SalesPerShift extends Equatable {
  final int? id;
  @DateTimeConverter()
  final DateTime? openTime;
  @DateTimeConverter()
  final DateTime? closeTime;
  final String? branch;
  final String? register;
  final int? totalSaleTransactions;
  final double? totalSalesAmount;

  const SalesPerShift({
    this.id,
    this.openTime,
    this.closeTime,
    this.branch,
    this.register,
    this.totalSaleTransactions,
    this.totalSalesAmount,
  });

  @override
  List<Object?> get props => [openTime, closeTime, branch, register, totalSaleTransactions, totalSalesAmount];

  factory SalesPerShift.fromJson(Map<String, dynamic> json) => _$SalesPerShiftFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPerShiftToJson(this);

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(
            columnName: 'open_time',
            value: openTime != null ? DateFormat('MM/dd/yyyy HH:mm').format(openTime!) : '-',
          ),
          DataGridCell<String>(
            columnName: 'close_time',
            value: closeTime != null ? DateFormat('MM/dd/yyyy HH:mm').format(closeTime!) : '-',
          ),
          DataGridCell<String>(columnName: 'branch', value: branch),
          DataGridCell<String>(columnName: 'register', value: register),
          DataGridCell<int>(columnName: 'total_sale_transactions', value: totalSaleTransactions),
          DataGridCell<double>(columnName: 'total_sales_amt', value: totalSalesAmount),
        ],
      );
}
