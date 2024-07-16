import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/datetime_converter.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'stock_return.g.dart';

@JsonSerializable()
class StockReturn extends Equatable {
  final int? id;
  final Branch? branch;
  final Supplier? supplier;
  final StockActionStatus? status;
  final double? totalAmount;
  final double? tax;
  final double? discount;
  final String? notes;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const StockReturn({
    this.id,
    this.branch,
    this.supplier,
    this.status,
    this.totalAmount,
    this.tax,
    this.discount,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, branch, supplier, status, totalAmount, tax, discount, notes, createdAt, updatedAt];

  factory StockReturn.fromJson(Map<String, dynamic> json) => _$StockReturnFromJson(json);

  Map<String, dynamic> toJson() => _$StockReturnToJson(this);

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(
            columnName: 'date',
            value: createdAt != null ? DateFormat.yMd().format(createdAt!) : Strings.empty,
          ),
          DataGridCell<String>(columnName: 'target_branch', value: branch?.name ?? Strings.empty),
          DataGridCell<String>(columnName: 'supplier', value: supplier?.name ?? Strings.empty),
          DataGridCell<double>(columnName: 'total_amount', value: totalAmount ?? 0),
          DataGridCell<StockActionStatus>(columnName: 'status', value: status),
        ],
      );
}
