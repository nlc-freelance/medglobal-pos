import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/response/employee_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/employee_management/data/dto/employee_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/branch_mapper.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/data/dto/receipt_template_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register/register_mapper.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register/register_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_item_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

// part 'transaction_dto.g.dart';

// @JsonSerializable()
// class TransactionDto extends Equatable {
//   final int? id;
//   @JsonKey(name: 'transactionId')
//   final String? receiptId;
//   final int? saleTransactionId;
//   final String? saleTransactionReceiptId;
//   final String? type;
//   final String? status;
//   final RegisterDto? register;
//   @JsonKey(name: 'store')
//   final BranchDto? branch;
//   @JsonKey(name: 'user')
//   final EmployeeDto? employee;
//   final List<TransactionItemDto>? items;
//   @JsonKey(name: 'subTotal')
//   final double? subtotal;
//   final double? discount;
//   final String? discountType;
//   final double? discountInPeso;
//   final double? tax;
//   final double? total;
//   final double? totalDiscountInPeso;
//   final double? amountPaid;
//   @JsonKey(name: 'notes')
//   final String? reasonForReturn;
//   @DateTimeConverter()
//   final DateTime? createdAt;

//   const TransactionDto({
//     this.id,
//     this.receiptId,
//     this.saleTransactionId,
//     this.saleTransactionReceiptId,
//     this.status,
//     this.type,
//     this.register,
//     this.branch,
//     this.employee,
//     this.items,
//     this.subtotal,
//     this.discount,
//     this.discountType,
//     this.discountInPeso,
//     this.tax,
//     this.total,
//     this.totalDiscountInPeso,
//     this.reasonForReturn,
//     this.amountPaid,
//     this.createdAt,
//   });

//   @override
//   List<Object?> get props => [
//         id,
//         receiptId,
//         saleTransactionId,
//         saleTransactionReceiptId,
//         status,
//         type,
//         register,
//         branch,
//         employee,
//         items,
//         subtotal,
//         discount,
//         discountType,
//         discountInPeso,
//         tax,
//         total,
//         totalDiscountInPeso,
//         amountPaid,
//         reasonForReturn,
//         createdAt
//       ];

//   factory TransactionDto.fromJson(Map<String, dynamic> json) => _$TransactionDtoFromJson(json);

//   Map<String, dynamic> toJson() => _$TransactionDtoToJson(this);

//   Transaction toEntity() => Transaction(
//         id: id,
//         receiptId: receiptId,
//         saleTransactionId: saleTransactionId,
//         saleTransactionReceiptId: saleTransactionReceiptId,
//         status: status == 'completed' ? ReturnStatus.COMPLETED : ReturnStatus.AWAITING_ACTION,
//         type: type == 'sale' ? TransactionType.SALE : TransactionType.REFUND,
//         register: register?.toDomain(),
//         branch: branch?.toEntity(),
//         employee: employee?.toEntity(),
//         items: items?.map((item) => item.toEntity()).toList() ?? [],
//         subtotal: subtotal,
//         discount: discount,
//         discountType: discountType == 'fixed' ? DiscountType.PESO : DiscountType.PERCENT,
//         discountInPeso: discountInPeso,
//         tax: tax,
//         total: total,
//         totalDiscountInPeso: totalDiscountInPeso,
//         reasonForReturn: reasonForReturn,
//         amountPaid: amountPaid,
//         createdAt: createdAt,
//       );
// }

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
    required RegisterDto register,
    required BranchDto store,
    required EmployeeDto user,
    required List<TransactionItemDto> items,
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
        register: RegisterDto(id: 1, name: ''),
        store: BranchDto(
            id: 1,
            name: '',
            accountId: 1,
            street1: '',
            city: 'city',
            state: 'state',
            phone: 'phone',
            businessRegistrationNo: 'businessRegistrationNo',
            receiptTemplate: ReceiptTemplateDto(id: 1, accountId: 1, name: '')),
        user: EmployeeDto(
            id: 1,
            firstName: '',
            lastName: 'lastName',
            email: 'email',
            phone: 'phone',
            assignedStores: [],
            role: 'role',
            systemAccess: [],
            accessControls: []),
        // register: RegisterDto.fromDomain(transaction.register),
        // store: BranchDto.fromDomain(transaction.branch),
        // user: EmployeeDto.fromDomain(transaction.employee),
        items: transaction.items.map((item) => TransactionItemDto.fromDomain(item)).toList(),
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
        items: items.map((item) => item.toDomain()).toList(),
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
