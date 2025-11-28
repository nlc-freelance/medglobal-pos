part of 'device_setup_bloc.dart';

@freezed
class DeviceSetupState with _$DeviceSetupState {
  const factory DeviceSetupState.initial() = _Initial;
  const factory DeviceSetupState.loading() = _DeviceSetupInProgress;
  const factory DeviceSetupState.unready() = _DeviceUnready;
  const factory DeviceSetupState.ready(DeviceSettings settings) = _DeviceReady;
  const factory DeviceSetupState.deactivated(DateTime now) = _DeviceDeactivated;
  const factory DeviceSetupState.failure(String message) = _DeviceSetupFailure;
}
