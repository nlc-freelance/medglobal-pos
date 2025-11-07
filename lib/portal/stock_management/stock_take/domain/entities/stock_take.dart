import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_item.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'stock_take.g.dart';

@JsonSerializable()
class StockTake extends Equatable {
  final int? id;
  final BranchPartial? branch;
  final Supplier? supplier;
  final bool? isAllSupplier;
  final StockOrderStatus? status;
  final String? description;
  final int? totalQtyDifference;
  final double? totalCostDifference;
  final List<StockTakeItem>? items;
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
    this.items,
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
        items,
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
            value: createdAt != null ? DateFormat('MM/dd/yyyy HH:mm').format(createdAt!) : '-',
          ),
          DataGridCell<String>(
            columnName: 'complete_time',
            value: status == StockOrderStatus.COMPLETED ? DateFormat('MM/dd/yyyy HH:mm').format(updatedAt!) : '-',
          ),
          DataGridCell<String>(columnName: 'description', value: description ?? '-'),
          DataGridCell<String>(columnName: 'branch', value: branch?.name ?? '-'),
          DataGridCell<String>(
            columnName: 'supplier',
            value: isAllSupplier == true ? 'All Suppliers' : supplier?.name ?? '-',
          ),
          DataGridCell<StockOrderStatus>(columnName: 'status', value: status),
        ],
      );

  JSON toPayload(StockOrderUpdate type, {int? uncountedItemsValue}) {
    String? status;
    if (type == StockOrderUpdate.SAVE) status = 'in progress';
    if (type == StockOrderUpdate.MARK_AS_COMPLETE) status = 'completed';
    if (type == StockOrderUpdate.CANCEL) status = 'cancelled';

    return {
      'status': status,
      if (type == StockOrderUpdate.MARK_AS_COMPLETE) 'uncountedItemValue': uncountedItemsValue,
      'notes': description,
    };
  }

  StockTake copyWith({
    int? id,
    BranchPartial? branch,
    Supplier? supplier,
    bool? isAllSupplier,
    StockOrderStatus? status,
    String? description,
    int? totalQtyDifference,
    double? totalCostDifference,
    List<StockTakeItem>? items,
    DateTime? completedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StockTake(
      id: id ?? this.id,
      branch: branch ?? this.branch,
      supplier: supplier ?? this.supplier,
      isAllSupplier: isAllSupplier ?? this.isAllSupplier,
      status: status ?? this.status,
      description: description ?? this.description,
      totalQtyDifference: totalQtyDifference ?? this.totalQtyDifference,
      totalCostDifference: totalCostDifference ?? this.totalCostDifference,
      items: items ?? this.items,
      completedAt: completedAt ?? this.completedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
