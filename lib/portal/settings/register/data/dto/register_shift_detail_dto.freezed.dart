// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_shift_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterShiftDetailDto _$RegisterShiftDetailDtoFromJson(
    Map<String, dynamic> json) {
  return _RegisterShiftDetailDto.fromJson(json);
}

/// @nodoc
mixin _$RegisterShiftDetailDto {
  String get status => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterShiftDetailDtoCopyWith<RegisterShiftDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterShiftDetailDtoCopyWith<$Res> {
  factory $RegisterShiftDetailDtoCopyWith(RegisterShiftDetailDto value,
          $Res Function(RegisterShiftDetailDto) then) =
      _$RegisterShiftDetailDtoCopyWithImpl<$Res, RegisterShiftDetailDto>;
  @useResult
  $Res call(
      {String status,
      @DateTimeConverter() DateTime createdAt,
      @DateTimeConverter() DateTime updatedAt});
}

/// @nodoc
class _$RegisterShiftDetailDtoCopyWithImpl<$Res,
        $Val extends RegisterShiftDetailDto>
    implements $RegisterShiftDetailDtoCopyWith<$Res> {
  _$RegisterShiftDetailDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$RegisterShiftDetailDtoImplCopyWith<$Res>
    implements $RegisterShiftDetailDtoCopyWith<$Res> {
  factory _$$RegisterShiftDetailDtoImplCopyWith(
          _$RegisterShiftDetailDtoImpl value,
          $Res Function(_$RegisterShiftDetailDtoImpl) then) =
      __$$RegisterShiftDetailDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      @DateTimeConverter() DateTime createdAt,
      @DateTimeConverter() DateTime updatedAt});
}

/// @nodoc
class __$$RegisterShiftDetailDtoImplCopyWithImpl<$Res>
    extends _$RegisterShiftDetailDtoCopyWithImpl<$Res,
        _$RegisterShiftDetailDtoImpl>
    implements _$$RegisterShiftDetailDtoImplCopyWith<$Res> {
  __$$RegisterShiftDetailDtoImplCopyWithImpl(
      _$RegisterShiftDetailDtoImpl _value,
      $Res Function(_$RegisterShiftDetailDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RegisterShiftDetailDtoImpl(
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
class _$RegisterShiftDetailDtoImpl implements _RegisterShiftDetailDto {
  const _$RegisterShiftDetailDtoImpl(
      {required this.status,
      @DateTimeConverter() required this.createdAt,
      @DateTimeConverter() required this.updatedAt});

  factory _$RegisterShiftDetailDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterShiftDetailDtoImplFromJson(json);

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
    return 'RegisterShiftDetailDto(status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterShiftDetailDtoImpl &&
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
  _$$RegisterShiftDetailDtoImplCopyWith<_$RegisterShiftDetailDtoImpl>
      get copyWith => __$$RegisterShiftDetailDtoImplCopyWithImpl<
          _$RegisterShiftDetailDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterShiftDetailDtoImplToJson(
      this,
    );
  }
}

abstract class _RegisterShiftDetailDto implements RegisterShiftDetailDto {
  const factory _RegisterShiftDetailDto(
          {required final String status,
          @DateTimeConverter() required final DateTime createdAt,
          @DateTimeConverter() required final DateTime updatedAt}) =
      _$RegisterShiftDetailDtoImpl;

  factory _RegisterShiftDetailDto.fromJson(Map<String, dynamic> json) =
      _$RegisterShiftDetailDtoImpl.fromJson;

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
  _$$RegisterShiftDetailDtoImplCopyWith<_$RegisterShiftDetailDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
