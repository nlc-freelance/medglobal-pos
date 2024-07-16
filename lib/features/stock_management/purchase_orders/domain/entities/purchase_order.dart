import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'purchase_order.g.dart';

@JsonSerializable()
class PurchaseOrder extends Equatable {
  final int? id;
  final Branch? branch;
  final Supplier? supplier;
  final StockActionStatus? status;
  final double? totalAmount;
  final double? tax;
  final double? discount;
  final String? notes;
  @DateTimeConverter()
  final DateTime? estimatedDateOfArrival;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const PurchaseOrder({
    this.id,
    this.branch,
    this.supplier,
    this.status,
    this.totalAmount,
    this.tax,
    this.discount,
    this.estimatedDateOfArrival,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, estimatedDateOfArrival, branch, supplier, status, totalAmount, tax, discount, notes, createdAt, updatedAt];

  factory PurchaseOrder.fromJson(Map<String, dynamic> json) => _$PurchaseOrderFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseOrderToJson(this);

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(
            columnName: 'date',
            value: createdAt != null ? DateFormat.yMd().format(createdAt!) : Strings.empty,
          ),
          DataGridCell<String>(
            columnName: 'est_date_of_arrival',
            value: estimatedDateOfArrival != null ? DateFormat.yMd().format(estimatedDateOfArrival!) : Strings.empty,
          ),
          DataGridCell<String>(columnName: 'target_branch', value: branch?.name ?? Strings.empty),
          DataGridCell<String>(columnName: 'supplier', value: supplier?.name ?? Strings.empty),
          DataGridCell<double>(columnName: 'total_amount', value: totalAmount ?? 0),
          DataGridCell<StockActionStatus>(columnName: 'status', value: status),
        ],
      );
}
