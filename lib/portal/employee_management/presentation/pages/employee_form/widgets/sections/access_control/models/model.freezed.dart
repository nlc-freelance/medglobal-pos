// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccessControlModel {
  SystemAccess? get system => throw _privateConstructorUsedError;
  String get name =>
      throw _privateConstructorUsedError; // e.g., stock management, employee management
  String? get description => throw _privateConstructorUsedError;
  List<FeatureModel> get features => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccessControlModelCopyWith<AccessControlModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessControlModelCopyWith<$Res> {
  factory $AccessControlModelCopyWith(
          AccessControlModel value, $Res Function(AccessControlModel) then) =
      _$AccessControlModelCopyWithImpl<$Res, AccessControlModel>;
  @useResult
  $Res call(
      {SystemAccess? system,
      String name,
      String? description,
      List<FeatureModel> features,
      bool isChecked});
}

/// @nodoc
class _$AccessControlModelCopyWithImpl<$Res, $Val extends AccessControlModel>
    implements $AccessControlModelCopyWith<$Res> {
  _$AccessControlModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? system = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? features = null,
    Object? isChecked = null,
  }) {
    return _then(_value.copyWith(
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as SystemAccess?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureModel>,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessControlModelImplCopyWith<$Res>
    implements $AccessControlModelCopyWith<$Res> {
  factory _$$AccessControlModelImplCopyWith(_$AccessControlModelImpl value,
          $Res Function(_$AccessControlModelImpl) then) =
      __$$AccessControlModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SystemAccess? system,
      String name,
      String? description,
      List<FeatureModel> features,
      bool isChecked});
}

/// @nodoc
class __$$AccessControlModelImplCopyWithImpl<$Res>
    extends _$AccessControlModelCopyWithImpl<$Res, _$AccessControlModelImpl>
    implements _$$AccessControlModelImplCopyWith<$Res> {
  __$$AccessControlModelImplCopyWithImpl(_$AccessControlModelImpl _value,
      $Res Function(_$AccessControlModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? system = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? features = null,
    Object? isChecked = null,
  }) {
    return _then(_$AccessControlModelImpl(
      system: freezed == system
          ? _value.system
          : system // ignore: cast_nullable_to_non_nullable
              as SystemAccess?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureModel>,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AccessControlModelImpl extends _AccessControlModel {
  const _$AccessControlModelImpl(
      {this.system,
      required this.name,
      this.description,
      required final List<FeatureModel> features,
      this.isChecked = true})
      : _features = features,
        super._();

  @override
  final SystemAccess? system;
  @override
  final String name;
// e.g., stock management, employee management
  @override
  final String? description;
  final List<FeatureModel> _features;
  @override
  List<FeatureModel> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  @JsonKey()
  final bool isChecked;

  @override
  String toString() {
    return 'AccessControlModel(system: $system, name: $name, description: $description, features: $features, isChecked: $isChecked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessControlModelImpl &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, system, name, description,
      const DeepCollectionEquality().hash(_features), isChecked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessControlModelImplCopyWith<_$AccessControlModelImpl> get copyWith =>
      __$$AccessControlModelImplCopyWithImpl<_$AccessControlModelImpl>(
          this, _$identity);
}

abstract class _AccessControlModel extends AccessControlModel {
  const factory _AccessControlModel(
      {final SystemAccess? system,
      required final String name,
      final String? description,
      required final List<FeatureModel> features,
      final bool isChecked}) = _$AccessControlModelImpl;
  const _AccessControlModel._() : super._();

  @override
  SystemAccess? get system;
  @override
  String get name;
  @override // e.g., stock management, employee management
  String? get description;
  @override
  List<FeatureModel> get features;
  @override
  bool get isChecked;
  @override
  @JsonKey(ignore: true)
  _$$AccessControlModelImplCopyWith<_$AccessControlModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FeatureModel {
  String get name =>
      throw _privateConstructorUsedError; // e.g. supply needs, purchase orders, manage employees
  String? get description => throw _privateConstructorUsedError;
  List<PermissionModel> get permissions => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeatureModelCopyWith<FeatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureModelCopyWith<$Res> {
  factory $FeatureModelCopyWith(
          FeatureModel value, $Res Function(FeatureModel) then) =
      _$FeatureModelCopyWithImpl<$Res, FeatureModel>;
  @useResult
  $Res call(
      {String name,
      String? description,
      List<PermissionModel> permissions,
      bool isChecked});
}

/// @nodoc
class _$FeatureModelCopyWithImpl<$Res, $Val extends FeatureModel>
    implements $FeatureModelCopyWith<$Res> {
  _$FeatureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? permissions = null,
    Object? isChecked = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<PermissionModel>,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureModelImplCopyWith<$Res>
    implements $FeatureModelCopyWith<$Res> {
  factory _$$FeatureModelImplCopyWith(
          _$FeatureModelImpl value, $Res Function(_$FeatureModelImpl) then) =
      __$$FeatureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? description,
      List<PermissionModel> permissions,
      bool isChecked});
}

/// @nodoc
class __$$FeatureModelImplCopyWithImpl<$Res>
    extends _$FeatureModelCopyWithImpl<$Res, _$FeatureModelImpl>
    implements _$$FeatureModelImplCopyWith<$Res> {
  __$$FeatureModelImplCopyWithImpl(
      _$FeatureModelImpl _value, $Res Function(_$FeatureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? permissions = null,
    Object? isChecked = null,
  }) {
    return _then(_$FeatureModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<PermissionModel>,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FeatureModelImpl implements _FeatureModel {
  const _$FeatureModelImpl(
      {required this.name,
      this.description,
      required final List<PermissionModel> permissions,
      this.isChecked = true})
      : _permissions = permissions;

  @override
  final String name;
// e.g. supply needs, purchase orders, manage employees
  @override
  final String? description;
  final List<PermissionModel> _permissions;
  @override
  List<PermissionModel> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  @JsonKey()
  final bool isChecked;

  @override
  String toString() {
    return 'FeatureModel(name: $name, description: $description, permissions: $permissions, isChecked: $isChecked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, description,
      const DeepCollectionEquality().hash(_permissions), isChecked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureModelImplCopyWith<_$FeatureModelImpl> get copyWith =>
      __$$FeatureModelImplCopyWithImpl<_$FeatureModelImpl>(this, _$identity);
}

abstract class _FeatureModel implements FeatureModel {
  const factory _FeatureModel(
      {required final String name,
      final String? description,
      required final List<PermissionModel> permissions,
      final bool isChecked}) = _$FeatureModelImpl;

  @override
  String get name;
  @override // e.g. supply needs, purchase orders, manage employees
  String? get description;
  @override
  List<PermissionModel> get permissions;
  @override
  bool get isChecked;
  @override
  @JsonKey(ignore: true)
  _$$FeatureModelImplCopyWith<_$FeatureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PermissionModel {
  String get type =>
      throw _privateConstructorUsedError; // e.g. 'view', 'create', 'update', 'delete', 'export'
  String? get description => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PermissionModelCopyWith<PermissionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionModelCopyWith<$Res> {
  factory $PermissionModelCopyWith(
          PermissionModel value, $Res Function(PermissionModel) then) =
      _$PermissionModelCopyWithImpl<$Res, PermissionModel>;
  @useResult
  $Res call({String type, String? description, bool isChecked});
}

/// @nodoc
class _$PermissionModelCopyWithImpl<$Res, $Val extends PermissionModel>
    implements $PermissionModelCopyWith<$Res> {
  _$PermissionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? description = freezed,
    Object? isChecked = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionModelImplCopyWith<$Res>
    implements $PermissionModelCopyWith<$Res> {
  factory _$$PermissionModelImplCopyWith(_$PermissionModelImpl value,
          $Res Function(_$PermissionModelImpl) then) =
      __$$PermissionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String? description, bool isChecked});
}

/// @nodoc
class __$$PermissionModelImplCopyWithImpl<$Res>
    extends _$PermissionModelCopyWithImpl<$Res, _$PermissionModelImpl>
    implements _$$PermissionModelImplCopyWith<$Res> {
  __$$PermissionModelImplCopyWithImpl(
      _$PermissionModelImpl _value, $Res Function(_$PermissionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? description = freezed,
    Object? isChecked = null,
  }) {
    return _then(_$PermissionModelImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PermissionModelImpl implements _PermissionModel {
  const _$PermissionModelImpl(
      {required this.type, this.description, this.isChecked = true});

  @override
  final String type;
// e.g. 'view', 'create', 'update', 'delete', 'export'
  @override
  final String? description;
  @override
  @JsonKey()
  final bool isChecked;

  @override
  String toString() {
    return 'PermissionModel(type: $type, description: $description, isChecked: $isChecked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionModelImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, description, isChecked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionModelImplCopyWith<_$PermissionModelImpl> get copyWith =>
      __$$PermissionModelImplCopyWithImpl<_$PermissionModelImpl>(
          this, _$identity);
}

abstract class _PermissionModel implements PermissionModel {
  const factory _PermissionModel(
      {required final String type,
      final String? description,
      final bool isChecked}) = _$PermissionModelImpl;

  @override
  String get type;
  @override // e.g. 'view', 'create', 'update', 'delete', 'export'
  String? get description;
  @override
  bool get isChecked;
  @override
  @JsonKey(ignore: true)
  _$$PermissionModelImplCopyWith<_$PermissionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
