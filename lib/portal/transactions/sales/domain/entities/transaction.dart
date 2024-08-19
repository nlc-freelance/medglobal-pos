import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/register.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/transaction_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction extends Equatable {
  final int? id;
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
  final double? amountPaid;
  final double? totalDiscountInPeso;
  @DateTimeConverter()
  final DateTime? createdAt;

  const Transaction({
    this.id,
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
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
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
        createdAt
      ];

  DataGridRow toSaleTransactionRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),

          /// Replace with receipt id
          DataGridCell<String>(columnName: 'receipt_id', value: (id ?? Strings.empty).toString()),
          DataGridCell<String>(
            columnName: 'date',
            value: createdAt != null ? DateFormat('MM/dd/yyyy HH:mm').format(createdAt!.toLocal()) : Strings.empty,
          ),
          DataGridCell<String>(columnName: 'branch', value: branch?.name ?? Strings.empty),
          DataGridCell<String>(columnName: 'register_id', value: (register?.id ?? Strings.empty).toString()),
          DataGridCell<String>(columnName: 'employee', value: '${employee?.firstName} ${employee?.lastName}'),
          DataGridCell<double>(columnName: 'subtotal', value: subtotal ?? 0),
          DataGridCell<double>(columnName: 'discount_in_peso', value: totalDiscountInPeso ?? 0),
          DataGridCell<double>(columnName: 'tax', value: tax ?? 0),
          DataGridCell<double>(columnName: 'total', value: total ?? 0),
        ],
      );

  DataGridRow toReturnTransactionRow() => DataGridRow(
        cells: [
          DataGridCell<int>(columnName: 'id', value: id),

          /// Replace with receipt id
          DataGridCell<String>(columnName: 'receipt_id', value: (id ?? Strings.empty).toString()),
          DataGridCell<String>(
            columnName: 'date',
            value: createdAt != null ? DateFormat('MM/dd/yyyy HH:mm').format(createdAt!.toLocal()) : Strings.empty,
          ),
          DataGridCell<String>(columnName: 'branch', value: branch?.name ?? Strings.empty),
          DataGridCell<String>(columnName: 'register_id', value: (register?.id ?? Strings.empty).toString()),
          DataGridCell<String>(columnName: 'employee', value: '${employee?.firstName} ${employee?.lastName}'),
          DataGridCell<double>(columnName: 'total', value: total ?? 0),
          const DataGridCell<String>(columnName: 'reason_for_return', value: ''),
          const DataGridCell<String>(columnName: 'status', value: 'Awaiting Action'),
        ],
      );
}
