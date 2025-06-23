import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/access_control.dart';

part 'access_control_dto.freezed.dart';
part 'access_control_dto.g.dart';

@freezed
class AccessControlDto with _$AccessControlDto {
  const factory AccessControlDto({
    required String module,
    required List<FeatureDto> features,
  }) = _AccessControlDto;

  const AccessControlDto._();

  factory AccessControlDto.fromJson(Map<String, dynamic> json) => _$AccessControlDtoFromJson(json);

  AccessControl toDomain() => AccessControl(
        name: module,
        features: features.map((feature) => feature.toDomain()).toList(),
      );
}

@freezed
class FeatureDto with _$FeatureDto {
  const factory FeatureDto({
    required String name,
    required List<PermissionDto> operations,
  }) = _FeatureDto;

  const FeatureDto._();

  factory FeatureDto.fromJson(Map<String, dynamic> json) => _$FeatureDtoFromJson(json);

  Feature toDomain() => Feature(
        name: name,
        permissions: operations.map((permission) => permission.toDomain()).toList(),
      );
}

@freezed
class PermissionDto with _$PermissionDto {
  const factory PermissionDto({
    required String name,
    required bool value,
  }) = _PermissionDto;

  const PermissionDto._();

  factory PermissionDto.fromJson(Map<String, dynamic> json) => _$PermissionDtoFromJson(json);

  Permission toDomain() => Permission(
        type: name,
        isChecked: value,
      );
}
