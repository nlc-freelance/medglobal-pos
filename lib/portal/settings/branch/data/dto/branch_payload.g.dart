// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchPayload _$BranchPayloadFromJson(Map<String, dynamic> json) =>
    BranchPayload(
      accountId: json['accountId'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      street1: json['street1'] as String?,
      street2: json['street2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      zipCode: json['zipCode'] as String?,
      country: json['country'] as String?,
      businessRegistrationNo: json['businessRegistrationNo'] as String?,
      vatIdNo: json['vatIdNo'] as String?,
      receiptTemplateId: json['receiptTemplateId'] as int?,
    );

Map<String, dynamic> _$BranchPayloadToJson(BranchPayload instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'street1': instance.street1,
      'street2': instance.street2,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'country': instance.country,
      'businessRegistrationNo': instance.businessRegistrationNo,
      'vatIdNo': instance.vatIdNo,
      'receiptTemplateId': instance.receiptTemplateId,
    };
