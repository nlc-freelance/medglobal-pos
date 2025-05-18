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
    required TResult Function(Branch branch) createBranch,
    required TResult Function(Branch branch) updateBranch,
    required TResult Function(Branch branch) deleteBranch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBranchById,
    TResult? Function(Branch branch)? createBranch,
    TResult? Function(Branch branch)? updateBranch,
    TResult? Function(Branch branch)? deleteBranch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBranchById,
    TResult Function(Branch branch)? createBranch,
    TResult Function(Branch branch)? updateBranch,
    TResult Function(Branch branch)? deleteBranch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBranchById value) getBranchById,
    required TResult Function(_CreateBranch value) createBranch,
    required TResult Function(_UpdateBranch value) updateBranch,
    required TResult Function(_DeleteBranch value) deleteBranch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBranchById value)? getBranchById,
    TResult? Function(_CreateBranch value)? createBranch,
    TResult? Function(_UpdateBranch value)? updateBranch,
    TResult? Function(_DeleteBranch value)? deleteBranch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBranchById value)? getBranchById,
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
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() submitting,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Branch branch)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? submitting,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Branch branch)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? submitting,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BranchInitial value) initial,
    required TResult Function(_BranchFetching value) loading,
    required TResult Function(_BranchLoaded value) loaded,
    required TResult Function(_BranchLoadFailed value) loadFailed,
    required TResult Function(_BranchLoading value) submitting,
    required TResult Function(_BranchSuccess value) success,
    required TResult Function(_BranchFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BranchInitial value)? initial,
    TResult? Function(_BranchFetching value)? loading,
    TResult? Function(_BranchLoaded value)? loaded,
    TResult? Function(_BranchLoadFailed value)? loadFailed,
    TResult? Function(_BranchLoading value)? submitting,
    TResult? Function(_BranchSuccess value)? success,
    TResult? Function(_BranchFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BranchInitial value)? initial,
    TResult Function(_BranchFetching value)? loading,
    TResult Function(_BranchLoaded value)? loaded,
    TResult Function(_BranchLoadFailed value)? loadFailed,
    TResult Function(_BranchLoading value)? submitting,
    TResult Function(_BranchSuccess value)? success,
    TResult Function(_BranchFailure value)? failure,
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
abstract class _$$BranchInitialImplCopyWith<$Res> {
  factory _$$BranchInitialImplCopyWith(
          _$BranchInitialImpl value, $Res Function(_$BranchInitialImpl) then) =
      __$$BranchInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BranchInitialImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$BranchInitialImpl>
    implements _$$BranchInitialImplCopyWith<$Res> {
  __$$BranchInitialImplCopyWithImpl(
      _$BranchInitialImpl _value, $Res Function(_$BranchInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BranchInitialImpl implements _BranchInitial {
  const _$BranchInitialImpl();

  @override
  String toString() {
    return 'BranchState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BranchInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() submitting,
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
    TResult? Function(Branch branch)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? submitting,
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
    TResult Function(Branch branch)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? submitting,
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
    required TResult Function(_BranchInitial value) initial,
    required TResult Function(_BranchFetching value) loading,
    required TResult Function(_BranchLoaded value) loaded,
    required TResult Function(_BranchLoadFailed value) loadFailed,
    required TResult Function(_BranchLoading value) submitting,
    required TResult Function(_BranchSuccess value) success,
    required TResult Function(_BranchFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BranchInitial value)? initial,
    TResult? Function(_BranchFetching value)? loading,
    TResult? Function(_BranchLoaded value)? loaded,
    TResult? Function(_BranchLoadFailed value)? loadFailed,
    TResult? Function(_BranchLoading value)? submitting,
    TResult? Function(_BranchSuccess value)? success,
    TResult? Function(_BranchFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BranchInitial value)? initial,
    TResult Function(_BranchFetching value)? loading,
    TResult Function(_BranchLoaded value)? loaded,
    TResult Function(_BranchLoadFailed value)? loadFailed,
    TResult Function(_BranchLoading value)? submitting,
    TResult Function(_BranchSuccess value)? success,
    TResult Function(_BranchFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _BranchInitial implements BranchState {
  const factory _BranchInitial() = _$BranchInitialImpl;
}

/// @nodoc
abstract class _$$BranchFetchingImplCopyWith<$Res> {
  factory _$$BranchFetchingImplCopyWith(_$BranchFetchingImpl value,
          $Res Function(_$BranchFetchingImpl) then) =
      __$$BranchFetchingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BranchFetchingImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$BranchFetchingImpl>
    implements _$$BranchFetchingImplCopyWith<$Res> {
  __$$BranchFetchingImplCopyWithImpl(
      _$BranchFetchingImpl _value, $Res Function(_$BranchFetchingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BranchFetchingImpl implements _BranchFetching {
  const _$BranchFetchingImpl();

  @override
  String toString() {
    return 'BranchState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BranchFetchingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() submitting,
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
    TResult? Function(Branch branch)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? submitting,
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
    TResult Function(Branch branch)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? submitting,
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
    required TResult Function(_BranchInitial value) initial,
    required TResult Function(_BranchFetching value) loading,
    required TResult Function(_BranchLoaded value) loaded,
    required TResult Function(_BranchLoadFailed value) loadFailed,
    required TResult Function(_BranchLoading value) submitting,
    required TResult Function(_BranchSuccess value) success,
    required TResult Function(_BranchFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BranchInitial value)? initial,
    TResult? Function(_BranchFetching value)? loading,
    TResult? Function(_BranchLoaded value)? loaded,
    TResult? Function(_BranchLoadFailed value)? loadFailed,
    TResult? Function(_BranchLoading value)? submitting,
    TResult? Function(_BranchSuccess value)? success,
    TResult? Function(_BranchFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BranchInitial value)? initial,
    TResult Function(_BranchFetching value)? loading,
    TResult Function(_BranchLoaded value)? loaded,
    TResult Function(_BranchLoadFailed value)? loadFailed,
    TResult Function(_BranchLoading value)? submitting,
    TResult Function(_BranchSuccess value)? success,
    TResult Function(_BranchFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _BranchFetching implements BranchState {
  const factory _BranchFetching() = _$BranchFetchingImpl;
}

/// @nodoc
abstract class _$$BranchLoadedImplCopyWith<$Res> {
  factory _$$BranchLoadedImplCopyWith(
          _$BranchLoadedImpl value, $Res Function(_$BranchLoadedImpl) then) =
      __$$BranchLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Branch branch});

  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class __$$BranchLoadedImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$BranchLoadedImpl>
    implements _$$BranchLoadedImplCopyWith<$Res> {
  __$$BranchLoadedImplCopyWithImpl(
      _$BranchLoadedImpl _value, $Res Function(_$BranchLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branch = null,
  }) {
    return _then(_$BranchLoadedImpl(
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

class _$BranchLoadedImpl implements _BranchLoaded {
  const _$BranchLoadedImpl(this.branch);

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
            other is _$BranchLoadedImpl &&
            (identical(other.branch, branch) || other.branch == branch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, branch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchLoadedImplCopyWith<_$BranchLoadedImpl> get copyWith =>
      __$$BranchLoadedImplCopyWithImpl<_$BranchLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() submitting,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return loaded(branch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Branch branch)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? submitting,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(branch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Branch branch)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? submitting,
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
    required TResult Function(_BranchInitial value) initial,
    required TResult Function(_BranchFetching value) loading,
    required TResult Function(_BranchLoaded value) loaded,
    required TResult Function(_BranchLoadFailed value) loadFailed,
    required TResult Function(_BranchLoading value) submitting,
    required TResult Function(_BranchSuccess value) success,
    required TResult Function(_BranchFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BranchInitial value)? initial,
    TResult? Function(_BranchFetching value)? loading,
    TResult? Function(_BranchLoaded value)? loaded,
    TResult? Function(_BranchLoadFailed value)? loadFailed,
    TResult? Function(_BranchLoading value)? submitting,
    TResult? Function(_BranchSuccess value)? success,
    TResult? Function(_BranchFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BranchInitial value)? initial,
    TResult Function(_BranchFetching value)? loading,
    TResult Function(_BranchLoaded value)? loaded,
    TResult Function(_BranchLoadFailed value)? loadFailed,
    TResult Function(_BranchLoading value)? submitting,
    TResult Function(_BranchSuccess value)? success,
    TResult Function(_BranchFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _BranchLoaded implements BranchState {
  const factory _BranchLoaded(final Branch branch) = _$BranchLoadedImpl;

  Branch get branch;
  @JsonKey(ignore: true)
  _$$BranchLoadedImplCopyWith<_$BranchLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BranchLoadFailedImplCopyWith<$Res> {
  factory _$$BranchLoadFailedImplCopyWith(_$BranchLoadFailedImpl value,
          $Res Function(_$BranchLoadFailedImpl) then) =
      __$$BranchLoadFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BranchLoadFailedImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$BranchLoadFailedImpl>
    implements _$$BranchLoadFailedImplCopyWith<$Res> {
  __$$BranchLoadFailedImplCopyWithImpl(_$BranchLoadFailedImpl _value,
      $Res Function(_$BranchLoadFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BranchLoadFailedImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BranchLoadFailedImpl implements _BranchLoadFailed {
  const _$BranchLoadFailedImpl(this.message);

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
            other is _$BranchLoadFailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchLoadFailedImplCopyWith<_$BranchLoadFailedImpl> get copyWith =>
      __$$BranchLoadFailedImplCopyWithImpl<_$BranchLoadFailedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() submitting,
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
    TResult? Function(Branch branch)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? submitting,
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
    TResult Function(Branch branch)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? submitting,
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
    required TResult Function(_BranchInitial value) initial,
    required TResult Function(_BranchFetching value) loading,
    required TResult Function(_BranchLoaded value) loaded,
    required TResult Function(_BranchLoadFailed value) loadFailed,
    required TResult Function(_BranchLoading value) submitting,
    required TResult Function(_BranchSuccess value) success,
    required TResult Function(_BranchFailure value) failure,
  }) {
    return loadFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BranchInitial value)? initial,
    TResult? Function(_BranchFetching value)? loading,
    TResult? Function(_BranchLoaded value)? loaded,
    TResult? Function(_BranchLoadFailed value)? loadFailed,
    TResult? Function(_BranchLoading value)? submitting,
    TResult? Function(_BranchSuccess value)? success,
    TResult? Function(_BranchFailure value)? failure,
  }) {
    return loadFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BranchInitial value)? initial,
    TResult Function(_BranchFetching value)? loading,
    TResult Function(_BranchLoaded value)? loaded,
    TResult Function(_BranchLoadFailed value)? loadFailed,
    TResult Function(_BranchLoading value)? submitting,
    TResult Function(_BranchSuccess value)? success,
    TResult Function(_BranchFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(this);
    }
    return orElse();
  }
}

abstract class _BranchLoadFailed implements BranchState {
  const factory _BranchLoadFailed(final String message) =
      _$BranchLoadFailedImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$BranchLoadFailedImplCopyWith<_$BranchLoadFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BranchLoadingImplCopyWith<$Res> {
  factory _$$BranchLoadingImplCopyWith(
          _$BranchLoadingImpl value, $Res Function(_$BranchLoadingImpl) then) =
      __$$BranchLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BranchLoadingImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$BranchLoadingImpl>
    implements _$$BranchLoadingImplCopyWith<$Res> {
  __$$BranchLoadingImplCopyWithImpl(
      _$BranchLoadingImpl _value, $Res Function(_$BranchLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BranchLoadingImpl implements _BranchLoading {
  const _$BranchLoadingImpl();

  @override
  String toString() {
    return 'BranchState.submitting()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BranchLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() submitting,
    required TResult Function(String message) success,
    required TResult Function(String message) failure,
  }) {
    return submitting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Branch branch)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? submitting,
    TResult? Function(String message)? success,
    TResult? Function(String message)? failure,
  }) {
    return submitting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Branch branch)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? submitting,
    TResult Function(String message)? success,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BranchInitial value) initial,
    required TResult Function(_BranchFetching value) loading,
    required TResult Function(_BranchLoaded value) loaded,
    required TResult Function(_BranchLoadFailed value) loadFailed,
    required TResult Function(_BranchLoading value) submitting,
    required TResult Function(_BranchSuccess value) success,
    required TResult Function(_BranchFailure value) failure,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BranchInitial value)? initial,
    TResult? Function(_BranchFetching value)? loading,
    TResult? Function(_BranchLoaded value)? loaded,
    TResult? Function(_BranchLoadFailed value)? loadFailed,
    TResult? Function(_BranchLoading value)? submitting,
    TResult? Function(_BranchSuccess value)? success,
    TResult? Function(_BranchFailure value)? failure,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BranchInitial value)? initial,
    TResult Function(_BranchFetching value)? loading,
    TResult Function(_BranchLoaded value)? loaded,
    TResult Function(_BranchLoadFailed value)? loadFailed,
    TResult Function(_BranchLoading value)? submitting,
    TResult Function(_BranchSuccess value)? success,
    TResult Function(_BranchFailure value)? failure,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(this);
    }
    return orElse();
  }
}

abstract class _BranchLoading implements BranchState {
  const factory _BranchLoading() = _$BranchLoadingImpl;
}

/// @nodoc
abstract class _$$BranchSuccessImplCopyWith<$Res> {
  factory _$$BranchSuccessImplCopyWith(
          _$BranchSuccessImpl value, $Res Function(_$BranchSuccessImpl) then) =
      __$$BranchSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BranchSuccessImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$BranchSuccessImpl>
    implements _$$BranchSuccessImplCopyWith<$Res> {
  __$$BranchSuccessImplCopyWithImpl(
      _$BranchSuccessImpl _value, $Res Function(_$BranchSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BranchSuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BranchSuccessImpl implements _BranchSuccess {
  const _$BranchSuccessImpl(this.message);

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
            other is _$BranchSuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchSuccessImplCopyWith<_$BranchSuccessImpl> get copyWith =>
      __$$BranchSuccessImplCopyWithImpl<_$BranchSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() submitting,
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
    TResult? Function(Branch branch)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? submitting,
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
    TResult Function(Branch branch)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? submitting,
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
    required TResult Function(_BranchInitial value) initial,
    required TResult Function(_BranchFetching value) loading,
    required TResult Function(_BranchLoaded value) loaded,
    required TResult Function(_BranchLoadFailed value) loadFailed,
    required TResult Function(_BranchLoading value) submitting,
    required TResult Function(_BranchSuccess value) success,
    required TResult Function(_BranchFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BranchInitial value)? initial,
    TResult? Function(_BranchFetching value)? loading,
    TResult? Function(_BranchLoaded value)? loaded,
    TResult? Function(_BranchLoadFailed value)? loadFailed,
    TResult? Function(_BranchLoading value)? submitting,
    TResult? Function(_BranchSuccess value)? success,
    TResult? Function(_BranchFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BranchInitial value)? initial,
    TResult Function(_BranchFetching value)? loading,
    TResult Function(_BranchLoaded value)? loaded,
    TResult Function(_BranchLoadFailed value)? loadFailed,
    TResult Function(_BranchLoading value)? submitting,
    TResult Function(_BranchSuccess value)? success,
    TResult Function(_BranchFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _BranchSuccess implements BranchState {
  const factory _BranchSuccess(final String message) = _$BranchSuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$BranchSuccessImplCopyWith<_$BranchSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BranchFailureImplCopyWith<$Res> {
  factory _$$BranchFailureImplCopyWith(
          _$BranchFailureImpl value, $Res Function(_$BranchFailureImpl) then) =
      __$$BranchFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BranchFailureImplCopyWithImpl<$Res>
    extends _$BranchStateCopyWithImpl<$Res, _$BranchFailureImpl>
    implements _$$BranchFailureImplCopyWith<$Res> {
  __$$BranchFailureImplCopyWithImpl(
      _$BranchFailureImpl _value, $Res Function(_$BranchFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BranchFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BranchFailureImpl implements _BranchFailure {
  const _$BranchFailureImpl(this.message);

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
            other is _$BranchFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchFailureImplCopyWith<_$BranchFailureImpl> get copyWith =>
      __$$BranchFailureImplCopyWithImpl<_$BranchFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Branch branch) loaded,
    required TResult Function(String message) loadFailed,
    required TResult Function() submitting,
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
    TResult? Function(Branch branch)? loaded,
    TResult? Function(String message)? loadFailed,
    TResult? Function()? submitting,
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
    TResult Function(Branch branch)? loaded,
    TResult Function(String message)? loadFailed,
    TResult Function()? submitting,
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
    required TResult Function(_BranchInitial value) initial,
    required TResult Function(_BranchFetching value) loading,
    required TResult Function(_BranchLoaded value) loaded,
    required TResult Function(_BranchLoadFailed value) loadFailed,
    required TResult Function(_BranchLoading value) submitting,
    required TResult Function(_BranchSuccess value) success,
    required TResult Function(_BranchFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BranchInitial value)? initial,
    TResult? Function(_BranchFetching value)? loading,
    TResult? Function(_BranchLoaded value)? loaded,
    TResult? Function(_BranchLoadFailed value)? loadFailed,
    TResult? Function(_BranchLoading value)? submitting,
    TResult? Function(_BranchSuccess value)? success,
    TResult? Function(_BranchFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BranchInitial value)? initial,
    TResult Function(_BranchFetching value)? loading,
    TResult Function(_BranchLoaded value)? loaded,
    TResult Function(_BranchLoadFailed value)? loadFailed,
    TResult Function(_BranchLoading value)? submitting,
    TResult Function(_BranchSuccess value)? success,
    TResult Function(_BranchFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _BranchFailure implements BranchState {
  const factory _BranchFailure(final String message) = _$BranchFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$BranchFailureImplCopyWith<_$BranchFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
