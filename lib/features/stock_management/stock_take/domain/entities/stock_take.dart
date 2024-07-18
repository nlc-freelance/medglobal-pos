import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'stock_take.g.dart';

@JsonSerializable()
class StockTake extends Equatable {
  final int? id;
  final Branch? branch;
  final Supplier? supplier;
  final bool? isAllSupplier;
  final StockOrderStatus? status;
  final String? description;
  final double? totalQtyDifference;
  final double? totalCostDifference;
  @DateTimeConverter()
  final DateTime? completedAt;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const StockTake({
    this.id,
    this.branch,
    this.supplier,
    this.status,
    this.isAllSupplier,
    this.description,
    this.totalQtyDifference,
    this.totalCostDifference,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        branch,
        supplier,
        status,
        isAllSupplier,
        description,
        totalQtyDifference,
        totalCostDifference,
        completedAt,
        createdAt,
        updatedAt
      ];

  factory StockTake.fromJson(Map<String, dynamic> json) => _$StockTakeFromJson(json);

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(
            columnName: 'start_time',
            value: createdAt != null ? DateFormat('MM/dd/yyyy HH:mm').format(createdAt!) : Strings.empty,
          ),
          DataGridCell<String>(
            columnName: 'complete_time',
            value: completedAt != null ? DateFormat('MM/dd/yyyy HH:mm').format(completedAt!) : Strings.empty,
          ),
          DataGridCell<String>(columnName: 'description', value: description ?? Strings.empty),
          DataGridCell<String>(columnName: 'branch', value: branch?.name ?? Strings.empty),
          DataGridCell<String>(
            columnName: 'supplier',
            value: isAllSupplier == true ? 'All Suppliers' : supplier?.name ?? Strings.empty,
          ),
          DataGridCell<StockOrderStatus>(columnName: 'status', value: status),
        ],
      );
}
