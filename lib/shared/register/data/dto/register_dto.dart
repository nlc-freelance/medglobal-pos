// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:medglobal_admin_portal/shared/transactions/domain/entities/register.dart';
//
// part 'register_dto.g.dart';
//
// @JsonSerializable()
// class RegisterDto extends Equatable {
//   final int? id;
//   final String? name;
//   final String? serialNumber;
//
//   const RegisterDto({
//     this.id,
//     this.name,
//     this.serialNumber,
//   });
//
//   @override
//   List<Object?> get props => [id, name, serialNumber];
//
//   factory RegisterDto.fromJson(Map<String, dynamic> json) => _$RegisterDtoFromJson(json);
//
//   Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);
//
//   Register toEntity() => Register(
//         id: id,
//         name: name,
//         serialNumber: serialNumber,
//       );
// }

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';
import 'package:medglobal_admin_portal/shared/register/data/dto/register_shift_dto.dart';
import 'package:medglobal_admin_portal/shared/register/domain/entities/register.dart';

part 'register_dto.g.dart';

@JsonSerializable()
class RegisterDto extends Equatable {
  final int? id;
  final String? name;
  @JsonKey(name: 'store')
  final Branch? branch;
  final RegisterShiftDto? shiftDetail;
  final String? serialNumber;

  const RegisterDto({
    this.id,
    this.name,
    this.branch,
    this.shiftDetail,
    this.serialNumber,
  });

  @override
  List<Object?> get props => [id, name, branch, shiftDetail, serialNumber];

  factory RegisterDto.fromJson(Map<String, dynamic> json) => _$RegisterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);

  Register toEntity() => Register(
        id: id,
        name: name,
        branch: branch,
        shiftDetail: shiftDetail?.toEntity(),
        serialNumber: serialNumber,
      );
}
