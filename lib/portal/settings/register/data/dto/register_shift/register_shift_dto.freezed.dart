// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_shift_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterShiftDto _$RegisterShiftDtoFromJson(Map<String, dynamic> json) {
  return _RegisterShiftDto.fromJson(json);
}

/// @nodoc
mixin _$RegisterShiftDto {
  String get status => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterShiftDtoCopyWith<RegisterShiftDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterShiftDtoCopyWith<$Res> {
  factory $RegisterShiftDtoCopyWith(
          RegisterShiftDto value, $Res Function(RegisterShiftDto) then) =
      _$RegisterShiftDtoCopyWithImpl<$Res, RegisterShiftDto>;
  @useResult
  $Res call(
      {String status,
      @DateTimeConverter() DateTime createdAt,
      @DateTimeConverter() DateTime updatedAt});
}

/// @nodoc
class _$RegisterShiftDtoCopyWithImpl<$Res, $Val extends RegisterShiftDto>
    implements $RegisterShiftDtoCopyWith<$Res> {
  _$RegisterShiftDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterShiftDtoImplCopyWith<$Res>
    implements $RegisterShiftDtoCopyWith<$Res> {
  factory _$$RegisterShiftDtoImplCopyWith(_$RegisterShiftDtoImpl value,
          $Res Function(_$RegisterShiftDtoImpl) then) =
      __$$RegisterShiftDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      @DateTimeConverter() DateTime createdAt,
      @DateTimeConverter() DateTime updatedAt});
}

/// @nodoc
class __$$RegisterShiftDtoImplCopyWithImpl<$Res>
    extends _$RegisterShiftDtoCopyWithImpl<$Res, _$RegisterShiftDtoImpl>
    implements _$$RegisterShiftDtoImplCopyWith<$Res> {
  __$$RegisterShiftDtoImplCopyWithImpl(_$RegisterShiftDtoImpl _value,
      $Res Function(_$RegisterShiftDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RegisterShiftDtoImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterShiftDtoImpl implements _RegisterShiftDto {
  const _$RegisterShiftDtoImpl(
      {required this.status,
      @DateTimeConverter() required this.createdAt,
      @DateTimeConverter() required this.updatedAt});

  factory _$RegisterShiftDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterShiftDtoImplFromJson(json);

  @override
  final String status;
  @override
  @DateTimeConverter()
  final DateTime createdAt;
  @override
  @DateTimeConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'RegisterShiftDto(status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterShiftDtoImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterShiftDtoImplCopyWith<_$RegisterShiftDtoImpl> get copyWith =>
      __$$RegisterShiftDtoImplCopyWithImpl<_$RegisterShiftDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterShiftDtoImplToJson(
      this,
    );
  }
}

abstract class _RegisterShiftDto implements RegisterShiftDto {
  const factory _RegisterShiftDto(
          {required final String status,
          @DateTimeConverter() required final DateTime createdAt,
          @DateTimeConverter() required final DateTime updatedAt}) =
      _$RegisterShiftDtoImpl;

  factory _RegisterShiftDto.fromJson(Map<String, dynamic> json) =
      _$RegisterShiftDtoImpl.fromJson;

  @override
  String get status;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  @DateTimeConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$RegisterShiftDtoImplCopyWith<_$RegisterShiftDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
