import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'supplier.g.dart';

@JsonSerializable()
class Supplier extends Equatable {
  final int? id;
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

  const Supplier({
    this.id,
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

  @override
  List<Object?> get props =>
      [id, name, mainContactName, email, phone, fax, website, street1, street2, city, state, zipCode, country];

  factory Supplier.fromJson(Map<String, dynamic> json) => _$SupplierFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierToJson(this);

  Supplier copyWith({
    int? id,
    String? name,
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
  }) =>
      Supplier(
        id: id ?? this.id,
        name: name ?? this.name,
        mainContactName: mainContactName ?? this.mainContactName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        fax: fax ?? this.fax,
        website: website ?? this.website,
        street1: street1 ?? this.street1,
        street2: street2 ?? this.street2,
        city: city ?? this.city,
        state: state ?? this.state,
        zipCode: zipCode ?? this.zipCode,
        country: country ?? this.country,
      );

  dynamic get(String prop) => prop;
}
