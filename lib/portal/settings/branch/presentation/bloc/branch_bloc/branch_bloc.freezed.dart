// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BranchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getBranchById,
    required TResult Function() getDefaultReceipt,
    required TResult Function(Branch branch) createBranch,
    required TResult Function(Branch branch) updateBranch,
    required TResult Function(Branch branch) deleteBranch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBranchById,
    TResult? Function()? getDefaultReceipt,
    TResult? Function(Branch branch)? createBranch,
    TResult? Function(Branch branch)? updateBranch,
    TResult? Function(Branch branch)? deleteBranch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBranchById,
    TResult Function()? getDefaultReceipt,
    TResult Function(Branch branch)? createBranch,
    TResult Function(Branch branch)? updateBranch,
    TResult Function(Branch branch)? deleteBranch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBranchById value) getBranchById,
    required TResult Function(_GetDefaultReceipt value) getDefaultReceipt,
    required TResult Function(_CreateBranch value) createBranch,
    required TResult Function(_UpdateBranch value) updateBranch,
    required TResult Function(_DeleteBranch value) deleteBranch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBranchById value)? getBranchById,
    TResult? Function(_GetDefaultReceipt value)? getDefaultReceipt,
    TResult? Function(_CreateBranch value)? createBranch,
    TResult? Function(_UpdateBranch value)? updateBranch,
    TResult? Function(_DeleteBranch value)? deleteBranch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBranchById value)? getBranchById,
    TResult Function(_GetDefaultReceipt value)? getDefaultReceipt,
    TResult Function(_CreateBranch value)? createBranch,
    TResult Function(_UpdateBranch value)? updateBranch,
    TResult Function(_DeleteBranch value)? deleteBranch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchEventCopyWith<$Res> {
  factory $BranchEventCopyWith(
          BranchEvent value, $Res Function(BranchEvent) then) =
      _$BranchEventCopyWithImpl<$Res, BranchEvent>;
}

/// @nodoc
class _$BranchEventCopyWithImpl<$Res, $Val extends BranchEvent>
    implements $BranchEventCopyWith<$Res> {
  _$BranchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetBranchByIdImplCopyWith<$Res> {
  factory _$$GetBranchByIdImplCopyWith(
          _$GetBranchByIdImpl value, $Res Function(_$GetBranchByIdImpl) then) =
      __$$GetBranchByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetBranchByIdImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$GetBranchByIdImpl>
    implements _$$GetBranchByIdImplCopyWith<$Res> {
  __$$GetBranchByIdImplCopyWithImpl(
      _$GetBranchByIdImpl _value, $Res Function(_$GetBranchByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetBranchByIdImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetBranchByIdImpl implements _GetBranchById {
  const _$GetBranchByIdImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'BranchEvent.getBranchById(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBranchByIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBranchByIdImplCopyWith<_$GetBranchByIdImpl> get copyWith =>
      __$$GetBranchByIdImplCopyWithImpl<_$GetBranchByIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getBranchById,
    required TResult Function() getDefaultReceipt,
    required TResult Function(Branch branch) createBranch,
    required TResult Function(Branch branch) updateBranch,
    required TResult Function(Branch branch) deleteBranch,
  }) {
    return getBranchById(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBranchById,
    TResult? Function()? getDefaultReceipt,
    TResult? Function(Branch branch)? createBranch,
    TResult? Function(Branch branch)? updateBranch,
    TResult? Function(Branch branch)? deleteBranch,
  }) {
    return getBranchById?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBranchById,
    TResult Function()? getDefaultReceipt,
    TResult Function(Branch branch)? createBranch,
    TResult Function(Branch branch)? updateBranch,
    TResult Function(Branch branch)? deleteBranch,
    required TResult orElse(),
  }) {
    if (getBranchById != null) {
      return getBranchById(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBranchById value) getBranchById,
    required TResult Function(_GetDefaultReceipt value) getDefaultReceipt,
    required TResult Function(_CreateBranch value) createBranch,
    required TResult Function(_UpdateBranch value) updateBranch,
    required TResult Function(_DeleteBranch value) deleteBranch,
  }) {
    return getBranchById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBranchById value)? getBranchById,
    TResult? Function(_GetDefaultReceipt value)? getDefaultReceipt,
    TResult? Function(_CreateBranch value)? createBranch,
    TResult? Function(_UpdateBranch value)? updateBranch,
    TResult? Function(_DeleteBranch value)? deleteBranch,
  }) {
    return getBranchById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBranchById value)? getBranchById,
    TResult Function(_GetDefaultReceipt value)? getDefaultReceipt,
    TResult Function(_CreateBranch value)? createBranch,
    TResult Function(_UpdateBranch value)? updateBranch,
    TResult Function(_DeleteBranch value)? deleteBranch,
    required TResult orElse(),
  }) {
    if (getBranchById != null) {
      return getBranchById(this);
    }
    return orElse();
  }
}

