// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SupplierEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getSupplierById,
    required TResult Function(Supplier supplier) createSupplier,
    required TResult Function(Supplier supplier) updateSupplier,
    required TResult Function(int supplierId, String supplierName)
        deleteSupplier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getSupplierById,
    TResult? Function(Supplier supplier)? createSupplier,
    TResult? Function(Supplier supplier)? updateSupplier,
    TResult? Function(int supplierId, String supplierName)? deleteSupplier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getSupplierById,
    TResult Function(Supplier supplier)? createSupplier,
    TResult Function(Supplier supplier)? updateSupplier,
    TResult Function(int supplierId, String supplierName)? deleteSupplier,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSupplierById value) getSupplierById,
    required TResult Function(_CreateSupplier value) createSupplier,
    required TResult Function(_UpdateSupplier value) updateSupplier,
    required TResult Function(_DeleteSupplier value) deleteSupplier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSupplierById value)? getSupplierById,
    TResult? Function(_CreateSupplier value)? createSupplier,
    TResult? Function(_UpdateSupplier value)? updateSupplier,
    TResult? Function(_DeleteSupplier value)? deleteSupplier,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSupplierById value)? getSupplierById,
    TResult Function(_CreateSupplier value)? createSupplier,
    TResult Function(_UpdateSupplier value)? updateSupplier,
    TResult Function(_DeleteSupplier value)? deleteSupplier,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplierEventCopyWith<$Res> {
  factory $SupplierEventCopyWith(
          SupplierEvent value, $Res Function(SupplierEvent) then) =
      _$SupplierEventCopyWithImpl<$Res, SupplierEvent>;
}

/// @nodoc
class _$SupplierEventCopyWithImpl<$Res, $Val extends SupplierEvent>
    implements $SupplierEventCopyWith<$Res> {
  _$SupplierEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetSupplierByIdImplCopyWith<$Res> {
  factory _$$GetSupplierByIdImplCopyWith(_$GetSupplierByIdImpl value,
          $Res Function(_$GetSupplierByIdImpl) then) =
      __$$GetSupplierByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetSupplierByIdImplCopyWithImpl<$Res>
    extends _$SupplierEventCopyWithImpl<$Res, _$GetSupplierByIdImpl>
    implements _$$GetSupplierByIdImplCopyWith<$Res> {
  __$$GetSupplierByIdImplCopyWithImpl(
      _$GetSupplierByIdImpl _value, $Res Function(_$GetSupplierByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetSupplierByIdImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetSupplierByIdImpl implements _GetSupplierById {
  const _$GetSupplierByIdImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'SupplierEvent.getSupplierById(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSupplierByIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSupplierByIdImplCopyWith<_$GetSupplierByIdImpl> get copyWith =>
      __$$GetSupplierByIdImplCopyWithImpl<_$GetSupplierByIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getSupplierById,
    required TResult Function(Supplier supplier) createSupplier,
    required TResult Function(Supplier supplier) updateSupplier,
    required TResult Function(int supplierId, String supplierName)
        deleteSupplier,
  }) {
    return getSupplierById(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getSupplierById,
    TResult? Function(Supplier supplier)? createSupplier,
    TResult? Function(Supplier supplier)? updateSupplier,
    TResult? Function(int supplierId, String supplierName)? deleteSupplier,
  }) {
    return getSupplierById?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getSupplierById,
    TResult Function(Supplier supplier)? createSupplier,
    TResult Function(Supplier supplier)? updateSupplier,
    TResult Function(int supplierId, String supplierName)? deleteSupplier,
    required TResult orElse(),
  }) {
    if (getSupplierById != null) {
      return getSupplierById(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSupplierById value) getSupplierById,
    required TResult Function(_CreateSupplier value) createSupplier,
    required TResult Function(_UpdateSupplier value) updateSupplier,
    required TResult Function(_DeleteSupplier value) deleteSupplier,
  }) {
    return getSupplierById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSupplierById value)? getSupplierById,
    TResult? Function(_CreateSupplier value)? createSupplier,
    TResult? Function(_UpdateSupplier value)? updateSupplier,
    TResult? Function(_DeleteSupplier value)? deleteSupplier,
  }) {
    return getSupplierById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSupplierById value)? getSupplierById,
    TResult Function(_CreateSupplier value)? createSupplier,
    TResult Function(_UpdateSupplier value)? updateSupplier,
    TResult Function(_DeleteSupplier value)? deleteSupplier,
    required TResult orElse(),
  }) {
    if (getSupplierById != null) {
      return getSupplierById(this);
    }
    return orElse();
  }
}

