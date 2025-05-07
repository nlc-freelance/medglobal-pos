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
    required TResult Function(Branch1 branch) createBranch,
    required TResult Function(Branch1 branch) updateBranch,
    required TResult Function(int id) deleteBranch,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBranchById,
    TResult? Function(Branch1 branch)? createBranch,
    TResult? Function(Branch1 branch)? updateBranch,
    TResult? Function(int id)? deleteBranch,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBranchById,
    TResult Function(Branch1 branch)? createBranch,
    TResult Function(Branch1 branch)? updateBranch,
    TResult Function(int id)? deleteBranch,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBranchById value) getBranchById,
    required TResult Function(_CreateBranch value) createBranch,
    required TResult Function(_UpdateBranch value) updateBranch,
    required TResult Function(_DeleteBranch value) deleteBranch,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBranchById value)? getBranchById,
    TResult? Function(_CreateBranch value)? createBranch,
    TResult? Function(_UpdateBranch value)? updateBranch,
    TResult? Function(_DeleteBranch value)? deleteBranch,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBranchById value)? getBranchById,
    TResult Function(_CreateBranch value)? createBranch,
    TResult Function(_UpdateBranch value)? updateBranch,
    TResult Function(_DeleteBranch value)? deleteBranch,
    TResult Function(_Reset value)? reset,
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
    required TResult Function(Branch1 branch) createBranch,
    required TResult Function(Branch1 branch) updateBranch,
    required TResult Function(int id) deleteBranch,
    required TResult Function() reset,
  }) {
    return getBranchById(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBranchById,
    TResult? Function(Branch1 branch)? createBranch,
    TResult? Function(Branch1 branch)? updateBranch,
    TResult? Function(int id)? deleteBranch,
    TResult? Function()? reset,
  }) {
    return getBranchById?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBranchById,
    TResult Function(Branch1 branch)? createBranch,
    TResult Function(Branch1 branch)? updateBranch,
    TResult Function(int id)? deleteBranch,
    TResult Function()? reset,
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
    required TResult Function(_CreateBranch value) createBranch,
    required TResult Function(_UpdateBranch value) updateBranch,
    required TResult Function(_DeleteBranch value) deleteBranch,
    required TResult Function(_Reset value) reset,
  }) {
    return getBranchById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBranchById value)? getBranchById,
    TResult? Function(_CreateBranch value)? createBranch,
    TResult? Function(_UpdateBranch value)? updateBranch,
    TResult? Function(_DeleteBranch value)? deleteBranch,
    TResult? Function(_Reset value)? reset,
  }) {
    return getBranchById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBranchById value)? getBranchById,
    TResult Function(_CreateBranch value)? createBranch,
    TResult Function(_UpdateBranch value)? updateBranch,
    TResult Function(_DeleteBranch value)? deleteBranch,
    TResult Function(_Reset value)? reset,
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
abstract class _$$CreateBranchImplCopyWith<$Res> {
  factory _$$CreateBranchImplCopyWith(
          _$CreateBranchImpl value, $Res Function(_$CreateBranchImpl) then) =
      __$$CreateBranchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Branch1 branch});

  $Branch1CopyWith<$Res> get branch;
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
              as Branch1,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $Branch1CopyWith<$Res> get branch {
    return $Branch1CopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value));
    });
  }
}

/// @nodoc

class _$CreateBranchImpl implements _CreateBranch {
  const _$CreateBranchImpl(this.branch);

  @override
  final Branch1 branch;

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
    required TResult Function(Branch1 branch) createBranch,
    required TResult Function(Branch1 branch) updateBranch,
    required TResult Function(int id) deleteBranch,
    required TResult Function() reset,
  }) {
    return createBranch(branch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBranchById,
    TResult? Function(Branch1 branch)? createBranch,
    TResult? Function(Branch1 branch)? updateBranch,
    TResult? Function(int id)? deleteBranch,
    TResult? Function()? reset,
  }) {
    return createBranch?.call(branch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBranchById,
    TResult Function(Branch1 branch)? createBranch,
    TResult Function(Branch1 branch)? updateBranch,
    TResult Function(int id)? deleteBranch,
    TResult Function()? reset,
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
    required TResult Function(_CreateBranch value) createBranch,
    required TResult Function(_UpdateBranch value) updateBranch,
    required TResult Function(_DeleteBranch value) deleteBranch,
    required TResult Function(_Reset value) reset,
  }) {
    return createBranch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBranchById value)? getBranchById,
    TResult? Function(_CreateBranch value)? createBranch,
    TResult? Function(_UpdateBranch value)? updateBranch,
    TResult? Function(_DeleteBranch value)? deleteBranch,
    TResult? Function(_Reset value)? reset,
  }) {
    return createBranch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBranchById value)? getBranchById,
    TResult Function(_CreateBranch value)? createBranch,
    TResult Function(_UpdateBranch value)? updateBranch,
    TResult Function(_DeleteBranch value)? deleteBranch,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (createBranch != null) {
      return createBranch(this);
    }
    return orElse();
  }
}

