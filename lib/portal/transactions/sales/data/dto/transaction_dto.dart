import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/branches/data/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/data/dto/employee_dto.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/data/dto/register_dto.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/data/dto/transaction_item_dto.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/domain/entities/transaction.dart';

part 'transaction_dto.g.dart';

@JsonSerializable()
class TransactionDto extends Equatable {
  final int? id;
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
  final double? amountPaid;
  @DateTimeConverter()
  final DateTime? createdAt;

  const TransactionDto({
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
        amountPaid,
        createdAt
      ];

  factory TransactionDto.fromJson(Map<String, dynamic> json) => _$TransactionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionDtoToJson(this);

  Transaction toEntity() => Transaction(
        id: id,
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
        amountPaid: amountPaid,
        createdAt: createdAt,
      );
}