abstract class _GetBranchById implements BranchEvent {
  const factory _GetBranchById(final int id) = _$GetBranchByIdImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$GetBranchByIdImplCopyWith<_$GetBranchByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDefaultReceiptImplCopyWith<$Res> {
  factory _$$GetDefaultReceiptImplCopyWith(_$GetDefaultReceiptImpl value,
          $Res Function(_$GetDefaultReceiptImpl) then) =
      __$$GetDefaultReceiptImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetDefaultReceiptImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$GetDefaultReceiptImpl>
    implements _$$GetDefaultReceiptImplCopyWith<$Res> {
  __$$GetDefaultReceiptImplCopyWithImpl(_$GetDefaultReceiptImpl _value,
      $Res Function(_$GetDefaultReceiptImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetDefaultReceiptImpl implements _GetDefaultReceipt {
  const _$GetDefaultReceiptImpl();

  @override
  String toString() {
    return 'BranchEvent.getDefaultReceipt()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetDefaultReceiptImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getBranchById,
    required TResult Function() getDefaultReceipt,
    required TResult Function(Branch branch) createBranch,
    required TResult Function(Branch branch) updateBranch,
    required TResult Function(Branch branch) deleteBranch,
  }) {
    return getDefaultReceipt();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBranchById,
    TResult? Function()? getDefaultReceipt,
    TResult? Function(Branch branch)? createBranch,
    TResult? Function(Branch branch)? updateBranch,
    TResult? Function(Branch branch)? deleteBranch,
  }) {
    return getDefaultReceipt?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBranchById,
    TResult Function()? getDefaultReceipt,
    TResult Function(Branch branch)? createBranch,
    TResult Function(Branch branch)? updateBranch,
    TResult Function(Branch branch)? deleteBranch,
    required TResult orElse(),
  }) {
    if (getDefaultReceipt != null) {
      return getDefaultReceipt();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBranchById value) getBranchById,
    required TResult Function(_GetDefaultReceipt value) getDefaultReceipt,
    required TResult Function(_CreateBranch value) createBranch,
    required TResult Function(_UpdateBranch value) updateBranch,
    required TResult Function(_DeleteBranch value) deleteBranch,
  }) {
    return getDefaultReceipt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBranchById value)? getBranchById,
    TResult? Function(_GetDefaultReceipt value)? getDefaultReceipt,
    TResult? Function(_CreateBranch value)? createBranch,
    TResult? Function(_UpdateBranch value)? updateBranch,
    TResult? Function(_DeleteBranch value)? deleteBranch,
  }) {
    return getDefaultReceipt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBranchById value)? getBranchById,
    TResult Function(_GetDefaultReceipt value)? getDefaultReceipt,
    TResult Function(_CreateBranch value)? createBranch,
    TResult Function(_UpdateBranch value)? updateBranch,
    TResult Function(_DeleteBranch value)? deleteBranch,
    required TResult orElse(),
  }) {
    if (getDefaultReceipt != null) {
      return getDefaultReceipt(this);
    }
    return orElse();
  }
}

