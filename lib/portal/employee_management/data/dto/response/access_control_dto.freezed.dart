// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_control_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccessControlDto _$AccessControlDtoFromJson(Map<String, dynamic> json) {
  return _AccessControlDto.fromJson(json);
}

/// @nodoc
mixin _$AccessControlDto {
  String get module => throw _privateConstructorUsedError;
  List<FeatureDto> get features => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessControlDtoCopyWith<AccessControlDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessControlDtoCopyWith<$Res> {
  factory $AccessControlDtoCopyWith(
          AccessControlDto value, $Res Function(AccessControlDto) then) =
      _$AccessControlDtoCopyWithImpl<$Res, AccessControlDto>;
  @useResult
  $Res call({String module, List<FeatureDto> features});
}

/// @nodoc
class _$AccessControlDtoCopyWithImpl<$Res, $Val extends AccessControlDto>
    implements $AccessControlDtoCopyWith<$Res> {
  _$AccessControlDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? module = null,
    Object? features = null,
  }) {
    return _then(_value.copyWith(
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessControlDtoImplCopyWith<$Res>
    implements $AccessControlDtoCopyWith<$Res> {
  factory _$$AccessControlDtoImplCopyWith(_$AccessControlDtoImpl value,
          $Res Function(_$AccessControlDtoImpl) then) =
      __$$AccessControlDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String module, List<FeatureDto> features});
}

/// @nodoc
class __$$AccessControlDtoImplCopyWithImpl<$Res>
    extends _$AccessControlDtoCopyWithImpl<$Res, _$AccessControlDtoImpl>
    implements _$$AccessControlDtoImplCopyWith<$Res> {
  __$$AccessControlDtoImplCopyWithImpl(_$AccessControlDtoImpl _value,
      $Res Function(_$AccessControlDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? module = null,
    Object? features = null,
  }) {
    return _then(_$AccessControlDtoImpl(
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessControlDtoImpl extends _AccessControlDto {
  const _$AccessControlDtoImpl(
      {required this.module, required final List<FeatureDto> features})
      : _features = features,
        super._();

  factory _$AccessControlDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessControlDtoImplFromJson(json);

  @override
  final String module;
  final List<FeatureDto> _features;
  @override
  List<FeatureDto> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString() {
    return 'AccessControlDto(module: $module, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessControlDtoImpl &&
            (identical(other.module, module) || other.module == module) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, module, const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessControlDtoImplCopyWith<_$AccessControlDtoImpl> get copyWith =>
      __$$AccessControlDtoImplCopyWithImpl<_$AccessControlDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessControlDtoImplToJson(
      this,
    );
  }
}

abstract class _AccessControlDto extends AccessControlDto {
  const factory _AccessControlDto(
      {required final String module,
      required final List<FeatureDto> features}) = _$AccessControlDtoImpl;
  const _AccessControlDto._() : super._();

  factory _AccessControlDto.fromJson(Map<String, dynamic> json) =
      _$AccessControlDtoImpl.fromJson;

  @override
  String get module;
  @override
  List<FeatureDto> get features;
  @override
  @JsonKey(ignore: true)
  _$$AccessControlDtoImplCopyWith<_$AccessControlDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeatureDto _$FeatureDtoFromJson(Map<String, dynamic> json) {
  return _FeatureDto.fromJson(json);
}

/// @nodoc
mixin _$FeatureDto {
  String get name => throw _privateConstructorUsedError;
  List<PermissionDto> get operations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureDtoCopyWith<FeatureDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureDtoCopyWith<$Res> {
  factory $FeatureDtoCopyWith(
          FeatureDto value, $Res Function(FeatureDto) then) =
      _$FeatureDtoCopyWithImpl<$Res, FeatureDto>;
  @useResult
  $Res call({String name, List<PermissionDto> operations});
}

/// @nodoc
class _$FeatureDtoCopyWithImpl<$Res, $Val extends FeatureDto>
    implements $FeatureDtoCopyWith<$Res> {
  _$FeatureDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? operations = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      operations: null == operations
          ? _value.operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<PermissionDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureDtoImplCopyWith<$Res>
    implements $FeatureDtoCopyWith<$Res> {
  factory _$$FeatureDtoImplCopyWith(
          _$FeatureDtoImpl value, $Res Function(_$FeatureDtoImpl) then) =
      __$$FeatureDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<PermissionDto> operations});
}

/// @nodoc
class __$$FeatureDtoImplCopyWithImpl<$Res>
    extends _$FeatureDtoCopyWithImpl<$Res, _$FeatureDtoImpl>
    implements _$$FeatureDtoImplCopyWith<$Res> {
  __$$FeatureDtoImplCopyWithImpl(
      _$FeatureDtoImpl _value, $Res Function(_$FeatureDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? operations = null,
  }) {
    return _then(_$FeatureDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      operations: null == operations
          ? _value._operations
          : operations // ignore: cast_nullable_to_non_nullable
              as List<PermissionDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureDtoImpl extends _FeatureDto {
  const _$FeatureDtoImpl(
      {required this.name, required final List<PermissionDto> operations})
      : _operations = operations,
        super._();

  factory _$FeatureDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureDtoImplFromJson(json);

  @override
  final String name;
  final List<PermissionDto> _operations;
  @override
  List<PermissionDto> get operations {
    if (_operations is EqualUnmodifiableListView) return _operations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operations);
  }

  @override
  String toString() {
    return 'FeatureDto(name: $name, operations: $operations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._operations, _operations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_operations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureDtoImplCopyWith<_$FeatureDtoImpl> get copyWith =>
      __$$FeatureDtoImplCopyWithImpl<_$FeatureDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureDtoImplToJson(
      this,
    );
  }
}

abstract class _FeatureDto extends FeatureDto {
  const factory _FeatureDto(
      {required final String name,
      required final List<PermissionDto> operations}) = _$FeatureDtoImpl;
  const _FeatureDto._() : super._();

  factory _FeatureDto.fromJson(Map<String, dynamic> json) =
      _$FeatureDtoImpl.fromJson;

  @override
  String get name;
  @override
  List<PermissionDto> get operations;
  @override
  @JsonKey(ignore: true)
  _$$FeatureDtoImplCopyWith<_$FeatureDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PermissionDto _$PermissionDtoFromJson(Map<String, dynamic> json) {
  return _PermissionDto.fromJson(json);
}

/// @nodoc
mixin _$PermissionDto {
  String get name => throw _privateConstructorUsedError;
  bool get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionDtoCopyWith<PermissionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionDtoCopyWith<$Res> {
  factory $PermissionDtoCopyWith(
          PermissionDto value, $Res Function(PermissionDto) then) =
      _$PermissionDtoCopyWithImpl<$Res, PermissionDto>;
  @useResult
  $Res call({String name, bool value});
}

/// @nodoc
class _$PermissionDtoCopyWithImpl<$Res, $Val extends PermissionDto>
    implements $PermissionDtoCopyWith<$Res> {
  _$PermissionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionDtoImplCopyWith<$Res>
    implements $PermissionDtoCopyWith<$Res> {
  factory _$$PermissionDtoImplCopyWith(
          _$PermissionDtoImpl value, $Res Function(_$PermissionDtoImpl) then) =
      __$$PermissionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool value});
}

/// @nodoc
class __$$PermissionDtoImplCopyWithImpl<$Res>
    extends _$PermissionDtoCopyWithImpl<$Res, _$PermissionDtoImpl>
    implements _$$PermissionDtoImplCopyWith<$Res> {
  __$$PermissionDtoImplCopyWithImpl(
      _$PermissionDtoImpl _value, $Res Function(_$PermissionDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_$PermissionDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionDtoImpl extends _PermissionDto {
  const _$PermissionDtoImpl({required this.name, required this.value})
      : super._();

  factory _$PermissionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionDtoImplFromJson(json);

  @override
  final String name;
  @override
  final bool value;

  @override
  String toString() {
    return 'PermissionDto(name: $name, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionDtoImplCopyWith<_$PermissionDtoImpl> get copyWith =>
      __$$PermissionDtoImplCopyWithImpl<_$PermissionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionDtoImplToJson(
      this,
    );
  }
}

abstract class _PermissionDto extends PermissionDto {
  const factory _PermissionDto(
      {required final String name,
      required final bool value}) = _$PermissionDtoImpl;
  const _PermissionDto._() : super._();

  factory _PermissionDto.fromJson(Map<String, dynamic> json) =
      _$PermissionDtoImpl.fromJson;

  @override
  String get name;
  @override
  bool get value;
  @override
  @JsonKey(ignore: true)
  _$$PermissionDtoImplCopyWith<_$PermissionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
