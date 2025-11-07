// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierPayload _$SupplierPayloadFromJson(Map<String, dynamic> json) =>
    SupplierPayload(
      name: json['name'] as String,
      mainContactName: json['mainContactName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fax: json['fax'] as String?,
      website: json['website'] as String?,
      street1: json['street1'] as String?,
      street2: json['street2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      zipCode: json['zipCode'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$SupplierPayloadToJson(SupplierPayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'mainContactName': instance.mainContactName,
      'email': instance.email,
      'phone': instance.phone,
      'fax': instance.fax,
      'website': instance.website,
      'street1': instance.street1,
      'street2': instance.street2,
      'city': instance.city,
      'state': instance.state,
      'zipCode': instance.zipCode,
      'country': instance.country,
    };