abstract class _CreateBranch implements BranchEvent {
  const factory _CreateBranch(final Branch1 branch) = _$CreateBranchImpl;

  Branch1 get branch;
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
  $Res call({Branch1 branch});

  $Branch1CopyWith<$Res> get branch;
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
              as Branch1,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $Branch1CopyWith<$Res> get branch {
    return $Branch1CopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value));
    });
  }
}

/// @nodoc

class _$UpdateBranchImpl implements _UpdateBranch {
  const _$UpdateBranchImpl(this.branch);

  @override
  final Branch1 branch;

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
    required TResult Function(Branch1 branch) createBranch,
    required TResult Function(Branch1 branch) updateBranch,
    required TResult Function(int id) deleteBranch,
    required TResult Function() reset,
  }) {
    return updateBranch(branch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBranchById,
    TResult? Function(Branch1 branch)? createBranch,
    TResult? Function(Branch1 branch)? updateBranch,
    TResult? Function(int id)? deleteBranch,
    TResult? Function()? reset,
  }) {
    return updateBranch?.call(branch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBranchById,
    TResult Function(Branch1 branch)? createBranch,
    TResult Function(Branch1 branch)? updateBranch,
    TResult Function(int id)? deleteBranch,
    TResult Function()? reset,
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
    required TResult Function(_CreateBranch value) createBranch,
    required TResult Function(_UpdateBranch value) updateBranch,
    required TResult Function(_DeleteBranch value) deleteBranch,
    required TResult Function(_Reset value) reset,
  }) {
    return updateBranch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBranchById value)? getBranchById,
    TResult? Function(_CreateBranch value)? createBranch,
    TResult? Function(_UpdateBranch value)? updateBranch,
    TResult? Function(_DeleteBranch value)? deleteBranch,
    TResult? Function(_Reset value)? reset,
  }) {
    return updateBranch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBranchById value)? getBranchById,
    TResult Function(_CreateBranch value)? createBranch,
    TResult Function(_UpdateBranch value)? updateBranch,
    TResult Function(_DeleteBranch value)? deleteBranch,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (updateBranch != null) {
      return updateBranch(this);
    }
    return orElse();
  }
}

abstract class _UpdateBranch implements BranchEvent {
  const factory _UpdateBranch(final Branch1 branch) = _$UpdateBranchImpl;

  Branch1 get branch;
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
  $Res call({int id});
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
    Object? id = null,
  }) {
    return _then(_$DeleteBranchImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteBranchImpl implements _DeleteBranch {
  const _$DeleteBranchImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'BranchEvent.deleteBranch(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBranchImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteBranchImplCopyWith<_$DeleteBranchImpl> get copyWith =>
      __$$DeleteBranchImplCopyWithImpl<_$DeleteBranchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getBranchById,
    required TResult Function(Branch1 branch) createBranch,
    required TResult Function(Branch1 branch) updateBranch,
    required TResult Function(int id) deleteBranch,
    required TResult Function() reset,
  }) {
    return deleteBranch(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBranchById,
    TResult? Function(Branch1 branch)? createBranch,
    TResult? Function(Branch1 branch)? updateBranch,
    TResult? Function(int id)? deleteBranch,
    TResult? Function()? reset,
  }) {
    return deleteBranch?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBranchById,
    TResult Function(Branch1 branch)? createBranch,
    TResult Function(Branch1 branch)? updateBranch,
    TResult Function(int id)? deleteBranch,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (deleteBranch != null) {
      return deleteBranch(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBranchById value) getBranchById,
    required TResult Function(_CreateBranch value) createBranch,
    required TResult Function(_UpdateBranch value) updateBranch,
    required TResult Function(_DeleteBranch value) deleteBranch,
    required TResult Function(_Reset value) reset,
  }) {
    return deleteBranch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBranchById value)? getBranchById,
    TResult? Function(_CreateBranch value)? createBranch,
    TResult? Function(_UpdateBranch value)? updateBranch,
    TResult? Function(_DeleteBranch value)? deleteBranch,
    TResult? Function(_Reset value)? reset,
  }) {
    return deleteBranch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBranchById value)? getBranchById,
    TResult Function(_CreateBranch value)? createBranch,
    TResult Function(_UpdateBranch value)? updateBranch,
    TResult Function(_DeleteBranch value)? deleteBranch,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (deleteBranch != null) {
      return deleteBranch(this);
    }
    return orElse();
  }
}

