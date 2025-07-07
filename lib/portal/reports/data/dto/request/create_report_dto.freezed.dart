// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_report_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateReportDto {
  String get type => throw _privateConstructorUsedError;
  Map<String, dynamic>? get filters => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get payload => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateReportDtoCopyWith<CreateReportDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReportDtoCopyWith<$Res> {
  factory $CreateReportDtoCopyWith(
          CreateReportDto value, $Res Function(CreateReportDto) then) =
      _$CreateReportDtoCopyWithImpl<$Res, CreateReportDto>;
  @useResult
  $Res call(
      {String type,
      Map<String, dynamic>? filters,
      int? userId,
      Map<String, dynamic>? payload});
}

/// @nodoc
class _$CreateReportDtoCopyWithImpl<$Res, $Val extends CreateReportDto>
    implements $CreateReportDtoCopyWith<$Res> {
  _$CreateReportDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? filters = freezed,
    Object? userId = freezed,
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReportDtoImplCopyWith<$Res>
    implements $CreateReportDtoCopyWith<$Res> {
  factory _$$CreateReportDtoImplCopyWith(_$CreateReportDtoImpl value,
          $Res Function(_$CreateReportDtoImpl) then) =
      __$$CreateReportDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      Map<String, dynamic>? filters,
      int? userId,
      Map<String, dynamic>? payload});
}

/// @nodoc
class __$$CreateReportDtoImplCopyWithImpl<$Res>
    extends _$CreateReportDtoCopyWithImpl<$Res, _$CreateReportDtoImpl>
    implements _$$CreateReportDtoImplCopyWith<$Res> {
  __$$CreateReportDtoImplCopyWithImpl(
      _$CreateReportDtoImpl _value, $Res Function(_$CreateReportDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? filters = freezed,
    Object? userId = freezed,
    Object? payload = freezed,
  }) {
    return _then(_$CreateReportDtoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      filters: freezed == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      payload: freezed == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$CreateReportDtoImpl extends _CreateReportDto {
  const _$CreateReportDtoImpl(
      {required this.type,
      final Map<String, dynamic>? filters,
      this.userId,
      final Map<String, dynamic>? payload})
      : _filters = filters,
        _payload = payload,
        super._();

  @override
  final String type;
  final Map<String, dynamic>? _filters;
  @override
  Map<String, dynamic>? get filters {
    final value = _filters;
    if (value == null) return null;
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int? userId;
  final Map<String, dynamic>? _payload;
  @override
  Map<String, dynamic>? get payload {
    final value = _payload;
    if (value == null) return null;
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CreateReportDto(type: $type, filters: $filters, userId: $userId, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReportDtoImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_filters),
      userId,
      const DeepCollectionEquality().hash(_payload));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReportDtoImplCopyWith<_$CreateReportDtoImpl> get copyWith =>
      __$$CreateReportDtoImplCopyWithImpl<_$CreateReportDtoImpl>(
          this, _$identity);
}

abstract class _CreateReportDto extends CreateReportDto {
  const factory _CreateReportDto(
      {required final String type,
      final Map<String, dynamic>? filters,
      final int? userId,
      final Map<String, dynamic>? payload}) = _$CreateReportDtoImpl;
  const _CreateReportDto._() : super._();

  @override
  String get type;
  @override
  Map<String, dynamic>? get filters;
  @override
  int? get userId;
  @override
  Map<String, dynamic>? get payload;
  @override
  @JsonKey(ignore: true)
  _$$CreateReportDtoImplCopyWith<_$CreateReportDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
