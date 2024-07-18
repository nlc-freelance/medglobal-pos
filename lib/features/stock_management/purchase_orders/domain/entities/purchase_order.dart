import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order_item.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';

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
  final List<PurchaseOrderItem>? items;
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
    this.items,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        estimatedDateOfArrival,
        branch,
        supplier,
        status,
        totalAmount,
        tax,
        discount,
        notes,
        items,
        createdAt,
        updatedAt
      ];

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

  JSON toSavePayload() => {
        'status': 'new',
        'purchaseOrderDetails': items
            ?.map((item) => {
                  'variantId': item.variantId,
                  'orderedQuantity': item.qtyToOrder,
                  'supplierPrice': item.supplierPrice,
                })
            .toList(),
        'estimatedDateOfArrival': estimatedDateOfArrival?.toIso8601String(),
        'tax': tax,
        'discount': discount,
        'notes': notes,
      };

  JSON toSaveAndMarkAsShippedWithNewItemsPayload() => {
        'status': 'for receiving',
        'purchaseOrderDetails': items
            ?.map((item) => {
                  'variantId': item.variantId,
                  'orderedQuantity': item.qtyToOrder,
                  'supplierPrice': item.supplierPrice,
                })
            .toList(),
        'estimatedDateOfArrival': estimatedDateOfArrival?.toIso8601String(),
        'tax': tax,
        'discount': discount,
        'notes': notes,
      };

  JSON toSaveAndMarkAsShippedPayload() => {
        'status': 'for receiving',
        'purchaseOrderDetails': items
            ?.map((item) => {
                  'id': item.id,
                  'orderedQuantity': item.qtyToOrder,
                  'supplierPrice': item.supplierPrice,
                })
            .toList(),
        'estimatedDateOfArrival': estimatedDateOfArrival?.toIso8601String(),
        'tax': tax,
        'discount': discount,
        'notes': notes,
      };

  JSON toSaveAndReceivedPayload() => {
        'status': 'completed',
        'purchaseOrderDetails': items
            ?.map((item) => {
                  'id': item.id,
                  'receivedQuantity': item.qtyReceived,
                })
            .toList(),
        'notes': notes,
      };

  JSON toCancelPayload() => {'status': 'cancelled'};

  PurchaseOrder copyWith({
    int? id,
    Branch? branch,
    Supplier? supplier,
    StockActionStatus? status,
    double? totalAmount,
    double? tax,
    double? discount,
    String? notes,
    List<PurchaseOrderItem>? items,
    DateTime? estimatedDateOfArrival,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PurchaseOrder(
      id: id ?? this.id,
      branch: branch ?? this.branch,
      supplier: supplier ?? this.supplier,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      tax: tax ?? this.tax,
      discount: discount ?? this.discount,
      notes: notes ?? this.notes,
      items: items ?? this.items,
      estimatedDateOfArrival: estimatedDateOfArrival ?? this.estimatedDateOfArrival,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