abstract class _GetSupplierById implements SupplierEvent {
  const factory _GetSupplierById(final int id) = _$GetSupplierByIdImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$GetSupplierByIdImplCopyWith<_$GetSupplierByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateSupplierImplCopyWith<$Res> {
  factory _$$CreateSupplierImplCopyWith(_$CreateSupplierImpl value,
          $Res Function(_$CreateSupplierImpl) then) =
      __$$CreateSupplierImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Supplier supplier});

  $SupplierCopyWith<$Res> get supplier;
}

/// @nodoc
class __$$CreateSupplierImplCopyWithImpl<$Res>
    extends _$SupplierEventCopyWithImpl<$Res, _$CreateSupplierImpl>
    implements _$$CreateSupplierImplCopyWith<$Res> {
  __$$CreateSupplierImplCopyWithImpl(
      _$CreateSupplierImpl _value, $Res Function(_$CreateSupplierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplier = null,
  }) {
    return _then(_$CreateSupplierImpl(
      null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res> get supplier {
    return $SupplierCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value));
    });
  }
}

/// @nodoc

class _$CreateSupplierImpl implements _CreateSupplier {
  const _$CreateSupplierImpl(this.supplier);

  @override
  final Supplier supplier;

  @override
  String toString() {
    return 'SupplierEvent.createSupplier(supplier: $supplier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSupplierImpl &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, supplier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSupplierImplCopyWith<_$CreateSupplierImpl> get copyWith =>
      __$$CreateSupplierImplCopyWithImpl<_$CreateSupplierImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getSupplierById,
    required TResult Function(Supplier supplier) createSupplier,
    required TResult Function(Supplier supplier) updateSupplier,
    required TResult Function(int supplierId, String supplierName)
        deleteSupplier,
  }) {
    return createSupplier(supplier);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getSupplierById,
    TResult? Function(Supplier supplier)? createSupplier,
    TResult? Function(Supplier supplier)? updateSupplier,
    TResult? Function(int supplierId, String supplierName)? deleteSupplier,
  }) {
    return createSupplier?.call(supplier);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getSupplierById,
    TResult Function(Supplier supplier)? createSupplier,
    TResult Function(Supplier supplier)? updateSupplier,
    TResult Function(int supplierId, String supplierName)? deleteSupplier,
    required TResult orElse(),
  }) {
    if (createSupplier != null) {
      return createSupplier(supplier);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSupplierById value) getSupplierById,
    required TResult Function(_CreateSupplier value) createSupplier,
    required TResult Function(_UpdateSupplier value) updateSupplier,
    required TResult Function(_DeleteSupplier value) deleteSupplier,
  }) {
    return createSupplier(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSupplierById value)? getSupplierById,
    TResult? Function(_CreateSupplier value)? createSupplier,
    TResult? Function(_UpdateSupplier value)? updateSupplier,
    TResult? Function(_DeleteSupplier value)? deleteSupplier,
  }) {
    return createSupplier?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSupplierById value)? getSupplierById,
    TResult Function(_CreateSupplier value)? createSupplier,
    TResult Function(_UpdateSupplier value)? updateSupplier,
    TResult Function(_DeleteSupplier value)? deleteSupplier,
    required TResult orElse(),
  }) {
    if (createSupplier != null) {
      return createSupplier(this);
    }
    return orElse();
  }
}

abstract class _CreateSupplier implements SupplierEvent {
  const factory _CreateSupplier(final Supplier supplier) = _$CreateSupplierImpl;

  Supplier get supplier;
  @JsonKey(ignore: true)
  _$$CreateSupplierImplCopyWith<_$CreateSupplierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSupplierImplCopyWith<$Res> {
  factory _$$UpdateSupplierImplCopyWith(_$UpdateSupplierImpl value,
          $Res Function(_$UpdateSupplierImpl) then) =
      __$$UpdateSupplierImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Supplier supplier});

  $SupplierCopyWith<$Res> get supplier;
}

/// @nodoc
class __$$UpdateSupplierImplCopyWithImpl<$Res>
    extends _$SupplierEventCopyWithImpl<$Res, _$UpdateSupplierImpl>
    implements _$$UpdateSupplierImplCopyWith<$Res> {
  __$$UpdateSupplierImplCopyWithImpl(
      _$UpdateSupplierImpl _value, $Res Function(_$UpdateSupplierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplier = null,
  }) {
    return _then(_$UpdateSupplierImpl(
      null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res> get supplier {
    return $SupplierCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value));
    });
  }
}

/// @nodoc

class _$UpdateSupplierImpl implements _UpdateSupplier {
  const _$UpdateSupplierImpl(this.supplier);

  @override
  final Supplier supplier;

