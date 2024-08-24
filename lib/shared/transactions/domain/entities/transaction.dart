import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/register.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction extends Equatable {
  final int? id;
  @JsonKey(name: 'transactionId')
  final String? receiptId;
  final int? saleTransactionId;
  final String? saleTransactionReceiptId;
  final TransactionType? type;
  final ReturnStatus? status;
  final Register? register;
  final Branch? branch;
  final Employee? employee;
  final List<TransactionItem>? items;
  final double? subtotal;
  final double? discount;
  final DiscountType? discountType;
  final double? discountInPeso;
  final double? tax;
  final double? total;
  final double? totalDiscountInPeso;
  final double? amountPaid;
  final String? reasonForReturn;
  @DateTimeConverter()
  final DateTime? createdAt;

  const Transaction({
    this.id,
    this.receiptId,
    this.saleTransactionId,
    this.saleTransactionReceiptId,
    this.status,
    this.type,
    this.register,
    this.branch,
    this.employee,
    this.items,
    this.subtotal,
    this.discount,
    this.discountType,
    this.discountInPeso,
    this.tax,
    this.total,
    this.totalDiscountInPeso,
    this.amountPaid,
    this.reasonForReturn,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        receiptId,
        saleTransactionId,
        saleTransactionReceiptId,
        status,
        type,
        register,
        branch,
        employee,
        items,
        subtotal,
        discount,
        discountType,
        discountInPeso,
        tax,
        total,
        totalDiscountInPeso,
        amountPaid,
        reasonForReturn,
        createdAt,
      ];

  /// Sale Transaction List DataGrid
  DataGridRow toSaleTransactionRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'receipt_id', value: (receiptId ?? Strings.empty).toString()),
          DataGridCell<String>(
            columnName: 'date',
            value: createdAt != null ? DateFormat('MM/dd/yyyy HH:mm').format(createdAt!.toLocal()) : Strings.empty,
          ),
          DataGridCell<String>(columnName: 'branch', value: branch?.name ?? Strings.empty),
          DataGridCell<String>(columnName: 'register_id', value: (register?.id ?? Strings.empty).toString()),
          DataGridCell<String>(columnName: 'employee', value: '${employee?.firstName} ${employee?.lastName}'),
          // DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
          // DataGridCell<double>(columnName: 'discount_in_peso', value: totalDiscountInPeso ?? 0),
          DataGridCell<double>(columnName: 'tax', value: tax ?? 0),
          DataGridCell<double>(columnName: 'total', value: total ?? 0),
        ],
      );

  /// Return Transaction List DataGrid
  DataGridRow toReturnTransactionRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(columnName: 'receipt_id', value: (receiptId ?? Strings.empty).toString()),
          DataGridCell<String>(
            columnName: 'date',
            value: createdAt != null ? DateFormat('MM/dd/yyyy HH:mm').format(createdAt!.toLocal()) : Strings.empty,
          ),
          DataGridCell<String>(columnName: 'branch', value: branch?.name ?? Strings.empty),
          DataGridCell<String>(columnName: 'employee', value: '${employee?.firstName} ${employee?.lastName}'),
          DataGridCell<double>(columnName: 'total', value: total ?? 0),
          DataGridCell<String>(columnName: 'reason_for_return', value: reasonForReturn ?? '-'),
          DataGridCell<ReturnStatus>(columnName: 'status', value: status),
        ],
      );

  /// Issue Refund Payload
  JSON toRefundPayload() {
    return {
      'registerId': register?.id,
      'saleTransactionId': saleTransactionId,
      'notes': reasonForReturn,
      'items': items?.map((item) {
        if (item.isSelected) return {'variantId': item.itemId, 'quantity': item.qtyRefund};
      }).toList(),
    };
  }

  /// Process Return Payload
  JSON toReturnPayload() {
    return {
      'items': items?.map((item) {
        return {
          'id': item.id,
          'writeOffQuantity': item.writeOffQty ?? 0,
          'restockQuantity': item.restockQty ?? 0,
          'comment': item.comment,
        };
      }).toList(),
    };
  }

  Transaction copyWith({
    int? id,
    String? receiptId,
    int? saleTransactionId,
    TransactionType? type,
    ReturnStatus? status,
    Register? register,
    Branch? branch,
    Employee? employee,
    List<TransactionItem>? items,
    double? subtotal,
    double? discount,
    DiscountType? discountType,
    double? discountInPeso,
    double? tax,
    double? total,
    double? amountPaid,
    String? reasonForReturn,
    DateTime? createdAt,
  }) {
    return Transaction(
      id: id ?? this.id,
      receiptId: receiptId ?? this.receiptId,
      saleTransactionId: saleTransactionId ?? this.saleTransactionId,
      type: type ?? this.type,
      status: status ?? this.status,
      register: register ?? this.register,
      branch: branch ?? this.branch,
      employee: employee ?? this.employee,
      items: items ?? this.items,
      subtotal: subtotal ?? this.subtotal,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      discountInPeso: discountInPeso ?? this.discountInPeso,
      tax: tax ?? this.tax,
      total: total ?? this.total,
      amountPaid: amountPaid ?? this.amountPaid,
      reasonForReturn: reasonForReturn ?? this.reasonForReturn,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Receipt extensions

  String get branchAddress {
    return switch (branch?.id) {
      1 => 'Las Pinas NCR 1550',
      2 => 'Martinez Mandaluyong NCR 1550',
      3 => 'Correctional  NCR 1550',
      _ => Strings.noValue,
    };
  }

  String get registerNo =>
      register?.name?.isNotEmpty == true ? register!.name!.substring(register!.name!.length - 1) : Strings.noValue;
}
