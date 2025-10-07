import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/device_settings.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/repositories/settings/local_settings_repository.dart';

class CheckDeviceSettingUseCase {
  final LocalSettingsRepository _localSettingsRepository;

  const CheckDeviceSettingUseCase({
    required LocalSettingsRepository localSettingsRepository,
  }) : _localSettingsRepository = localSettingsRepository;

  Future<ApiResult<DeviceSettings?>> call() async {
    /// Check if there is settings stored locally
    final localBind = await _localSettingsRepository.getSettings();

    return localBind.when(
      success: (localSettings) => ApiResult.success(localSettings),
      failure: (failure) => ApiResult.failure(failure),
    );
  }
}
