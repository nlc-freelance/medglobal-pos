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

// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
// import 'package:medglobal_admin_portal/shared/register/data/dto/register_shift_dto.dart';
// import 'package:medglobal_admin_portal/shared/register/domain/entities/register.dart';

// part 'register_dto.g.dart';

// @JsonSerializable()
// class RegisterDto extends Equatable {
//   final int? id;
//   final String? name;
//   @JsonKey(name: 'store')
//   final Branch? branch;
//   final RegisterShiftDto? shiftDetail;
//   final String? serialNumber;

//   const RegisterDto({
//     this.id,
//     this.name,
//     this.branch,
//     this.shiftDetail,
//     this.serialNumber,
//   });

//   @override
//   List<Object?> get props => [id, name, branch, shiftDetail, serialNumber];

//   factory RegisterDto.fromJson(Map<String, dynamic> json) => _$RegisterDtoFromJson(json);

//   Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);

//   Register toEntity() => Register(
//         id: id,
//         name: name,
//         branch: branch,
//         shiftDetail: shiftDetail?.toEntity(),
//         serialNumber: serialNumber,
//       );
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/data/dto/response/branch_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/data/dto/response/register_shift_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';

part 'register_dto.freezed.dart';
part 'register_dto.g.dart';

@freezed
class RegisterDto with _$RegisterDto {
  const factory RegisterDto({
    required int id,
    required String name,
    required BranchDto store,
    RegisterShiftDto? shiftDetail,
    String? serialNumber,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _RegisterDto;

  factory RegisterDto.fromJson(Map<String, dynamic> json) => _$RegisterDtoFromJson(json);
}

extension RegisterDtoExt on RegisterDto {
  /// Mapping to domain entity
  Register toDomain() => Register(
        id: id,
        name: name,
        assignedBranch: store.toDomain(),
        shiftDetail: shiftDetail?.toEntity(),
      );
}
