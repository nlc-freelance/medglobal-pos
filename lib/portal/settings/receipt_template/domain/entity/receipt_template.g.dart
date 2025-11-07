// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptTemplateImpl _$$ReceiptTemplateImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceiptTemplateImpl(
      id: json['id'] as int?,
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
    );

Map<String, dynamic> _$$ReceiptTemplateImplToJson(
        _$ReceiptTemplateImpl instance) =>
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
    };
