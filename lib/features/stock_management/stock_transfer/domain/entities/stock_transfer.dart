import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'stock_transfer.g.dart';

@JsonSerializable()
class StockTransfer extends Equatable {
  final int? id;
  final Branch? sourceBranch;
  final Branch? destinationBranch;
  final StockActionStatus? status;
  @DateTimeConverter()
  final DateTime? completedAt;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const StockTransfer({
    this.id,
    this.sourceBranch,
    this.destinationBranch,
    this.status,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, sourceBranch, destinationBranch, status, completedAt, createdAt, updatedAt];

  factory StockTransfer.fromJson(Map<String, dynamic> json) => _$StockTransferFromJson(json);

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(
            columnName: 'created_date',
            value: createdAt != null ? DateFormat('MM/dd/yyyy HH:mm').format(createdAt!) : Strings.empty,
          ),
          DataGridCell<String>(columnName: 'source_branch', value: sourceBranch?.name ?? Strings.empty),
          DataGridCell<String>(columnName: 'destination_branch', value: destinationBranch?.name ?? Strings.empty),
          DataGridCell<StockActionStatus>(columnName: 'status', value: status),
        ],
      );
}
