// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return _Branch.fromJson(json);
}

/// @nodoc
mixin _$Branch {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get accountId => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get street1 => throw _privateConstructorUsedError;
  String? get street2 => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String get businessRegistrationNumber => throw _privateConstructorUsedError;
  String? get vatIdNumber => throw _privateConstructorUsedError;
  ReceiptTemplate get receiptTemplate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchCopyWith<Branch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchCopyWith<$Res> {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) then) =
      _$BranchCopyWithImpl<$Res, Branch>;
  @useResult
  $Res call(
      {int? id,
      String name,
      int accountId,
      String? code,
      String phone,
      String? email,
      String street1,
      String? street2,
      String city,
      String state,
      String? postalCode,
      String? country,
      String businessRegistrationNumber,
      String? vatIdNumber,
      ReceiptTemplate receiptTemplate});

  $ReceiptTemplateCopyWith<$Res> get receiptTemplate;
}

/// @nodoc
class _$BranchCopyWithImpl<$Res, $Val extends Branch>
    implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? accountId = null,
    Object? code = freezed,
    Object? phone = null,
    Object? email = freezed,
    Object? street1 = null,
    Object? street2 = freezed,
    Object? city = null,
    Object? state = null,
    Object? postalCode = freezed,
    Object? country = freezed,
    Object? businessRegistrationNumber = null,
    Object? vatIdNumber = freezed,
    Object? receiptTemplate = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      street1: null == street1
          ? _value.street1
          : street1 // ignore: cast_nullable_to_non_nullable
              as String,
      street2: freezed == street2
          ? _value.street2
          : street2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      businessRegistrationNumber: null == businessRegistrationNumber
          ? _value.businessRegistrationNumber
          : businessRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vatIdNumber: freezed == vatIdNumber
          ? _value.vatIdNumber
          : vatIdNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptTemplate: null == receiptTemplate
          ? _value.receiptTemplate
          : receiptTemplate // ignore: cast_nullable_to_non_nullable
              as ReceiptTemplate,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceiptTemplateCopyWith<$Res> get receiptTemplate {
    return $ReceiptTemplateCopyWith<$Res>(_value.receiptTemplate, (value) {
      return _then(_value.copyWith(receiptTemplate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BranchImplCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$$BranchImplCopyWith(
          _$BranchImpl value, $Res Function(_$BranchImpl) then) =
      __$$BranchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      int accountId,
      String? code,
      String phone,
      String? email,
      String street1,
      String? street2,
      String city,
      String state,
      String? postalCode,
      String? country,
      String businessRegistrationNumber,
      String? vatIdNumber,
      ReceiptTemplate receiptTemplate});

  @override
  $ReceiptTemplateCopyWith<$Res> get receiptTemplate;
}

/// @nodoc
class __$$BranchImplCopyWithImpl<$Res>
    extends _$BranchCopyWithImpl<$Res, _$BranchImpl>
    implements _$$BranchImplCopyWith<$Res> {
  __$$BranchImplCopyWithImpl(
      _$BranchImpl _value, $Res Function(_$BranchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? accountId = null,
    Object? code = freezed,
    Object? phone = null,
    Object? email = freezed,
    Object? street1 = null,
    Object? street2 = freezed,
    Object? city = null,
    Object? state = null,
    Object? postalCode = freezed,
    Object? country = freezed,
    Object? businessRegistrationNumber = null,
    Object? vatIdNumber = freezed,
    Object? receiptTemplate = null,
  }) {
    return _then(_$BranchImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      street1: null == street1
          ? _value.street1
          : street1 // ignore: cast_nullable_to_non_nullable
              as String,
      street2: freezed == street2
          ? _value.street2
          : street2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      businessRegistrationNumber: null == businessRegistrationNumber
          ? _value.businessRegistrationNumber
          : businessRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vatIdNumber: freezed == vatIdNumber
          ? _value.vatIdNumber
          : vatIdNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptTemplate: null == receiptTemplate
          ? _value.receiptTemplate
          : receiptTemplate // ignore: cast_nullable_to_non_nullable
              as ReceiptTemplate,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BranchImpl implements _Branch {
  const _$BranchImpl(
      {this.id,
      required this.name,
      required this.accountId,
      this.code,
      required this.phone,
      this.email,
      required this.street1,
      this.street2,
      required this.city,
      required this.state,
      this.postalCode,
      this.country,
      required this.businessRegistrationNumber,
      this.vatIdNumber,
      required this.receiptTemplate});

  factory _$BranchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final int accountId;
  @override
  final String? code;
  @override
  final String phone;
  @override
  final String? email;
  @override
  final String street1;
  @override
  final String? street2;
  @override
  final String city;
  @override
  final String state;
  @override
  final String? postalCode;
  @override
  final String? country;
  @override
  final String businessRegistrationNumber;
  @override
  final String? vatIdNumber;
  @override
  final ReceiptTemplate receiptTemplate;

  @override
  String toString() {
    return 'Branch(id: $id, name: $name, accountId: $accountId, code: $code, phone: $phone, email: $email, street1: $street1, street2: $street2, city: $city, state: $state, postalCode: $postalCode, country: $country, businessRegistrationNumber: $businessRegistrationNumber, vatIdNumber: $vatIdNumber, receiptTemplate: $receiptTemplate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.street1, street1) || other.street1 == street1) &&
            (identical(other.street2, street2) || other.street2 == street2) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.businessRegistrationNumber,
                    businessRegistrationNumber) ||
                other.businessRegistrationNumber ==
                    businessRegistrationNumber) &&
            (identical(other.vatIdNumber, vatIdNumber) ||
                other.vatIdNumber == vatIdNumber) &&
            (identical(other.receiptTemplate, receiptTemplate) ||
                other.receiptTemplate == receiptTemplate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      accountId,
      code,
      phone,
      email,
      street1,
      street2,
      city,
      state,
      postalCode,
      country,
      businessRegistrationNumber,
      vatIdNumber,
      receiptTemplate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchImplCopyWith<_$BranchImpl> get copyWith =>
      __$$BranchImplCopyWithImpl<_$BranchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchImplToJson(
      this,
    );
  }
}

abstract class _Branch implements Branch {
  const factory _Branch(
      {final int? id,
      required final String name,
      required final int accountId,
      final String? code,
      required final String phone,
      final String? email,
      required final String street1,
      final String? street2,
      required final String city,
      required final String state,
      final String? postalCode,
      final String? country,
      required final String businessRegistrationNumber,
      final String? vatIdNumber,
      required final ReceiptTemplate receiptTemplate}) = _$BranchImpl;

  factory _Branch.fromJson(Map<String, dynamic> json) = _$BranchImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  int get accountId;
  @override
  String? get code;
  @override
  String get phone;
  @override
  String? get email;
  @override
  String get street1;
  @override
  String? get street2;
  @override
  String get city;
  @override
  String get state;
  @override
  String? get postalCode;
  @override
  String? get country;
  @override
  String get businessRegistrationNumber;
  @override
  String? get vatIdNumber;
  @override
  ReceiptTemplate get receiptTemplate;
  @override
  @JsonKey(ignore: true)
  _$$BranchImplCopyWith<_$BranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
