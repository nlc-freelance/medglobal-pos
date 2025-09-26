import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/contexts/device_uuid.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/device_settings.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/repositories/local_settings_repository.dart';
import 'package:medglobal_admin_portal/pos/syncing/services/connectivity_service.dart';

class CheckDeviceSettingUseCase {
  final LocalSettingsRepository _localSettingsRepository;
  final RegisterRepository _registerRepository;

  const CheckDeviceSettingUseCase({
    required LocalSettingsRepository localSettingsRepository,
    required RegisterRepository registerRepository,
  })  : _localSettingsRepository = localSettingsRepository,
        _registerRepository = registerRepository;

  /// Check first if there is settings stored locally
  /// If there is, validate against remote data
  /// If there is none, return null
  Future<Either<Failure, DeviceSettings?>> call() async {
    final localBind = await _localSettingsRepository.getSettings();

    return localBind.fold(
      (failure) => Left(failure),
      (localSettings) async {
        if (localSettings == null) {
          return Right(localSettings);
        } else {
          // return GetIt.I<ConnectivityService>().isOnline.then((online) {
          //   if (online) {
          //     /// To check if the device is bound to a register, we get register by given device ID
          //     /// Returns the register if bounded, else 404 not found (Failure)
          //     return _registerRepository.getRegisterBySerialNo().then((result) {
          //       return result.fold(
          //         (failure) {
          //           return Left(failure);
          //         },
          //         (register) {
          //           if (register.id == localSettings.register.id) {
          //             return Right(localSettings);
          //           } else {
          //             return Left(UnexpectedFailure('not bound'));
          //           }
          //         },
          //       );
          //     });
          //   } else {
          return Right(localSettings);
          //   }
          // });
        }
      },
    );

    // final result = await _registerRepository.getRegisterBySerialNo();
    //
    // return result.fold(
    //   (failure) => Left(failure),
    //   (register) async {
    //     final localBind = await _localSettingsRepository.getSettings();
    //     return localBind.fold(
    //       (failure) => Left(failure),
    //       (local) {
    //         if (local?.register.id == register.id) {
    //           // still binded, valid
    //           return Right(local);
    //         } else {
    //           return const Right(null);
    //         }
    //       },
    //     );
    //   },
    // );

    return _localSettingsRepository.getSettings();
  }
}
