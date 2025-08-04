import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_session.freezed.dart';

@freezed
class PosSession with _$PosSession {
  const factory PosSession({
    required int employeeId,
    required String employeeFirstName,
    required String employeeLastName,
    required int registerId,
    required String registerName,
    required String registerSerialNo,
    required int branchId,
    required String branchName,
    String? authToken,
    DateTime? loginTime,
  }) = _PosSession;
}