  @override
  String toString() {
    return 'SupplierEvent.updateSupplier(supplier: $supplier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSupplierImpl &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, supplier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSupplierImplCopyWith<_$UpdateSupplierImpl> get copyWith =>
      __$$UpdateSupplierImplCopyWithImpl<_$UpdateSupplierImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getSupplierById,
    required TResult Function(Supplier supplier) createSupplier,
    required TResult Function(Supplier supplier) updateSupplier,
    required TResult Function(int supplierId, String supplierName)
        deleteSupplier,
  }) {
    return updateSupplier(supplier);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getSupplierById,
    TResult? Function(Supplier supplier)? createSupplier,
    TResult? Function(Supplier supplier)? updateSupplier,
    TResult? Function(int supplierId, String supplierName)? deleteSupplier,
  }) {
    return updateSupplier?.call(supplier);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getSupplierById,
    TResult Function(Supplier supplier)? createSupplier,
    TResult Function(Supplier supplier)? updateSupplier,
    TResult Function(int supplierId, String supplierName)? deleteSupplier,
    required TResult orElse(),
  }) {
    if (updateSupplier != null) {
      return updateSupplier(supplier);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSupplierById value) getSupplierById,
    required TResult Function(_CreateSupplier value) createSupplier,
    required TResult Function(_UpdateSupplier value) updateSupplier,
    required TResult Function(_DeleteSupplier value) deleteSupplier,
  }) {
    return updateSupplier(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSupplierById value)? getSupplierById,
    TResult? Function(_CreateSupplier value)? createSupplier,
    TResult? Function(_UpdateSupplier value)? updateSupplier,
    TResult? Function(_DeleteSupplier value)? deleteSupplier,
  }) {
    return updateSupplier?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSupplierById value)? getSupplierById,
    TResult Function(_CreateSupplier value)? createSupplier,
    TResult Function(_UpdateSupplier value)? updateSupplier,
    TResult Function(_DeleteSupplier value)? deleteSupplier,
    required TResult orElse(),
  }) {
    if (updateSupplier != null) {
      return updateSupplier(this);
    }
    return orElse();
  }
}

abstract class _UpdateSupplier implements SupplierEvent {
  const factory _UpdateSupplier(final Supplier supplier) = _$UpdateSupplierImpl;

  Supplier get supplier;
  @JsonKey(ignore: true)
  _$$UpdateSupplierImplCopyWith<_$UpdateSupplierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteSupplierImplCopyWith<$Res> {
  factory _$$DeleteSupplierImplCopyWith(_$DeleteSupplierImpl value,
          $Res Function(_$DeleteSupplierImpl) then) =
      __$$DeleteSupplierImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int supplierId, String supplierName});
}

/// @nodoc
class __$$DeleteSupplierImplCopyWithImpl<$Res>
    extends _$SupplierEventCopyWithImpl<$Res, _$DeleteSupplierImpl>
    implements _$$DeleteSupplierImplCopyWith<$Res> {
  __$$DeleteSupplierImplCopyWithImpl(
      _$DeleteSupplierImpl _value, $Res Function(_$DeleteSupplierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplierId = null,
    Object? supplierName = null,
  }) {
    return _then(_$DeleteSupplierImpl(
      null == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int,
      null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteSupplierImpl implements _DeleteSupplier {
  const _$DeleteSupplierImpl(this.supplierId, this.supplierName);

  @override
  final int supplierId;
  @override
  final String supplierName;

  @override
  String toString() {
    return 'SupplierEvent.deleteSupplier(supplierId: $supplierId, supplierName: $supplierName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSupplierImpl &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, supplierId, supplierName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSupplierImplCopyWith<_$DeleteSupplierImpl> get copyWith =>
      __$$DeleteSupplierImplCopyWithImpl<_$DeleteSupplierImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getSupplierById,
    required TResult Function(Supplier supplier) createSupplier,
    required TResult Function(Supplier supplier) updateSupplier,
    required TResult Function(int supplierId, String supplierName)
        deleteSupplier,
  }) {
    return deleteSupplier(supplierId, supplierName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getSupplierById,
    TResult? Function(Supplier supplier)? createSupplier,
    TResult? Function(Supplier supplier)? updateSupplier,
    TResult? Function(int supplierId, String supplierName)? deleteSupplier,
  }) {
    return deleteSupplier?.call(supplierId, supplierName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getSupplierById,
    TResult Function(Supplier supplier)? createSupplier,
    TResult Function(Supplier supplier)? updateSupplier,
    TResult Function(int supplierId, String supplierName)? deleteSupplier,
    required TResult orElse(),
  }) {
    if (deleteSupplier != null) {
      return deleteSupplier(supplierId, supplierName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetSupplierById value) getSupplierById,
    required TResult Function(_CreateSupplier value) createSupplier,
    required TResult Function(_UpdateSupplier value) updateSupplier,
    required TResult Function(_DeleteSupplier value) deleteSupplier,
  }) {
    return deleteSupplier(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetSupplierById value)? getSupplierById,
    TResult? Function(_CreateSupplier value)? createSupplier,
    TResult? Function(_UpdateSupplier value)? updateSupplier,
    TResult? Function(_DeleteSupplier value)? deleteSupplier,
  }) {
    return deleteSupplier?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetSupplierById value)? getSupplierById,
    TResult Function(_CreateSupplier value)? createSupplier,
    TResult Function(_UpdateSupplier value)? updateSupplier,
    TResult Function(_DeleteSupplier value)? deleteSupplier,
    required TResult orElse(),
  }) {
    if (deleteSupplier != null) {
      return deleteSupplier(this);
    }
    return orElse();
  }
}