abstract class _GetDefaultReceipt implements BranchEvent {
  const factory _GetDefaultReceipt() = _$GetDefaultReceiptImpl;
}

/// @nodoc
abstract class _$$CreateBranchImplCopyWith<$Res> {
  factory _$$CreateBranchImplCopyWith(
          _$CreateBranchImpl value, $Res Function(_$CreateBranchImpl) then) =
      __$$CreateBranchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Branch branch});

  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class __$$CreateBranchImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$CreateBranchImpl>
    implements _$$CreateBranchImplCopyWith<$Res> {
  __$$CreateBranchImplCopyWithImpl(
      _$CreateBranchImpl _value, $Res Function(_$CreateBranchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branch = null,
  }) {
    return _then(_$CreateBranchImpl(
      null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res> get branch {
    return $BranchCopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value));
    });
  }
}

/// @nodoc

class _$CreateBranchImpl implements _CreateBranch {
  const _$CreateBranchImpl(this.branch);

  @override
  final Branch branch;

  @override
  String toString() {
    return 'BranchEvent.createBranch(branch: $branch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBranchImpl &&
            (identical(other.branch, branch) || other.branch == branch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, branch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBranchImplCopyWith<_$CreateBranchImpl> get copyWith =>
      __$$CreateBranchImplCopyWithImpl<_$CreateBranchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getBranchById,
    required TResult Function() getDefaultReceipt,
    required TResult Function(Branch branch) createBranch,
    required TResult Function(Branch branch) updateBranch,
    required TResult Function(Branch branch) deleteBranch,
  }) {
    return createBranch(branch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBranchById,
    TResult? Function()? getDefaultReceipt,
    TResult? Function(Branch branch)? createBranch,
    TResult? Function(Branch branch)? updateBranch,
    TResult? Function(Branch branch)? deleteBranch,
  }) {
    return createBranch?.call(branch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBranchById,
    TResult Function()? getDefaultReceipt,
    TResult Function(Branch branch)? createBranch,
    TResult Function(Branch branch)? updateBranch,
    TResult Function(Branch branch)? deleteBranch,
    required TResult orElse(),
  }) {
    if (createBranch != null) {
      return createBranch(branch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBranchById value) getBranchById,
    required TResult Function(_GetDefaultReceipt value) getDefaultReceipt,
    required TResult Function(_CreateBranch value) createBranch,
    required TResult Function(_UpdateBranch value) updateBranch,
    required TResult Function(_DeleteBranch value) deleteBranch,
  }) {
    return createBranch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBranchById value)? getBranchById,
    TResult? Function(_GetDefaultReceipt value)? getDefaultReceipt,
    TResult? Function(_CreateBranch value)? createBranch,
    TResult? Function(_UpdateBranch value)? updateBranch,
    TResult? Function(_DeleteBranch value)? deleteBranch,
  }) {
    return createBranch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBranchById value)? getBranchById,
    TResult Function(_GetDefaultReceipt value)? getDefaultReceipt,
    TResult Function(_CreateBranch value)? createBranch,
    TResult Function(_UpdateBranch value)? updateBranch,
    TResult Function(_DeleteBranch value)? deleteBranch,
    required TResult orElse(),
  }) {
    if (createBranch != null) {
      return createBranch(this);
    }
    return orElse();
  }
}

abstract class _CreateBranch implements BranchEvent {
  const factory _CreateBranch(final Branch branch) = _$CreateBranchImpl;

