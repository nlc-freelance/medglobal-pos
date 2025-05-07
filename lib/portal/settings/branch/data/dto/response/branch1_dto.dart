import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch1.dart';

part 'branch1_dto.freezed.dart';
part 'branch1_dto.g.dart';

@freezed
class Branch1Dto with _$Branch1Dto {
  const factory Branch1Dto({
    required int id,
    required String name,
    required String address,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _Branch1Dto;

  factory Branch1Dto.fromJson(Map<String, dynamic> json) => _$Branch1DtoFromJson(json);
}

extension Branch1DtoX on Branch1Dto {
  /// Mapping to domain entity
  Branch1 toDomain() => Branch1(
        id: id,
        name: name,
        street1: '',
        street2: '',
        city: '',
        state: '',
        postalCode: '',
        country: '',
        phone: '',
        email: '',
        businessRegistrationNumber: '',
        vatIdNumber: '',
      );
}
