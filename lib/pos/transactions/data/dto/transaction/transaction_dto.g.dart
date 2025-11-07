// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionDtoImpl _$$TransactionDtoImplFromJson(Map<String, dynamic> json) =>
    _$TransactionDtoImpl(
      id: json['id'] as int,
      transactionId: json['transactionId'] as String,
      saleTransactionId: json['saleTransactionId'] as int?,
      saleTransactionReceiptId: json['saleTransactionReceiptId'] as String?,
      type: json['type'] as String,
      status: json['status'] as String?,
      register:
          RegisterPartialDto.fromJson(json['register'] as Map<String, dynamic>),
      store: BranchPartialDto.fromJson(json['store'] as Map<String, dynamic>),
      user: EmployeePartialDto.fromJson(json['user'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => TransactionItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      subTotal: (json['subTotal'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      discountType: json['discountType'] as String?,
      discountInPeso: (json['discountInPeso'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      totalDiscountInPeso: (json['totalDiscountInPeso'] as num?)?.toDouble(),
      amountPaid: (json['amountPaid'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TransactionDtoImplToJson(
        _$TransactionDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionId': instance.transactionId,
      'saleTransactionId': instance.saleTransactionId,
      'saleTransactionReceiptId': instance.saleTransactionReceiptId,
      'type': instance.type,
      'status': instance.status,
      'register': instance.register,
      'store': instance.store,
      'user': instance.user,
      'items': instance.items,
      'subTotal': instance.subTotal,
      'discount': instance.discount,
      'discountType': instance.discountType,
      'discountInPeso': instance.discountInPeso,
      'tax': instance.tax,
      'total': instance.total,
      'totalDiscountInPeso': instance.totalDiscountInPeso,
      'amountPaid': instance.amountPaid,
      'notes': instance.notes,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };
