import 'package:json_annotation/json_annotation.dart';

part 'create_register_shift_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class CreateRegisterShiftDto {
  final int register;
  final String status;
  final double? openingAmount;
  final double? closingAmount;

  const CreateRegisterShiftDto({
    required this.register,
    required this.status,
    this.openingAmount,
    this.closingAmount,
  });

  Map<String, dynamic> toJson() => _$CreateRegisterShiftDtoToJson(this);
}
