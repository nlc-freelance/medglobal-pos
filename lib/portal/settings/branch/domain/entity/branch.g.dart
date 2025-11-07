// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BranchImpl _$$BranchImplFromJson(Map<String, dynamic> json) => _$BranchImpl(
      id: json['id'] as int?,
      name: json['name'] as String,
      accountId: json['accountId'] as int,
      code: json['code'] as String?,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      street1: json['street1'] as String,
      street2: json['street2'] as String?,
      city: json['city'] as String,
      state: json['state'] as String,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
      businessRegistrationNumber: json['businessRegistrationNumber'] as String,
      vatIdNumber: json['vatIdNumber'] as String?,
      receiptTemplate: ReceiptTemplate.fromJson(
          json['receiptTemplate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BranchImplToJson(_$BranchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'accountId': instance.accountId,
      'code': instance.code,
      'phone': instance.phone,
      'email': instance.email,
      'street1': instance.street1,
      'street2': instance.street2,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'country': instance.country,
      'businessRegistrationNumber': instance.businessRegistrationNumber,
      'vatIdNumber': instance.vatIdNumber,
      'receiptTemplate': instance.receiptTemplate,
    };

_$BranchPartialImpl _$$BranchPartialImplFromJson(Map<String, dynamic> json) =>
    _$BranchPartialImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$BranchPartialImplToJson(_$BranchPartialImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
    };
