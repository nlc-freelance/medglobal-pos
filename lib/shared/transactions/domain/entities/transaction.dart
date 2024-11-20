import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';
import 'package:medglobal_admin_portal/shared/employee/entities/employee.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register.dart';
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
  final double? tax;
  final double? total;
  final String? reasonForReturn;
  @DateTimeConverter()
  final DateTime? createdAt;

  /// These are for full bill discount, but full bill discounts has been requested to be removed
  final double? discount;
  final DiscountType? discountType;
  final double? discountInPeso;

  /// This will be the total discount from all items (sum of all discounts per item)
  final double? totalDiscountInPeso;

  /// This is the cash the customer gave as payment
  final double? amountPaid;

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

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

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
          DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
          DataGridCell<double>(columnName: 'total_discount', value: totalDiscountInPeso ?? 0),
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

  /// Shift Transaction List DataGrid
  DataGridRow toShiftTransactionRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),
          DataGridCell<String>(
            columnName: 'date',
            value: createdAt != null ? DateFormat('MM/dd/yyyy HH:mm').format(createdAt!.toLocal()) : Strings.empty,
          ),
          DataGridCell<String>(columnName: 'employee', value: branch?.name ?? Strings.empty),
          DataGridCell<String>(columnName: 'type', value: type?.label ?? Strings.empty),
          DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
          DataGridCell<double>(columnName: 'total_discount', value: totalDiscountInPeso ?? 0),
          DataGridCell<double>(columnName: 'tax', value: tax ?? 0),
          DataGridCell<double>(columnName: 'total', value: total ?? 0),
        ],
      );

  /// Issue Refund Payload
  JSON toRefundPayload() {
    return {
      'registerId': register?.id,
      'saleTransactionId': saleTransactionId,
      'notes': reasonForReturn,
      'items': items
          ?.where((item) => item.isSelected)
          .map((item) => {'variantId': item.itemId, 'quantity': item.qtyRefund})
          .toList(),
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

  /// Create sale payload
  JSON toPayload(int registerId) => {
        'registerId': registerId,
        'discount': discount,
        'discountType': discountType == DiscountType.PERCENT ? 'percentage' : 'fixed',
        'tax': tax,
        'total': total,
        'amountPaid': amountPaid,
        'items': items
                ?.map((item) => {
                      'variantId': item.itemId,
                      'quantity': item.qty,
                      'discount': item.discount,
                      'discountType': item.discountType == DiscountType.PERCENT ? 'percentage' : 'fixed',
                    })
                .toList() ??
            [],
      };

  Transaction copyWith({
    int? id,
    String? receiptId,
    int? saleTransactionId,
    String? saleTransactionReceiptId,
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
    double? totalDiscountInPeso,
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
      saleTransactionReceiptId: saleTransactionReceiptId ?? this.saleTransactionReceiptId,
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
      totalDiscountInPeso: totalDiscountInPeso ?? this.totalDiscountInPeso,
      tax: tax ?? this.tax,
      total: total ?? this.total,
      amountPaid: amountPaid ?? this.amountPaid,
      reasonForReturn: reasonForReturn ?? this.reasonForReturn,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  /// Bill
  bool hasChangedAnyItem(Transaction other) {
    return items != other.items;

    /// These applies when there is a full bill discount
    // discount != other.discount ||
    // discountInPeso != other.discountInPeso ||
    // discountType != other.discountType;
  }

  /// Receipt extensions
  String get registerNo =>
      register?.name?.isNotEmpty == true ? register!.name!.substring(register!.name!.length - 1) : Strings.noValue;
}
