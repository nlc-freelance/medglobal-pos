import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';

part 'register_payload.g.dart';

@JsonSerializable()
class RegisterPayload {
  final String? name;
  final int? storeId;
  final String? serialNumber;

  RegisterPayload({
    this.name,
    this.storeId,
    this.serialNumber,
  });

  Map<String, dynamic> toJson() => _$RegisterPayloadToJson(this);

  factory RegisterPayload.fromRegister(Register register) => RegisterPayload(
        name: register.name,
        serialNumber: register.serialNumber,
        storeId: register.assignedBranch?.id,
      );
}
