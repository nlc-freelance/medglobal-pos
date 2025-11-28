import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';

part 'supplier_dto.freezed.dart';
part 'supplier_dto.g.dart';

@freezed
class SupplierDto with _$SupplierDto {
  const factory SupplierDto({
    required int id,
    required String name,
    String? mainContactName,
    String? email,
    String? phone,
    String? fax,
    String? website,
    String? street1,
    String? street2,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    String? createdAt,
    String? updatedAt,
  }) = _SupplierDto;

  const SupplierDto._();

  factory SupplierDto.fromJson(Map<String, dynamic> json) => _$SupplierDtoFromJson(json);

  Supplier toDomain() => Supplier(
        id: id,
        name: name,
        mainContactName: mainContactName,
        email: email,
        phone: phone,
        fax: fax,
        website: website,
        street1: street1,
        street2: street2,
        city: city,
        state: state,
        zipCode: zipCode,
        country: country,
      );
}

// @JsonSerializable()
// class SupplierDto {
//   final int? id;
//   final String? name;
//   final String? mainContactName;
//   final String? email;
//   final String? phone;
//   final String? fax;
//   final String? website;
//   final String? street1;
//   final String? street2;
//   final String? city;
//   final String? state;
//   final String? zipCode;
//   final String? country;
//   final String? createdAt;
//   final String? updatedAt;

//   const SupplierDto({
//     this.id,
//     this.name,
//     this.mainContactName,
//     this.email,
//     this.phone,
//     this.fax,
//     this.website,
//     this.street1,
//     this.street2,
//     this.city,
//     this.state,
//     this.zipCode,
//     this.country,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory SupplierDto.fromJson(Map<String, dynamic> json) => _$SupplierDtoFromJson(json);

//   Map<String, dynamic> toJson() => _$SupplierDtoToJson(this);

//   Supplier toDomain() => Supplier(
//         id: id,
//         name: name ?? Strings.empty,
//         mainContactName: mainContactName ?? Strings.empty,
//         email: email ?? Strings.empty,
//         phone: phone ?? Strings.empty,
//         fax: fax ?? Strings.empty,
//         website: website ?? Strings.empty,
//         street1: street1 ?? Strings.empty,
//         street2: street2 ?? Strings.empty,
//         city: city ?? Strings.empty,
//         state: state ?? Strings.empty,
//         zipCode: zipCode ?? Strings.empty,
//         country: country ?? Strings.empty,
//       );
// }
