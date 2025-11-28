import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';

part 'supplier_payload.g.dart';

@JsonSerializable()
class SupplierPayload {
  final String name;
  final String? mainContactName;
  final String? email;
  final String? phone;
  final String? fax;
  final String? website;
  final String? street1;
  final String? street2;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? country;

  SupplierPayload({
    required this.name,
    this.mainContactName,
    this.email,
    this.phone,
    this.fax,
    this.website,
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.zipCode,
    this.country,
  });

  Map<String, dynamic> toJson() => _$SupplierPayloadToJson(this);

  factory SupplierPayload.fromSupplier(Supplier supplier) => SupplierPayload(
        name: supplier.name,
        mainContactName: supplier.mainContactName,
        email: supplier.email,
        phone: supplier.phone,
        fax: supplier.fax,
        website: supplier.website,
        street1: supplier.street1,
        street2: supplier.street2,
        city: supplier.city,
        state: supplier.state,
        zipCode: supplier.zipCode,
        country: supplier.country,
      );
}