  Branch get branch;
  @JsonKey(ignore: true)
  _$$CreateBranchImplCopyWith<_$CreateBranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateBranchImplCopyWith<$Res> {
  factory _$$UpdateBranchImplCopyWith(
          _$UpdateBranchImpl value, $Res Function(_$UpdateBranchImpl) then) =
      __$$UpdateBranchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Branch branch});

  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class __$$UpdateBranchImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$UpdateBranchImpl>
    implements _$$UpdateBranchImplCopyWith<$Res> {
  __$$UpdateBranchImplCopyWithImpl(
      _$UpdateBranchImpl _value, $Res Function(_$UpdateBranchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branch = null,
  }) {
    return _then(_$UpdateBranchImpl(
      null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res> get branch {
    return $BranchCopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value));
    });
  }
}

/// @nodoc

class _$UpdateBranchImpl implements _UpdateBranch {
  const _$UpdateBranchImpl(this.branch);

  @override
  final Branch branch;

  @override
  String toString() {
    return 'BranchEvent.updateBranch(branch: $branch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateBranchImpl &&
            (identical(other.branch, branch) || other.branch == branch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, branch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateBranchImplCopyWith<_$UpdateBranchImpl> get copyWith =>
      __$$UpdateBranchImplCopyWithImpl<_$UpdateBranchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getBranchById,
    required TResult Function() getDefaultReceipt,
    required TResult Function(Branch branch) createBranch,
    required TResult Function(Branch branch) updateBranch,
    required TResult Function(Branch branch) deleteBranch,
  }) {
    return updateBranch(branch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBranchById,
    TResult? Function()? getDefaultReceipt,
    TResult? Function(Branch branch)? createBranch,
    TResult? Function(Branch branch)? updateBranch,
    TResult? Function(Branch branch)? deleteBranch,
  }) {
    return updateBranch?.call(branch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBranchById,
    TResult Function()? getDefaultReceipt,
    TResult Function(Branch branch)? createBranch,
    TResult Function(Branch branch)? updateBranch,
    TResult Function(Branch branch)? deleteBranch,
    required TResult orElse(),
  }) {
    if (updateBranch != null) {
      return updateBranch(branch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBranchById value) getBranchById,
    required TResult Function(_GetDefaultReceipt value) getDefaultReceipt,
    required TResult Function(_CreateBranch value) createBranch,
    required TResult Function(_UpdateBranch value) updateBranch,
    required TResult Function(_DeleteBranch value) deleteBranch,
  }) {
    return updateBranch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBranchById value)? getBranchById,
    TResult? Function(_GetDefaultReceipt value)? getDefaultReceipt,
    TResult? Function(_CreateBranch value)? createBranch,
    TResult? Function(_UpdateBranch value)? updateBranch,
    TResult? Function(_DeleteBranch value)? deleteBranch,
  }) {
    return updateBranch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBranchById value)? getBranchById,
    TResult Function(_GetDefaultReceipt value)? getDefaultReceipt,
    TResult Function(_CreateBranch value)? createBranch,
    TResult Function(_UpdateBranch value)? updateBranch,
    TResult Function(_DeleteBranch value)? deleteBranch,
    required TResult orElse(),
  }) {
    if (updateBranch != null) {
      return updateBranch(this);
    }
    return orElse();
  }
}

abstract class _UpdateBranch implements BranchEvent {
  const factory _UpdateBranch(final Branch branch) = _$UpdateBranchImpl;

  Branch get branch;
  @JsonKey(ignore: true)
  _$$UpdateBranchImplCopyWith<_$UpdateBranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteBranchImplCopyWith<$Res> {
  factory _$$DeleteBranchImplCopyWith(
          _$DeleteBranchImpl value, $Res Function(_$DeleteBranchImpl) then) =
      __$$DeleteBranchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Branch branch});

  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class __$$DeleteBranchImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$DeleteBranchImpl>
    implements _$$DeleteBranchImplCopyWith<$Res> {
  __$$DeleteBranchImplCopyWithImpl(
      _$DeleteBranchImpl _value, $Res Function(_$DeleteBranchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branch = null,
  }) {
    return _then(_$DeleteBranchImpl(
      null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res> get branch {
    return $BranchCopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value));
    });
  }
}

