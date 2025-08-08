import 'package:dartz/dartz.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/authentication/domain/entities/user.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/entities/app_session.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/repository/app_session_repository.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/repositories/local_receipt_config_repository.dart';
import 'package:medglobal_admin_portal/pos/receipt_config/domain/repositories/remote_receipt_config_repository.dart';

class InitializeAppSessionUseCase {
  final RegisterRepository _registerRepository;
  final RemoteReceiptConfigRepository _remoteReceiptConfigRepository;
  final LocalReceiptConfigRepository _localReceiptConfigRepository;
  final AppSessionRepository _appSessionRepository;
  final AppSessionService _appSessionService;

  const InitializeAppSessionUseCase({
    required RegisterRepository registerRepository,
    required RemoteReceiptConfigRepository remoteReceiptConfigRepository,
    required LocalReceiptConfigRepository localReceiptConfigRepository,
    required AppSessionRepository appSessionRepository,
    required AppSessionService appSessionService,
  })  : _registerRepository = registerRepository,
        _remoteReceiptConfigRepository = remoteReceiptConfigRepository,
        _localReceiptConfigRepository = localReceiptConfigRepository,
        _appSessionRepository = appSessionRepository,
        _appSessionService = appSessionService;

  Future<Either<Failure, AppSession>> call(User user) async {
    AppSession? newSession;

    // Get the assigned register for the current device identified by its serial number
    final registerResult = await _registerRepository.getRegisterBySerialNo();

    final failure = await registerResult.fold<Future<Failure?>>(
      (failure) async => failure,
      (register) async {
        final branchId = register.assignedBranch!.id!;

        // Get the receipt config for the current branch (from the register, a register is assigned to a branch)
        final receiptConfigResult = await _remoteReceiptConfigRepository.getReceiptConfigByBranch(branchId);

        final receiptFailure = receiptConfigResult.fold<Future<Failure?>>(
          (failure) async => failure,
          (receiptConfig) async {
            // Save receipt config to local DB
            await _localReceiptConfigRepository.upsertReceiptConfig(receiptConfig);

            // Prepare the session
            final session = AppSession(
              employeeId: user.id!,
              employeeFirstName: user.firstName!,
              employeeLastName: user.lastName!,
              registerId: register.id!,
              registerName: register.name,
              registerSerialNo: register.serialNumber!,
              branchId: branchId,
              branchName: register.assignedBranch!.name,
              receiptConfig: receiptConfig,
            );

            // Save session to local DB
            await _appSessionRepository.saveSession(session);

            // Align user, register, and receipt config details in AppSessionService
            _appSessionService.setAppSession(user, register, receiptConfig);

            newSession = session;

            return null;
          },
        );

        return receiptFailure;
      },
    );

    // If a failure occurred during any session dependency fetch, return early with the failure.
    if (failure != null) return Left(failure);

    return Right(newSession!);
  }
}
