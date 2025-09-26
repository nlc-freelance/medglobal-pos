part of 'device_setup_bloc.dart';

@freezed
class DeviceSetupEvent with _$DeviceSetupEvent {
  const factory DeviceSetupEvent.checkup() = _CheckDeviceSetting;
  const factory DeviceSetupEvent.validate(DeviceSettings settings) = _ValidateDeviceBinding;
  const factory DeviceSetupEvent.bind(Register register, {String? printer}) = _BindDevice;
  const factory DeviceSetupEvent.rebind() = _RebindDevice;
}