/// @nodoc

class _$DeleteBranchImpl implements _DeleteBranch {
  const _$DeleteBranchImpl(this.branch);

  @override
  final Branch branch;

  @override
  String toString() {
    return 'BranchEvent.deleteBranch(branch: $branch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBranchImpl &&
            (identical(other.branch, branch) || other.branch == branch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, branch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteBranchImplCopyWith<_$DeleteBranchImpl> get copyWith =>
      __$$DeleteBranchImplCopyWithImpl<_$DeleteBranchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getBranchById,
    required TResult Function() getDefaultReceipt,
    required TResult Function(Branch branch) createBranch,
    required TResult Function(Branch branch) updateBranch,
    required TResult Function(Branch branch) deleteBranch,
  }) {
    return deleteBranch(branch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBranchById,
    TResult? Function()? getDefaultReceipt,
    TResult? Function(Branch branch)? createBranch,
    TResult? Function(Branch branch)? updateBranch,
    TResult? Function(Branch branch)? deleteBranch,
  }) {
    return deleteBranch?.call(branch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBranchById,
    TResult Function()? getDefaultReceipt,
    TResult Function(Branch branch)? createBranch,
    TResult Function(Branch branch)? updateBranch,
    TResult Function(Branch branch)? deleteBranch,
    required TResult orElse(),
  }) {
    if (deleteBranch != null) {
      return deleteBranch(branch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBranchById value) getBranchById,
    required TResult Function(_GetDefaultReceipt value) getDefaultReceipt,
    required TResult Function(_CreateBranch value) createBranch,
    required TResult Function(_UpdateBranch value) updateBranch,
    required TResult Function(_DeleteBranch value) deleteBranch,
  }) {
    return deleteBranch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBranchById value)? getBranchById,
    TResult? Function(_GetDefaultReceipt value)? getDefaultReceipt,
    TResult? Function(_CreateBranch value)? createBranch,
    TResult? Function(_UpdateBranch value)? updateBranch,
    TResult? Function(_DeleteBranch value)? deleteBranch,
  }) {
    return deleteBranch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBranchById value)? getBranchById,
    TResult Function(_GetDefaultReceipt value)? getDefaultReceipt,
    TResult Function(_CreateBranch value)? createBranch,
    TResult Function(_UpdateBranch value)? updateBranch,
    TResult Function(_DeleteBranch value)? deleteBranch,
    required TResult orElse(),
  }) {
    if (deleteBranch != null) {
      return deleteBranch(this);
    }
    return orElse();
  }
}

abstract class _DeleteBranch implements BranchEvent {
  const factory _DeleteBranch(final Branch branch) = _$DeleteBranchImpl;

