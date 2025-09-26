import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

part 'device_settings.freezed.dart';

@freezed
class DeviceSettings with _$DeviceSettings {
  const factory DeviceSettings({
    required RegisterPartial register,
    required BranchPartial branch,
    required ReceiptConfiguration receiptConfig,
    String? printer,
  }) = _DeviceSettings;
}
