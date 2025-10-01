import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/contexts/device_uuid.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/device_settings.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/usecases/bind_device_usecase.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/usecases/check_device_setting_usecase.dart';
import 'package:medglobal_admin_portal/pos/syncing/services/connectivity_service.dart';
import 'package:medglobal_admin_portal/pos/syncing/sync_queue/sync_queue_repository.dart';

part 'device_setup_event.dart';
part 'device_setup_state.dart';
part 'device_setup_bloc.freezed.dart';

class DeviceSetupBloc extends Bloc<DeviceSetupEvent, DeviceSetupState> {
  final BindDeviceUseCase _bindDeviceUseCase;
  final CheckDeviceSettingUseCase _checkDeviceSettingUseCase;

  DeviceSetupBloc({
    required BindDeviceUseCase bindDeviceUseCase,
    required CheckDeviceSettingUseCase checkDeviceSettingUseCase,
  })  : _bindDeviceUseCase = bindDeviceUseCase,
        _checkDeviceSettingUseCase = checkDeviceSettingUseCase,
        super(const DeviceSetupState.initial()) {
    on<_CheckDeviceSetting>(_onCheckDeviceSetting);
    on<_ValidateDeviceBinding>(_onValidateDeviceBinding);
    on<_BindDevice>(_onBindDevice);
    on<_RebindDevice>(_onRebindDevice);
  }

  /// Checks on the current setup of the device
  /// Always run on app startup
  /// If no local binding stored -> block app until setup is complete
  /// If binding exists -> validate against BE
  Future<void> _onCheckDeviceSetting(_CheckDeviceSetting event, Emitter<DeviceSetupState> emit) async {
    emit(const DeviceSetupState.loading());

    try {
      final result = await _checkDeviceSettingUseCase.call();

      result.fold(
        (failure) => emit(DeviceSetupState.failure(failure.message)),
        (settings) {
          if (settings == null) {
            emit(const DeviceSetupState.unready());
          } else {
            // GetIt.I<AppSessionService>().setDeviceSettings(settings.register, settings.receiptConfig);
            // emit(DeviceSetupState.ready(settings.register, settings.branch));
            GetIt.I<AppSessionService>().setDeviceSettings(
              settings.register,
              settings.branch,
              settings.receiptConfig,
              settings.printer,
            );
            emit(DeviceSetupState.ready(settings));

            GetIt.I<ConnectivityService>().isOnline.then((online) {
              if (online) add(_ValidateDeviceBinding(settings));
            });
          }
        },
      );
    } catch (e) {
      emit(DeviceSetupState.failure(e.toString()));
    }
  }

  Future<void> _onValidateDeviceBinding(_ValidateDeviceBinding event, Emitter<DeviceSetupState> emit) async {
    try {
      final result = await GetIt.I<RegisterRepository>().getRegisterBySerialNo();

      await result.fold(
        (failure) async {
          if (failure.message.toLowerCase().contains('not found')) {
            emit(DeviceSetupState.deactivated(DateTime.now()));
          } else {
            emit(DeviceSetupState.failure(failure.message));
          }
        },
        (register) {
          final settings = event.settings;
          register.id == settings.register.id
              ? emit(DeviceSetupState.ready(settings))
              : emit(const DeviceSetupState.failure(
                  'There is a mismatch with the remote and local data of the register linked to this device.'));
        },
      );
    } catch (e) {
      emit(DeviceSetupState.failure(e.toString()));
    }
  }

  /// Sets the device-level binding
  /// Register, branch and receipt config, printer
  Future<void> _onBindDevice(_BindDevice event, Emitter<DeviceSetupState> emit) async {
    emit(const DeviceSetupState.loading());

    try {
      final biosID = await getDeviceUUID();
      final register = event.register.copyWith(serialNumber: biosID);

      final result = await _bindDeviceUseCase.call(register, event.printer);

      result.fold(
        (failure) => emit(DeviceSetupState.failure(failure.message)),
        (settings) {
          GetIt.I<AppSessionService>().setDeviceSettings(
            settings.register,
            settings.branch,
            settings.receiptConfig,
            settings.printer,
          );

          emit(DeviceSetupState.ready(settings));
        },
      );
    } catch (e) {
      emit(DeviceSetupState.failure(e.toString()));
    }
  }

  Future<void> _onRebindDevice(_RebindDevice event, Emitter<DeviceSetupState> emit) async {
    if (event.reset) {
      /// Clear local db
      await GetIt.I<AppDatabase>().settingsDao.clearAll();
      await GetIt.I<AppDatabase>().productCatalogDao.clearAll();
      await GetIt.I<AppDatabase>().syncMetadataDao.clearAll();
    }

    emit(const DeviceSetupState.unready());
  }
}
