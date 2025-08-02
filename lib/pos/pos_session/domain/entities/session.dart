import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

@freezed
class Session with _$Session {
  const factory Session({
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
  }) = _Session;
}
