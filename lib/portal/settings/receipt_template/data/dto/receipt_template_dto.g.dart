// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptTemplateDtoImpl _$$ReceiptTemplateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceiptTemplateDtoImpl(
      id: json['id'] as int,
      accountId: json['accountId'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      isSystemDefault: json['isSystemDefault'] as bool? ?? false,
      isDefault: json['isDefault'] as bool? ?? false,
      showCompanyName: json['showCompanyName'] as bool? ?? false,
      showBranchName: json['showBranchName'] as bool? ?? false,
      showBranchAddress: json['showBranchAddress'] as bool? ?? false,
      showBranchContact: json['showBranchContact'] as bool? ?? false,
      showFooterMessage: json['showFooterMessage'] as bool? ?? false,
      footerTitle: json['footerTitle'] as String?,
      footerMessage: json['footerMessage'] as String?,
      createdAt: _$JsonConverterFromJson<String, DateTime>(
          json['createdAt'], const DateTimeConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<String, DateTime>(
          json['updatedAt'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$ReceiptTemplateDtoImplToJson(
        _$ReceiptTemplateDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'name': instance.name,
      'description': instance.description,
      'isSystemDefault': instance.isSystemDefault,
      'isDefault': instance.isDefault,
      'showCompanyName': instance.showCompanyName,
      'showBranchName': instance.showBranchName,
      'showBranchAddress': instance.showBranchAddress,
      'showBranchContact': instance.showBranchContact,
      'showFooterMessage': instance.showFooterMessage,
      'footerTitle': instance.footerTitle,
      'footerMessage': instance.footerMessage,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
          instance.createdAt, const DateTimeConverter().toJson),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
          instance.updatedAt, const DateTimeConverter().toJson),
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
