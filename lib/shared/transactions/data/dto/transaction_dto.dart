import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/data/dto/branch_dto.dart';
import 'package:medglobal_admin_portal/shared/employee/dto/employee_dto.dart';
import 'package:medglobal_admin_portal/shared/register/data/dto/register_dto.dart';
import 'package:medglobal_admin_portal/shared/transactions/data/dto/transaction_item_dto.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

part 'transaction_dto.g.dart';

@JsonSerializable()
class TransactionDto extends Equatable {
  final int? id;
  @JsonKey(name: 'transactionId')
  final String? receiptId;
  final int? saleTransactionId;
  final String? saleTransactionReceiptId;
  final String? type;
  final String? status;
  final RegisterDto? register;
  @JsonKey(name: 'store')
  final BranchDto? branch;
  @JsonKey(name: 'user')
  final EmployeeDto? employee;
  final List<TransactionItemDto>? items;
  @JsonKey(name: 'subTotal')
  final double? subtotal;
  final double? discount;
  final String? discountType;
  final double? discountInPeso;
  final double? tax;
  final double? total;
  final double? totalDiscountInPeso;
  final double? amountPaid;
  @JsonKey(name: 'notes')
  final String? reasonForReturn;
  @DateTimeConverter()
  final DateTime? createdAt;

  const TransactionDto({
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
    this.reasonForReturn,
    this.amountPaid,
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
        createdAt
      ];

  factory TransactionDto.fromJson(Map<String, dynamic> json) => _$TransactionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDtoToJson(this);

  Transaction toEntity() => Transaction(
        id: id,
        receiptId: receiptId,
        saleTransactionId: saleTransactionId,
        saleTransactionReceiptId: saleTransactionReceiptId,
        status: status == 'completed' ? ReturnStatus.COMPLETED : ReturnStatus.AWAITING_ACTION,
        type: type == 'sale' ? TransactionType.SALE : TransactionType.REFUND,
        register: register?.toEntity(),
        branch: branch?.toEntity(),
        employee: employee?.toEntity(),
        items: items?.map((item) => item.toEntity()).toList() ?? [],
        subtotal: subtotal,
        discount: discount,
        discountType: discountType == 'fixed' ? DiscountType.PESO : DiscountType.PERCENT,
        discountInPeso: discountInPeso,
        tax: tax,
        total: total,
        totalDiscountInPeso: totalDiscountInPeso,
        reasonForReturn: reasonForReturn,
        amountPaid: amountPaid,
        createdAt: createdAt,
      );
}
