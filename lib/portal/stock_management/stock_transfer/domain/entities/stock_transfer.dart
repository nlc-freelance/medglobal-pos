import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_item.dart';

part 'stock_transfer.g.dart';

@JsonSerializable()
class StockTransfer extends Equatable {
  final int? id;
  final Branch? sourceBranch;
  final Branch? destinationBranch;
  final StockOrderStatus? status;
  final List<StockTransferItem>? items;
  final String? notes;
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
    this.items,
    this.notes,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, sourceBranch, destinationBranch, status, items, notes, completedAt, createdAt, updatedAt];

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
          DataGridCell<StockOrderStatus>(columnName: 'status', value: status),
        ],
      );

  JSON toSavePayload() => {
        'status': 'new',
        'stockTransferDetails': items
            ?.map((item) => {
                  'variantId': item.variantId,
                  'quantityToTransfer': item.qtyToTransfer,
                  'cost': item.cost,
                })
            .toList(),
        'notes': notes,
      };

  JSON toSaveAndMarkAsShippedWithNewItemsPayload() => {
        'status': 'shipped',
        'stockTransferDetails': items
            ?.map((item) => {
                  'variantId': item.variantId,
                  'quantityToTransfer': item.qtyToTransfer,
                  'cost': item.cost,
                })
            .toList(),
        'notes': notes,
      };

  JSON toSaveAndMarkAsShippedPayload() => {
        'status': 'shipped',
        'stockTransferDetails': items
            ?.map((item) => {
                  'id': item.id,
                  'quantityToTransfer': item.qtyToTransfer,
                  'cost': item.cost,
                })
            .toList(),
        'notes': notes,
      };

  JSON toSaveAndReceivedPayload() => {
        'status': 'completed',
        'stockTransferDetails': items
            ?.map((item) => {
                  'id': item.id,
                  'receivedQuantity': item.qtyReceived,
                })
            .toList(),
        'notes': notes,
      };

  JSON toCancelPayload() => {'status': 'cancelled'};

  StockTransfer copyWith({
    int? id,
    Branch? sourceBranch,
    Branch? destinationBranch,
    StockOrderStatus? status,
    List<StockTransferItem>? items,
    String? notes,
    DateTime? completedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StockTransfer(
      id: id ?? this.id,
      sourceBranch: sourceBranch ?? this.sourceBranch,
      destinationBranch: destinationBranch ?? this.destinationBranch,
      status: status ?? this.status,
      items: items ?? this.items,
      notes: notes ?? this.notes,
      completedAt: completedAt ?? this.completedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
