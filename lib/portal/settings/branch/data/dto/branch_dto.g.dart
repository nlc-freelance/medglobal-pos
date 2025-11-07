// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchDtoImpl _$$BranchDtoImplFromJson(Map<String, dynamic> json) =>
    _$BranchDtoImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      accountId: json['accountId'] as int,
      code: json['code'] as String?,
      street1: json['street1'] as String,
      street2: json['street2'] as String?,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zipCode'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      vatIdNo: json['vatIdNo'] as String?,
      businessRegistrationNo: json['businessRegistrationNo'] as String,
      receiptTemplate: ReceiptTemplateDto.fromJson(
          json['receiptTemplate'] as Map<String, dynamic>),
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const DateTimeConverter().fromJson),
      deletedAt: _$JsonConverterFromJson<String, DateTime>(
          json['deletedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$BranchDtoImplToJson(_$BranchDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'accountId': instance.accountId,
      'code': instance.code,
      'street1': instance.street1,
      'street2': instance.street2,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'country': instance.country,
      'phone': instance.phone,
      'email': instance.email,
      'vatIdNo': instance.vatIdNo,
      'businessRegistrationNo': instance.businessRegistrationNo,
      'receiptTemplate': instance.receiptTemplate,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeConverter().toJson),
      'deletedAt': _$JsonConverterToJson<String, DateTime>(
          instance.deletedAt, const DateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$BranchPartialDtoImpl _$$BranchPartialDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BranchPartialDtoImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$BranchPartialDtoImplToJson(
        _$BranchPartialDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeConverter().toJson),
    };
