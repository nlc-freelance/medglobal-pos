// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_template_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiptTemplatePayload _$ReceiptTemplatePayloadFromJson(
        Map<String, dynamic> json) =>
    ReceiptTemplatePayload(
      name: json['name'] as String?,
      isDefault: json['isDefault'] as bool?,
      description: json['description'] as String?,
      showCompanyName: json['showCompanyName'] as bool?,
      showBranchName: json['showBranchName'] as bool?,
      showBranchAddress: json['showBranchAddress'] as bool?,
      showBranchContact: json['showBranchContact'] as bool?,
      showFooterMessage: json['showFooterMessage'] as bool?,
      footerTitle: json['footerTitle'] as String?,
      footerMessage: json['footerMessage'] as String?,
    );

Map<String, dynamic> _$ReceiptTemplatePayloadToJson(
        ReceiptTemplatePayload instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'isDefault': instance.isDefault,
      'showCompanyName': instance.showCompanyName,
      'showBranchName': instance.showBranchName,
      'showBranchAddress': instance.showBranchAddress,
      'showBranchContact': instance.showBranchContact,
      'showFooterMessage': instance.showFooterMessage,
      'footerTitle': instance.footerTitle,
      'footerMessage': instance.footerMessage,
    };