abstract class _DeleteBranch implements BranchEvent {
  const factory _DeleteBranch(final int id) = _$DeleteBranchImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$DeleteBranchImplCopyWith<_$DeleteBranchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$BranchEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'BranchEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getBranchById,
    required TResult Function(Branch1 branch) createBranch,
    required TResult Function(Branch1 branch) updateBranch,
    required TResult Function(int id) deleteBranch,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBranchById,
    TResult? Function(Branch1 branch)? createBranch,
    TResult? Function(Branch1 branch)? updateBranch,
    TResult? Function(int id)? deleteBranch,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBranchById,
    TResult Function(Branch1 branch)? createBranch,
    TResult Function(Branch1 branch)? updateBranch,
    TResult Function(int id)? deleteBranch,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBranchById value) getBranchById,
    required TResult Function(_CreateBranch value) createBranch,
    required TResult Function(_UpdateBranch value) updateBranch,
    required TResult Function(_DeleteBranch value) deleteBranch,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBranchById value)? getBranchById,
    TResult? Function(_CreateBranch value)? createBranch,
    TResult? Function(_UpdateBranch value)? updateBranch,
    TResult? Function(_DeleteBranch value)? deleteBranch,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBranchById value)? getBranchById,
    TResult Function(_CreateBranch value)? createBranch,
    TResult Function(_UpdateBranch value)? updateBranch,
    TResult Function(_DeleteBranch value)? deleteBranch,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements BranchEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$BranchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Branch1 branch, String message) success,
    required TResult Function(String message) deleted,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Branch1 branch, String message)? success,
    TResult? Function(String message)? deleted,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Branch1 branch, String message)? success,
    TResult Function(String message)? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
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
    required TResult Function() loading,
    required TResult Function(Branch1 branch, String message) success,
    required TResult Function(String message) deleted,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Branch1 branch, String message)? success,
    TResult? Function(String message)? deleted,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Branch1 branch, String message)? success,
    TResult Function(String message)? deleted,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
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
    required TResult Function() loading,
    required TResult Function(Branch1 branch, String message) success,
    required TResult Function(String message) deleted,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Branch1 branch, String message)? success,
    TResult? Function(String message)? deleted,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Branch1 branch, String message)? success,
    TResult Function(String message)? deleted,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
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
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Branch1 branch, String message});

  $Branch1CopyWith<$Res> get branch;
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
    Object? branch = null,
    Object? message = null,
  }) {
    return _then(_$SuccessImpl(
      null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch1,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $Branch1CopyWith<$Res> get branch {
    return $Branch1CopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value));
    });
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.branch, {this.message = ''});

  @override
  final Branch1 branch;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'BranchState.success(branch: $branch, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, branch, message);

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
    required TResult Function(Branch1 branch, String message) success,
    required TResult Function(String message) deleted,
    required TResult Function(String message) failure,
  }) {
    return success(branch, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Branch1 branch, String message)? success,
    TResult? Function(String message)? deleted,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(branch, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Branch1 branch, String message)? success,
    TResult Function(String message)? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(branch, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
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
  const factory _Success(final Branch1 branch, {final String message}) =
      _$SuccessImpl;

  Branch1 get branch;
  String get message;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletedImplCopyWith<$Res> {
  factory _$$DeletedImplCopyWith(
          _$DeletedImpl value, $Res Function(_$DeletedImpl) then) =
      __$$DeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DeletedImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$DeletedImpl>
    implements _$$DeletedImplCopyWith<$Res> {
  __$$DeletedImplCopyWithImpl(
      _$DeletedImpl _value, $Res Function(_$DeletedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DeletedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeletedImpl implements _Deleted {
  const _$DeletedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'BranchState.deleted(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletedImplCopyWith<_$DeletedImpl> get copyWith =>
      __$$DeletedImplCopyWithImpl<_$DeletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Branch1 branch, String message) success,
    required TResult Function(String message) deleted,
    required TResult Function(String message) failure,
  }) {
    return deleted(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Branch1 branch, String message)? success,
    TResult? Function(String message)? deleted,
    TResult? Function(String message)? failure,
  }) {
    return deleted?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Branch1 branch, String message)? success,
    TResult Function(String message)? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted implements BranchState {
  const factory _Deleted(final String message) = _$DeletedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$DeletedImplCopyWith<_$DeletedImpl> get copyWith =>
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
    required TResult Function() loading,
    required TResult Function(Branch1 branch, String message) success,
    required TResult Function(String message) deleted,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Branch1 branch, String message)? success,
    TResult? Function(String message)? deleted,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Branch1 branch, String message)? success,
    TResult Function(String message)? deleted,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
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
