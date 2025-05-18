// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaxDto _$TaxDtoFromJson(Map<String, dynamic> json) {
  return _TaxDto.fromJson(json);
}

/// @nodoc
mixin _$TaxDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaxDtoCopyWith<TaxDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxDtoCopyWith<$Res> {
  factory $TaxDtoCopyWith(TaxDto value, $Res Function(TaxDto) then) =
      _$TaxDtoCopyWithImpl<$Res, TaxDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      double percentage,
      bool isDefault,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class _$TaxDtoCopyWithImpl<$Res, $Val extends TaxDto>
    implements $TaxDtoCopyWith<$Res> {
  _$TaxDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? percentage = null,
    Object? isDefault = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxDtoImplCopyWith<$Res> implements $TaxDtoCopyWith<$Res> {
  factory _$$TaxDtoImplCopyWith(
          _$TaxDtoImpl value, $Res Function(_$TaxDtoImpl) then) =
      __$$TaxDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      double percentage,
      bool isDefault,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt});
}

/// @nodoc
class __$$TaxDtoImplCopyWithImpl<$Res>
    extends _$TaxDtoCopyWithImpl<$Res, _$TaxDtoImpl>
    implements _$$TaxDtoImplCopyWith<$Res> {
  __$$TaxDtoImplCopyWithImpl(
      _$TaxDtoImpl _value, $Res Function(_$TaxDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? percentage = null,
    Object? isDefault = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$TaxDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxDtoImpl implements _TaxDto {
  const _$TaxDtoImpl(
      {required this.id,
      required this.name,
      required this.percentage,
      this.isDefault = false,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt});

  factory _$TaxDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final double percentage;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  @DateTimeConverter()
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'TaxDto(id: $id, name: $name, percentage: $percentage, isDefault: $isDefault, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, percentage, isDefault, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxDtoImplCopyWith<_$TaxDtoImpl> get copyWith =>
      __$$TaxDtoImplCopyWithImpl<_$TaxDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxDtoImplToJson(
      this,
    );
  }
}

abstract class _TaxDto implements TaxDto {
  const factory _TaxDto(
      {required final int id,
      required final String name,
      required final double percentage,
      final bool isDefault,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt}) = _$TaxDtoImpl;

  factory _TaxDto.fromJson(Map<String, dynamic> json) = _$TaxDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  double get percentage;
  @override
  bool get isDefault;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TaxDtoImplCopyWith<_$TaxDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
