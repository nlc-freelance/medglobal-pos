// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BranchDto _$BranchDtoFromJson(Map<String, dynamic> json) {
  return _BranchDto.fromJson(json);
}

/// @nodoc
mixin _$BranchDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int? get accountId => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get street1 => throw _privateConstructorUsedError;
  String? get street2 => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get zipCode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get vatIdNo => throw _privateConstructorUsedError;
  String? get businessRegistrationNo => throw _privateConstructorUsedError;
  ReceiptTemplateDto? get receiptTemplate => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchDtoCopyWith<BranchDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchDtoCopyWith<$Res> {
  factory $BranchDtoCopyWith(BranchDto value, $Res Function(BranchDto) then) =
      _$BranchDtoCopyWithImpl<$Res, BranchDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      int? accountId,
      String? code,
      String? street1,
      String? street2,
      String? city,
      String? state,
      String? zipCode,
      String? country,
      String? phone,
      String? email,
      String? vatIdNo,
      String? businessRegistrationNo,
      ReceiptTemplateDto? receiptTemplate,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt,
      @DateTimeConverter() DateTime? deletedAt});

  $ReceiptTemplateDtoCopyWith<$Res>? get receiptTemplate;
}

/// @nodoc
class _$BranchDtoCopyWithImpl<$Res, $Val extends BranchDto>
    implements $BranchDtoCopyWith<$Res> {
  _$BranchDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? accountId = freezed,
    Object? code = freezed,
    Object? street1 = freezed,
    Object? street2 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? zipCode = freezed,
    Object? country = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? vatIdNo = freezed,
    Object? businessRegistrationNo = freezed,
    Object? receiptTemplate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      street1: freezed == street1
          ? _value.street1
          : street1 // ignore: cast_nullable_to_non_nullable
              as String?,
      street2: freezed == street2
          ? _value.street2
          : street2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      vatIdNo: freezed == vatIdNo
          ? _value.vatIdNo
          : vatIdNo // ignore: cast_nullable_to_non_nullable
              as String?,
      businessRegistrationNo: freezed == businessRegistrationNo
          ? _value.businessRegistrationNo
          : businessRegistrationNo // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptTemplate: freezed == receiptTemplate
          ? _value.receiptTemplate
          : receiptTemplate // ignore: cast_nullable_to_non_nullable
              as ReceiptTemplateDto?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceiptTemplateDtoCopyWith<$Res>? get receiptTemplate {
    if (_value.receiptTemplate == null) {
      return null;
    }

    return $ReceiptTemplateDtoCopyWith<$Res>(_value.receiptTemplate!, (value) {
      return _then(_value.copyWith(receiptTemplate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BranchDtoImplCopyWith<$Res>
    implements $BranchDtoCopyWith<$Res> {
  factory _$$BranchDtoImplCopyWith(
          _$BranchDtoImpl value, $Res Function(_$BranchDtoImpl) then) =
      __$$BranchDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int? accountId,
      String? code,
      String? street1,
      String? street2,
      String? city,
      String? state,
      String? zipCode,
      String? country,
      String? phone,
      String? email,
      String? vatIdNo,
      String? businessRegistrationNo,
      ReceiptTemplateDto? receiptTemplate,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt,
      @DateTimeConverter() DateTime? deletedAt});

  @override
  $ReceiptTemplateDtoCopyWith<$Res>? get receiptTemplate;
}

/// @nodoc
class __$$BranchDtoImplCopyWithImpl<$Res>
    extends _$BranchDtoCopyWithImpl<$Res, _$BranchDtoImpl>
    implements _$$BranchDtoImplCopyWith<$Res> {
  __$$BranchDtoImplCopyWithImpl(
      _$BranchDtoImpl _value, $Res Function(_$BranchDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? accountId = freezed,
    Object? code = freezed,
    Object? street1 = freezed,
    Object? street2 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? zipCode = freezed,
    Object? country = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? vatIdNo = freezed,
    Object? businessRegistrationNo = freezed,
    Object? receiptTemplate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_$BranchDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      street1: freezed == street1
          ? _value.street1
          : street1 // ignore: cast_nullable_to_non_nullable
              as String?,
      street2: freezed == street2
          ? _value.street2
          : street2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      vatIdNo: freezed == vatIdNo
          ? _value.vatIdNo
          : vatIdNo // ignore: cast_nullable_to_non_nullable
              as String?,
      businessRegistrationNo: freezed == businessRegistrationNo
          ? _value.businessRegistrationNo
          : businessRegistrationNo // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptTemplate: freezed == receiptTemplate
          ? _value.receiptTemplate
          : receiptTemplate // ignore: cast_nullable_to_non_nullable
              as ReceiptTemplateDto?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BranchDtoImpl implements _BranchDto {
  const _$BranchDtoImpl(
      {required this.id,
      required this.name,
      this.accountId,
      this.code,
      this.street1,
      this.street2,
      this.city,
      this.state,
      this.zipCode,
      this.country,
      this.phone,
      this.email,
      this.vatIdNo,
      this.businessRegistrationNo,
      this.receiptTemplate,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt,
      @DateTimeConverter() this.deletedAt});

  factory _$BranchDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int? accountId;
  @override
  final String? code;
  @override
  final String? street1;
  @override
  final String? street2;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? zipCode;
  @override
  final String? country;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? vatIdNo;
  @override
  final String? businessRegistrationNo;
  @override
  final ReceiptTemplateDto? receiptTemplate;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  @DateTimeConverter()
  final DateTime? updatedAt;
  @override
  @DateTimeConverter()
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'BranchDto(id: $id, name: $name, accountId: $accountId, code: $code, street1: $street1, street2: $street2, city: $city, state: $state, zipCode: $zipCode, country: $country, phone: $phone, email: $email, vatIdNo: $vatIdNo, businessRegistrationNo: $businessRegistrationNo, receiptTemplate: $receiptTemplate, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.street1, street1) || other.street1 == street1) &&
            (identical(other.street2, street2) || other.street2 == street2) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.vatIdNo, vatIdNo) || other.vatIdNo == vatIdNo) &&
            (identical(other.businessRegistrationNo, businessRegistrationNo) ||
                other.businessRegistrationNo == businessRegistrationNo) &&
            (identical(other.receiptTemplate, receiptTemplate) ||
                other.receiptTemplate == receiptTemplate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      accountId,
      code,
      street1,
      street2,
      city,
      state,
      zipCode,
      country,
      phone,
      email,
      vatIdNo,
      businessRegistrationNo,
      receiptTemplate,
      createdAt,
      updatedAt,
      deletedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchDtoImplCopyWith<_$BranchDtoImpl> get copyWith =>
      __$$BranchDtoImplCopyWithImpl<_$BranchDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchDtoImplToJson(
      this,
    );
  }
}

abstract class _BranchDto implements BranchDto {
  const factory _BranchDto(
      {required final int id,
      required final String name,
      final int? accountId,
      final String? code,
      final String? street1,
      final String? street2,
      final String? city,
      final String? state,
      final String? zipCode,
      final String? country,
      final String? phone,
      final String? email,
      final String? vatIdNo,
      final String? businessRegistrationNo,
      final ReceiptTemplateDto? receiptTemplate,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt,
      @DateTimeConverter() final DateTime? deletedAt}) = _$BranchDtoImpl;

  factory _BranchDto.fromJson(Map<String, dynamic> json) =
      _$BranchDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int? get accountId;
  @override
  String? get code;
  @override
  String? get street1;
  @override
  String? get street2;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get zipCode;
  @override
  String? get country;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get vatIdNo;
  @override
  String? get businessRegistrationNo;
  @override
  ReceiptTemplateDto? get receiptTemplate;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  @DateTimeConverter()
  DateTime? get deletedAt;
  @override
  @JsonKey(ignore: true)
  _$$BranchDtoImplCopyWith<_$BranchDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