  Branch get branch;
  @JsonKey(ignore: true)
  _$$DeleteBranchImplCopyWith<_$DeleteBranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BranchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initializingNewBranch,
    required TResult Function(ReceiptTemplate template) newBranch,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? initializingNewBranch,
    TResult? Function(ReceiptTemplate template)? newBranch,
    TResult? Function()? loading,
    TResult? Function(Branch branch)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initializingNewBranch,
    TResult Function(ReceiptTemplate template)? newBranch,
    TResult Function()? loading,
    TResult Function(Branch branch)? loaded,
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
    required TResult Function(_InitializingNewBranch value)
        initializingNewBranch,
    required TResult Function(_NewBranch value) newBranch,
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
    TResult? Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult? Function(_NewBranch value)? newBranch,
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
    TResult Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult Function(_NewBranch value)? newBranch,
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
abstract class $BranchStateCopyWith<$Res> {
  factory $BranchStateCopyWith(
          BranchState value, $Res Function(BranchState) then) =
      _$BranchStateCopyWithImpl<$Res, BranchState>;
}

/// @nodoc
class _$BranchStateCopyWithImpl<$Res, $Val extends BranchState>
    implements $BranchStateCopyWith<$Res> {
  _$BranchStateCopyWithImpl(this._value, this._then);

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
    extends _$BranchStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'BranchState.initial()';
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
    required TResult Function() initializingNewBranch,
    required TResult Function(ReceiptTemplate template) newBranch,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
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
    TResult? Function()? initializingNewBranch,
    TResult? Function(ReceiptTemplate template)? newBranch,
    TResult? Function()? loading,
    TResult? Function(Branch branch)? loaded,
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
    TResult Function()? initializingNewBranch,
    TResult Function(ReceiptTemplate template)? newBranch,
    TResult Function()? loading,
    TResult Function(Branch branch)? loaded,
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
    required TResult Function(_InitializingNewBranch value)
        initializingNewBranch,
    required TResult Function(_NewBranch value) newBranch,
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
    TResult? Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult? Function(_NewBranch value)? newBranch,
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
    TResult Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult Function(_NewBranch value)? newBranch,
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

abstract class _Initial implements BranchState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$InitializingNewBranchImplCopyWith<$Res> {
  factory _$$InitializingNewBranchImplCopyWith(
          _$InitializingNewBranchImpl value,
          $Res Function(_$InitializingNewBranchImpl) then) =
      __$$InitializingNewBranchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializingNewBranchImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$InitializingNewBranchImpl>
    implements _$$InitializingNewBranchImplCopyWith<$Res> {
  __$$InitializingNewBranchImplCopyWithImpl(_$InitializingNewBranchImpl _value,
      $Res Function(_$InitializingNewBranchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializingNewBranchImpl implements _InitializingNewBranch {
  const _$InitializingNewBranchImpl();

  @override
  String toString() {
    return 'BranchState.initializingNewBranch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializingNewBranchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initializingNewBranch,
    required TResult Function(ReceiptTemplate template) newBranch,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return initializingNewBranch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? initializingNewBranch,
    TResult? Function(ReceiptTemplate template)? newBranch,
    TResult? Function()? loading,
    TResult? Function(Branch branch)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return initializingNewBranch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initializingNewBranch,
    TResult Function(ReceiptTemplate template)? newBranch,
    TResult Function()? loading,
    TResult Function(Branch branch)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initializingNewBranch != null) {
      return initializingNewBranch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InitializingNewBranch value)
        initializingNewBranch,
    required TResult Function(_NewBranch value) newBranch,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return initializingNewBranch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult? Function(_NewBranch value)? newBranch,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return initializingNewBranch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult Function(_NewBranch value)? newBranch,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initializingNewBranch != null) {
      return initializingNewBranch(this);
    }
    return orElse();
  }
}

abstract class _InitializingNewBranch implements BranchState {
  const factory _InitializingNewBranch() = _$InitializingNewBranchImpl;
}

/// @nodoc
abstract class _$$NewBranchImplCopyWith<$Res> {
  factory _$$NewBranchImplCopyWith(
          _$NewBranchImpl value, $Res Function(_$NewBranchImpl) then) =
      __$$NewBranchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReceiptTemplate template});

  $ReceiptTemplateCopyWith<$Res> get template;
}

/// @nodoc
class __$$NewBranchImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$NewBranchImpl>
    implements _$$NewBranchImplCopyWith<$Res> {
  __$$NewBranchImplCopyWithImpl(
      _$NewBranchImpl _value, $Res Function(_$NewBranchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? template = null,
  }) {
    return _then(_$NewBranchImpl(
      null == template
          ? _value.template
          : template // ignore: cast_nullable_to_non_nullable
              as ReceiptTemplate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceiptTemplateCopyWith<$Res> get template {
    return $ReceiptTemplateCopyWith<$Res>(_value.template, (value) {
      return _then(_value.copyWith(template: value));
    });
  }
}

/// @nodoc

class _$NewBranchImpl implements _NewBranch {
  const _$NewBranchImpl(this.template);

  @override
  final ReceiptTemplate template;

  @override
  String toString() {
    return 'BranchState.newBranch(template: $template)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewBranchImpl &&
            (identical(other.template, template) ||
                other.template == template));
  }

  @override
  int get hashCode => Object.hash(runtimeType, template);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewBranchImplCopyWith<_$NewBranchImpl> get copyWith =>
      __$$NewBranchImplCopyWithImpl<_$NewBranchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initializingNewBranch,
    required TResult Function(ReceiptTemplate template) newBranch,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return newBranch(template);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? initializingNewBranch,
    TResult? Function(ReceiptTemplate template)? newBranch,
    TResult? Function()? loading,
    TResult? Function(Branch branch)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return newBranch?.call(template);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initializingNewBranch,
    TResult Function(ReceiptTemplate template)? newBranch,
    TResult Function()? loading,
    TResult Function(Branch branch)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (newBranch != null) {
      return newBranch(template);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InitializingNewBranch value)
        initializingNewBranch,
    required TResult Function(_NewBranch value) newBranch,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_LoadFailed value) loadFailed,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Failure value) failure,
  }) {
    return newBranch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult? Function(_NewBranch value)? newBranch,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_LoadFailed value)? loadFailed,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Failure value)? failure,
  }) {
    return newBranch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult Function(_NewBranch value)? newBranch,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_LoadFailed value)? loadFailed,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (newBranch != null) {
      return newBranch(this);
    }
    return orElse();
  }
}

