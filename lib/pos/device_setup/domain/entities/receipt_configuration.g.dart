// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptConfigurationImpl _$$ReceiptConfigurationImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceiptConfigurationImpl(
      id: json['id'] as int,
      accountId: json['accountId'] as int,
      name: json['name'] as String,
      showBranchName: json['showBranchName'] as bool? ?? false,
      showBranchContact: json['showBranchContact'] as bool? ?? false,
      showFooterMessage: json['showFooterMessage'] as bool? ?? false,
      footerTitle: json['footerTitle'] as String?,
      footerMessage: json['footerMessage'] as String?,
      companyName: json['companyName'] as String?,
      branchName: json['branchName'] as String?,
      branchAddress: json['branchAddress'] as String?,
      branchPhone: json['branchPhone'] as String?,
      branchEmail: json['branchEmail'] as String?,
    );

Map<String, dynamic> _$$ReceiptConfigurationImplToJson(
        _$ReceiptConfigurationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'name': instance.name,
      'showBranchName': instance.showBranchName,
      'showBranchContact': instance.showBranchContact,
      'showFooterMessage': instance.showFooterMessage,
      'footerTitle': instance.footerTitle,
      'footerMessage': instance.footerMessage,
      'companyName': instance.companyName,
      'branchName': instance.branchName,
      'branchAddress': instance.branchAddress,
      'branchPhone': instance.branchPhone,
      'branchEmail': instance.branchEmail,
    };
