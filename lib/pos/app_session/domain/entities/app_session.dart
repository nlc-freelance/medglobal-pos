import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/device_setup/domain/entities/receipt_configuration.dart';

part 'app_session.freezed.dart';

@freezed
class AppSession with _$AppSession {
  const factory AppSession({
    required int employeeId,
    required String employeeFirstName,
    required String employeeLastName,
    required int registerId,
    required String registerName,
    required String registerSerialNo,
    required int branchId,
    required String branchName,
    required ReceiptConfiguration receiptConfig,
    String? authToken,
    DateTime? loginTime,
  }) = _AppSession;
}
