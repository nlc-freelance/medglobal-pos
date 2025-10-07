import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/register_payload.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/device_settings.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/repositories/settings/local_settings_repository.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/repositories/receipt_config/remote_receipt_config_repository.dart';

/// Device-level configuration
/// Activates/Assigns the register to this device thru UPDATE endpoint
/// Saves the register and branch (linked to register) locally
/// Fetches receipt config
/// Saves the receipt template locally

class BindDeviceUseCase {
  final RegisterRepository _registerRepository;
  final RemoteReceiptConfigRepository _remoteReceiptConfigRepository;
  final LocalSettingsRepository _localSettingsRepository;

  const BindDeviceUseCase({
    required RegisterRepository registerRepository,
    required RemoteReceiptConfigRepository remoteReceiptConfigRepository,
    required LocalSettingsRepository localSettingsRepository,
  })  : _registerRepository = registerRepository,
        _remoteReceiptConfigRepository = remoteReceiptConfigRepository,
        _localSettingsRepository = localSettingsRepository;

  Future<ApiResult<DeviceSettings>> call(Register register, String? printer) async {
    // Assign the register to this device via UPDATE endpoint
    final registerResult = await _registerRepository.updateRegister(
      register.id!,
      RegisterPayload.fromRegister(register),
    );

    return registerResult.when(
      success: (register) async {
        final branchId = register.assignedBranch!.id!;

        // Save register and branch details locally
        await _localSettingsRepository.saveRegister(register);

        // Get the receipt config for the current branch
        final receiptConfigResult = await _remoteReceiptConfigRepository.getReceiptConfigByBranch(branchId);

        return receiptConfigResult.when(
          success: (receiptConfig) async => _handleDeviceSettings(register, receiptConfig, printer),
          failure: (failure) => ApiResult.failure(failure),
        );
      },
      failure: (failure) => ApiResult.failure(failure),
    );
  }

  Future<ApiResult<DeviceSettings>> _handleDeviceSettings(
    Register register,
    ReceiptConfiguration receiptConfig,
    String? printer,
  ) async {
    try {
      // Save device settings (receipt and printer) to local DB
      await _localSettingsRepository.saveReceiptConfig(receiptConfig);
      await GetIt.I<AppDatabase>().syncMetadataDao.updateLastSyncedAt('receiptConfig');

      if (printer != null) await _localSettingsRepository.savePrinter(printer);
    } catch (e) {
      return ApiResult.failure(LocalDatabaseFailure('Local save failed.'));
    }

    /// Prepare data to return
    final assignedRegister = RegisterPartial(
      id: register.id!,
      name: register.name,
      serialNumber: register.serialNumber,
      assignedBranch: register.assignedBranch,
    );
    final branch = BranchPartial(id: register.assignedBranch!.id!, name: register.assignedBranch!.name);

    final defaultPrinter = await GetIt.I<AppDatabase>().settingsDao.getPrinter();

    final deviceSettings = DeviceSettings(
      register: assignedRegister,
      branch: branch,
      receiptConfig: receiptConfig,
      printer: defaultPrinter,
    );

    return ApiResult.success(deviceSettings);
  }

  // Future<ApiResult<DeviceSettings>> call(Register register, String? printer) async {
  //   ReceiptConfiguration? receiptConfig;
  //   // Assign the register to this device via UPDATE endpoint
  //   final registerResult = await _registerRepository.updateRegister(
  //     register.id!,
  //     RegisterPayload.fromRegister(register),
  //   );
  //
  //   // Get the receipt config for the current branch
  //   final failure = await registerResult.fold<Future<Failure?>>(
  //     (failure) async => failure,
  //     (register) async {
  //       // Save register and branch details locally
  //       // TODO: check if failure is being caught in bloc
  //       await _localSettingsRepository.saveRegister(register);
  //
  //       final branchId = register.assignedBranch!.id!;
  //
  //       // Get the receipt config for the current branch
  //       final receiptConfigResult = await _remoteReceiptConfigRepository.getReceiptConfigByBranch(branchId);
  //
  //       final receiptFailure = await receiptConfigResult.fold<Future<Failure?>>(
  //         // final receiptFailure = receiptConfigResult.fold<Future<Failure?>>(
  //         (failure) async => failure,
  //         (config) async {
  //           // Save receipt config to local DB
  //           // TODO: check if failure is being caught in bloc
  //           await _localSettingsRepository.saveReceiptConfig(config);
  //           await GetIt.I<AppDatabase>().syncMetadataDao.updateLastSyncedAt('receiptConfig');
  //
  //           receiptConfig = config;
  //           return null;
  //         },
  //       );
  //
  //       if (printer != null) await _localSettingsRepository.savePrinter(printer);
  //
  //       return receiptFailure;
  //     },
  //   );
  //
  //   if (failure != null) return Left(failure);
  //
  //   if (receiptConfig == null) {
  //     return Left(UnexpectedFailure('Unexpected error occurred. Failed to get receipt config.'));
  //   }
  //
  //   final assignedRegister = RegisterPartial(
  //     id: register.id!,
  //     name: register.name,
  //     serialNumber: register.serialNumber,
  //     assignedBranch: register.assignedBranch,
  //   );
  //   final branch = BranchPartial(id: register.assignedBranch!.id!, name: register.assignedBranch!.name);
  //
  //   final defaultPrinter = await GetIt.I<AppDatabase>().settingsDao.getPrinter();
  //
  //   final settings = DeviceSettings(
  //     register: assignedRegister,
  //     branch: branch,
  //     receiptConfig: receiptConfig!,
  //     printer: defaultPrinter,
  //   );
  //   return Right(settings);
  // }
}
