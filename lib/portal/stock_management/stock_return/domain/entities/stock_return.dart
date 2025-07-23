import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return_item.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'stock_return.g.dart';

@JsonSerializable()
class StockReturn extends Equatable {
  final int? id;
  final Branch? branch;
  final Supplier? supplier;
  final StockOrderStatus? status;
  final double? totalAmount;
  final double? tax;
  final double? discount;
  final String? notes;
  final List<StockReturnItem>? items;
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
    this.items,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props =>
      [id, branch, supplier, status, totalAmount, tax, discount, notes, items, createdAt, updatedAt];

  factory StockReturn.fromJson(Map<String, dynamic> json) => _$StockReturnFromJson(json);

  Map<String, dynamic> toJson() => _$StockReturnToJson(this);

  DataGridRow toDataGridRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(
            columnName: 'date',
            value: createdAt != null ? DateFormat.yMd().format(createdAt!) : '-',
          ),
          DataGridCell<String>(columnName: 'target_branch', value: branch?.name ?? '-'),
          DataGridCell<String>(columnName: 'supplier', value: supplier?.name ?? '-'),
          DataGridCell<double>(columnName: 'total_amount', value: totalAmount ?? 0),
          DataGridCell<StockOrderStatus>(columnName: 'status', value: status),
        ],
      );

  JSON toSavePayload() => {
        'status': 'new',
        'stockReturnDetails': items
            ?.map((item) => {
                  'variantId': item.variantId,
                  'quantity': item.qtyToReturn,
                  'supplierPrice': item.supplierPrice,
                })
            .toList(),
        'tax': tax,
        'discount': discount,
        'notes': notes,
      };

  JSON toSaveAndMarkAsShippedWithNewItemsPayload() => {
        'status': 'completed',
        'stockReturnDetails': items
            ?.map((item) => {
                  'variantId': item.variantId,
                  'quantity': item.qtyToReturn,
                  'supplierPrice': item.supplierPrice,
                })
            .toList(),
        'tax': tax,
        'discount': discount,
        'notes': notes,
      };

  JSON toSaveAndMarkAsShippedPayload() => {
        'status': 'completed',
        'stockReturnDetails': items
            ?.map((item) => {
                  'id': item.id,
                  'quantity': item.qtyToReturn,
                  'supplierPrice': item.supplierPrice,
                })
            .toList(),
        'tax': tax,
        'discount': discount,
        'notes': notes,
      };

  StockReturn copyWith({
    int? id,
    Branch? branch,
    Supplier? supplier,
    StockOrderStatus? status,
    double? totalAmount,
    double? tax,
    double? discount,
    String? notes,
    List<StockReturnItem>? items,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StockReturn(
      id: id ?? this.id,
      branch: branch ?? this.branch,
      supplier: supplier ?? this.supplier,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      tax: tax ?? this.tax,
      discount: discount ?? this.discount,
      notes: notes ?? this.notes,
      items: items ?? this.items,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