abstract class _DeleteSupplier implements SupplierEvent {
  const factory _DeleteSupplier(
      final int supplierId, final String supplierName) = _$DeleteSupplierImpl;

  int get supplierId;
  String get supplierName;
  @JsonKey(ignore: true)
  _$$DeleteSupplierImplCopyWith<_$DeleteSupplierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SupplierState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Supplier supplier) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Supplier supplier)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Supplier supplier)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplierStateCopyWith<$Res> {
  factory $SupplierStateCopyWith(
          SupplierState value, $Res Function(SupplierState) then) =
      _$SupplierStateCopyWithImpl<$Res, SupplierState>;
}

/// @nodoc
class _$SupplierStateCopyWithImpl<$Res, $Val extends SupplierState>
    implements $SupplierStateCopyWith<$Res> {
  _$SupplierStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SupplierStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SupplierState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Supplier supplier) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Supplier supplier)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Supplier supplier)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SupplierState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SupplierStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SupplierState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Supplier supplier) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Supplier supplier)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Supplier supplier)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SupplierState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Supplier supplier});

  $SupplierCopyWith<$Res> get supplier;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SupplierStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplier = null,
  }) {
    return _then(_$LoadedImpl(
      null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res> get supplier {
    return $SupplierCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.supplier);

  @override
  final Supplier supplier;

  @override
  String toString() {
    return 'SupplierState.loaded(supplier: $supplier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, supplier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Supplier supplier) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return loaded(supplier);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Supplier supplier)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(supplier);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Supplier supplier)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(supplier);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements SupplierState {
  const factory _Loaded(final Supplier supplier) = _$LoadedImpl;

  Supplier get supplier;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailedImplCopyWith<$Res> {
  factory _$$LoadFailedImplCopyWith(
          _$LoadFailedImpl value, $Res Function(_$LoadFailedImpl) then) =
      __$$LoadFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LoadFailedImplCopyWithImpl<$Res>
    extends _$SupplierStateCopyWithImpl<$Res, _$LoadFailedImpl>
    implements _$$LoadFailedImplCopyWith<$Res> {
  __$$LoadFailedImplCopyWithImpl(
      _$LoadFailedImpl _value, $Res Function(_$LoadFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LoadFailedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadFailedImpl implements _LoadFailed {
  const _$LoadFailedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SupplierState.loadFailed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailedImplCopyWith<_$LoadFailedImpl> get copyWith =>
      __$$LoadFailedImplCopyWithImpl<_$LoadFailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Supplier supplier) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return loadFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Supplier supplier)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return loadFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Supplier supplier)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return loadFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return loadFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(this);
    }
    return orElse();
  }
}

abstract class _LoadFailed implements SupplierState {
  const factory _LoadFailed(final String message) = _$LoadFailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$LoadFailedImplCopyWith<_$LoadFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessingImplCopyWith<$Res> {
  factory _$$ProcessingImplCopyWith(
          _$ProcessingImpl value, $Res Function(_$ProcessingImpl) then) =
      __$$ProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessingImplCopyWithImpl<$Res>
    extends _$SupplierStateCopyWithImpl<$Res, _$ProcessingImpl>
    implements _$$ProcessingImplCopyWith<$Res> {
  __$$ProcessingImplCopyWithImpl(
      _$ProcessingImpl _value, $Res Function(_$ProcessingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProcessingImpl implements _Processing {
  const _$ProcessingImpl();

  @override
  String toString() {
    return 'SupplierState.processing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProcessingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Supplier supplier) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Supplier supplier)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Supplier supplier)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _Processing implements SupplierState {
  const factory _Processing() = _$ProcessingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SupplierStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SupplierState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Supplier supplier) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Supplier supplier)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Supplier supplier)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SupplierState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$SupplierStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SupplierState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Supplier supplier) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Supplier supplier)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Supplier supplier)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements SupplierState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
