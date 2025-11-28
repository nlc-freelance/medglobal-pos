import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/response/employee_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_item_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

part 'transaction_dto.freezed.dart';
part 'transaction_dto.g.dart';

@freezed
class TransactionDto with _$TransactionDto {
  const factory TransactionDto({
    required int id,
    required String transactionId,
    int? saleTransactionId,
    String? saleTransactionReceiptId,
    required String type,
    String? status,
    required RegisterPartialDto register,
    required BranchPartialDto store,
    required EmployeePartialDto user,
    List<TransactionItemDto>? items,
    double? subTotal,
    double? discount,
    String? discountType,
    double? discountInPeso,
    double? tax,
    double? total,
    double? totalDiscountInPeso,
    double? amountPaid,
    String? notes,
    @DateTimeConverter() required DateTime createdAt,
  }) = _TransactionDto;

  factory TransactionDto.fromJson(Map<String, dynamic> json) => _$TransactionDtoFromJson(json);

  factory TransactionDto.fromDomain(Transaction transaction) => TransactionDto(
        id: transaction.id,
        transactionId: transaction.receiptId,
        saleTransactionId: transaction.saleTransactionId,
        saleTransactionReceiptId: transaction.saleTransactionReceiptId,
        status:
            (transaction.status == ReturnStatus.completed ? ReturnStatus.completed : ReturnStatus.awaitingAction).label,
        type: (transaction.type == TransactionType.sale ? TransactionType.sale : TransactionType.refund).name,
        register: RegisterPartialDto(
          id: transaction.register.id,
          name: transaction.register.name,
        ),
        store: BranchPartialDto(
          id: transaction.branch.id,
          name: transaction.branch.name,
        ),
        user: EmployeePartialDto(
          id: transaction.employee.id,
          firstName: transaction.employee.firstName,
          lastName: transaction.employee.lastName,
        ),

        items: (transaction.items ?? []).map((item) => TransactionItemDto.fromDomain(item)).toList(),
        subTotal: transaction.subtotal,
        // discount: transaction.discount,
        // discountType:
        //     (transaction.discountType == DiscountType.fixed ? DiscountType.fixed : DiscountType.percentage).name,
        // discountInPeso: transaction.discountInPeso,
        tax: transaction.tax,
        total: transaction.total,
        totalDiscountInPeso: transaction.totalDiscountAmount,
        notes: transaction.reasonForRefund,
        amountPaid: transaction.amountPaid,
        createdAt: transaction.createdAt,
      );
}

extension TransactionDtoExt on TransactionDto {
  Transaction toDomain() => Transaction(
        id: id,
        receiptId: transactionId,
        saleTransactionId: saleTransactionId,
        saleTransactionReceiptId: saleTransactionReceiptId,
        status: status == 'completed' ? ReturnStatus.completed : ReturnStatus.awaitingAction,
        type: type == 'sale' ? TransactionType.sale : TransactionType.refund,
        register: RegisterPartial(id: register.id, name: register.name),
        branch: BranchPartial(
          id: store.id,
          name: store.name,
        ),
        employee: EmployeePartial(
          id: user.id,
          firstName: user.firstName,
          lastName: user.lastName,
        ),
        // register: RegisterMapper.fromDto(register),
        // branch: BranchMapper.fromDto(store),
        // employee: user.toDomain(),
        items: (items ?? []).map((item) => item.toDomain()).toList(),
        subtotal: subTotal,
        // discount: discount,
        // discountType: discountType == 'fixed' ? DiscountType.fixed : DiscountType.percentage,
        // discountInPeso: discountInPeso,
        tax: tax,
        total: total,
        totalDiscountAmount: totalDiscountInPeso,
        reasonForRefund: notes,
        amountPaid: amountPaid,
        createdAt: createdAt,
      );
}