abstract class _NewBranch implements BranchState {
  const factory _NewBranch(final ReceiptTemplate template) = _$NewBranchImpl;

  ReceiptTemplate get template;
  @JsonKey(ignore: true)
  _$$NewBranchImplCopyWith<_$NewBranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'BranchState.loading()';
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
    required TResult Function() initializingNewBranch,
    required TResult Function(ReceiptTemplate template) newBranch,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
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
    TResult? Function()? initializingNewBranch,
    TResult? Function(ReceiptTemplate template)? newBranch,
    TResult? Function()? loading,
    TResult? Function(Branch branch)? loaded,
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
    TResult Function()? initializingNewBranch,
    TResult Function(ReceiptTemplate template)? newBranch,
    TResult Function()? loading,
    TResult Function(Branch branch)? loaded,
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
    required TResult Function(_InitializingNewBranch value)
        initializingNewBranch,
    required TResult Function(_NewBranch value) newBranch,
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
    TResult? Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult? Function(_NewBranch value)? newBranch,
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
    TResult Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult Function(_NewBranch value)? newBranch,
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

abstract class _Loading implements BranchState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Branch branch});

  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branch = null,
  }) {
    return _then(_$LoadedImpl(
      null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res> get branch {
    return $BranchCopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.branch);

  @override
  final Branch branch;

  @override
  String toString() {
    return 'BranchState.loaded(branch: $branch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.branch, branch) || other.branch == branch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, branch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() initializingNewBranch,
    required TResult Function(ReceiptTemplate template) newBranch,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return loaded(branch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? initializingNewBranch,
    TResult? Function(ReceiptTemplate template)? newBranch,
    TResult? Function()? loading,
    TResult? Function(Branch branch)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(branch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? initializingNewBranch,
    TResult Function(ReceiptTemplate template)? newBranch,
    TResult Function()? loading,
    TResult Function(Branch branch)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(branch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InitializingNewBranch value)
        initializingNewBranch,
    required TResult Function(_NewBranch value) newBranch,
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
    TResult? Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult? Function(_NewBranch value)? newBranch,
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
    TResult Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult Function(_NewBranch value)? newBranch,
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

abstract class _Loaded implements BranchState {
  const factory _Loaded(final Branch branch) = _$LoadedImpl;

  Branch get branch;
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
    extends _$BranchStateCopyWithImpl<$Res, _$LoadFailedImpl>
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
    return 'BranchState.loadFailed(message: $message)';
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
    required TResult Function() initializingNewBranch,
    required TResult Function(ReceiptTemplate template) newBranch,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
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
    TResult? Function()? initializingNewBranch,
    TResult? Function(ReceiptTemplate template)? newBranch,
    TResult? Function()? loading,
    TResult? Function(Branch branch)? loaded,
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
    TResult Function()? initializingNewBranch,
    TResult Function(ReceiptTemplate template)? newBranch,
    TResult Function()? loading,
    TResult Function(Branch branch)? loaded,
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
    required TResult Function(_InitializingNewBranch value)
        initializingNewBranch,
    required TResult Function(_NewBranch value) newBranch,
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
    TResult? Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult? Function(_NewBranch value)? newBranch,
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
    TResult Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult Function(_NewBranch value)? newBranch,
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

abstract class _LoadFailed implements BranchState {
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
    extends _$BranchStateCopyWithImpl<$Res, _$ProcessingImpl>
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
    return 'BranchState.processing()';
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
    required TResult Function() initializingNewBranch,
    required TResult Function(ReceiptTemplate template) newBranch,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
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
    TResult? Function()? initializingNewBranch,
    TResult? Function(ReceiptTemplate template)? newBranch,
    TResult? Function()? loading,
    TResult? Function(Branch branch)? loaded,
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
    TResult Function()? initializingNewBranch,
    TResult Function(ReceiptTemplate template)? newBranch,
    TResult Function()? loading,
    TResult Function(Branch branch)? loaded,
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
    required TResult Function(_InitializingNewBranch value)
        initializingNewBranch,
    required TResult Function(_NewBranch value) newBranch,
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
    TResult? Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult? Function(_NewBranch value)? newBranch,
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
    TResult Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult Function(_NewBranch value)? newBranch,
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

abstract class _Processing implements BranchState {
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
    extends _$BranchStateCopyWithImpl<$Res, _$SuccessImpl>
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
    return 'BranchState.success(message: $message)';
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
    required TResult Function() initializingNewBranch,
    required TResult Function(ReceiptTemplate template) newBranch,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
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
    TResult? Function()? initializingNewBranch,
    TResult? Function(ReceiptTemplate template)? newBranch,
    TResult? Function()? loading,
    TResult? Function(Branch branch)? loaded,
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
    TResult Function()? initializingNewBranch,
    TResult Function(ReceiptTemplate template)? newBranch,
    TResult Function()? loading,
    TResult Function(Branch branch)? loaded,
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
    required TResult Function(_InitializingNewBranch value)
        initializingNewBranch,
    required TResult Function(_NewBranch value) newBranch,
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
    TResult? Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult? Function(_NewBranch value)? newBranch,
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
    TResult Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult Function(_NewBranch value)? newBranch,
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

abstract class _Success implements BranchState {
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
    extends _$BranchStateCopyWithImpl<$Res, _$FailureImpl>
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
    return 'BranchState.failure(message: $message)';
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
    required TResult Function() initializingNewBranch,
    required TResult Function(ReceiptTemplate template) newBranch,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
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
    TResult? Function()? initializingNewBranch,
    TResult? Function(ReceiptTemplate template)? newBranch,
    TResult? Function()? loading,
    TResult? Function(Branch branch)? loaded,
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
    TResult Function()? initializingNewBranch,
    TResult Function(ReceiptTemplate template)? newBranch,
    TResult Function()? loading,
    TResult Function(Branch branch)? loaded,
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
    required TResult Function(_InitializingNewBranch value)
        initializingNewBranch,
    required TResult Function(_NewBranch value) newBranch,
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
    TResult? Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult? Function(_NewBranch value)? newBranch,
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
    TResult Function(_InitializingNewBranch value)? initializingNewBranch,
    TResult Function(_NewBranch value)? newBranch,
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

abstract class _Failure implements BranchState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
