// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Register register) createRegister,
    required TResult Function(Register register) updateRegister,
    required TResult Function(Register register) deleteRegister,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Register register)? createRegister,
    TResult? Function(Register register)? updateRegister,
    TResult? Function(Register register)? deleteRegister,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Register register)? createRegister,
    TResult Function(Register register)? updateRegister,
    TResult Function(Register register)? deleteRegister,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateRegister value) createRegister,
    required TResult Function(_UpdateRegister value) updateRegister,
    required TResult Function(_DeleteRegister value) deleteRegister,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateRegister value)? createRegister,
    TResult? Function(_UpdateRegister value)? updateRegister,
    TResult? Function(_DeleteRegister value)? deleteRegister,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateRegister value)? createRegister,
    TResult Function(_UpdateRegister value)? updateRegister,
    TResult Function(_DeleteRegister value)? deleteRegister,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateRegisterImplCopyWith<$Res> {
  factory _$$CreateRegisterImplCopyWith(_$CreateRegisterImpl value,
          $Res Function(_$CreateRegisterImpl) then) =
      __$$CreateRegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Register register});

  $RegisterCopyWith<$Res> get register;
}

/// @nodoc
class __$$CreateRegisterImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$CreateRegisterImpl>
    implements _$$CreateRegisterImplCopyWith<$Res> {
  __$$CreateRegisterImplCopyWithImpl(
      _$CreateRegisterImpl _value, $Res Function(_$CreateRegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? register = null,
  }) {
    return _then(_$CreateRegisterImpl(
      null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as Register,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RegisterCopyWith<$Res> get register {
    return $RegisterCopyWith<$Res>(_value.register, (value) {
      return _then(_value.copyWith(register: value));
    });
  }
}

/// @nodoc

class _$CreateRegisterImpl implements _CreateRegister {
  const _$CreateRegisterImpl(this.register);

  @override
  final Register register;

  @override
  String toString() {
    return 'RegisterEvent.createRegister(register: $register)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRegisterImpl &&
            (identical(other.register, register) ||
                other.register == register));
  }

  @override
  int get hashCode => Object.hash(runtimeType, register);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRegisterImplCopyWith<_$CreateRegisterImpl> get copyWith =>
      __$$CreateRegisterImplCopyWithImpl<_$CreateRegisterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Register register) createRegister,
    required TResult Function(Register register) updateRegister,
    required TResult Function(Register register) deleteRegister,
    required TResult Function() reset,
  }) {
    return createRegister(register);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Register register)? createRegister,
    TResult? Function(Register register)? updateRegister,
    TResult? Function(Register register)? deleteRegister,
    TResult? Function()? reset,
  }) {
    return createRegister?.call(register);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Register register)? createRegister,
    TResult Function(Register register)? updateRegister,
    TResult Function(Register register)? deleteRegister,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (createRegister != null) {
      return createRegister(register);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateRegister value) createRegister,
    required TResult Function(_UpdateRegister value) updateRegister,
    required TResult Function(_DeleteRegister value) deleteRegister,
    required TResult Function(_Reset value) reset,
  }) {
    return createRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateRegister value)? createRegister,
    TResult? Function(_UpdateRegister value)? updateRegister,
    TResult? Function(_DeleteRegister value)? deleteRegister,
    TResult? Function(_Reset value)? reset,
  }) {
    return createRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateRegister value)? createRegister,
    TResult Function(_UpdateRegister value)? updateRegister,
    TResult Function(_DeleteRegister value)? deleteRegister,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (createRegister != null) {
      return createRegister(this);
    }
    return orElse();
  }
}

abstract class _CreateRegister implements RegisterEvent {
  const factory _CreateRegister(final Register register) = _$CreateRegisterImpl;

  Register get register;
  @JsonKey(ignore: true)
  _$$CreateRegisterImplCopyWith<_$CreateRegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateRegisterImplCopyWith<$Res> {
  factory _$$UpdateRegisterImplCopyWith(_$UpdateRegisterImpl value,
          $Res Function(_$UpdateRegisterImpl) then) =
      __$$UpdateRegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Register register});

  $RegisterCopyWith<$Res> get register;
}

/// @nodoc
class __$$UpdateRegisterImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$UpdateRegisterImpl>
    implements _$$UpdateRegisterImplCopyWith<$Res> {
  __$$UpdateRegisterImplCopyWithImpl(
      _$UpdateRegisterImpl _value, $Res Function(_$UpdateRegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? register = null,
  }) {
    return _then(_$UpdateRegisterImpl(
      null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as Register,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RegisterCopyWith<$Res> get register {
    return $RegisterCopyWith<$Res>(_value.register, (value) {
      return _then(_value.copyWith(register: value));
    });
  }
}

/// @nodoc

class _$UpdateRegisterImpl implements _UpdateRegister {
  const _$UpdateRegisterImpl(this.register);

  @override
  final Register register;

  @override
  String toString() {
    return 'RegisterEvent.updateRegister(register: $register)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRegisterImpl &&
            (identical(other.register, register) ||
                other.register == register));
  }

  @override
  int get hashCode => Object.hash(runtimeType, register);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRegisterImplCopyWith<_$UpdateRegisterImpl> get copyWith =>
      __$$UpdateRegisterImplCopyWithImpl<_$UpdateRegisterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Register register) createRegister,
    required TResult Function(Register register) updateRegister,
    required TResult Function(Register register) deleteRegister,
    required TResult Function() reset,
  }) {
    return updateRegister(register);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Register register)? createRegister,
    TResult? Function(Register register)? updateRegister,
    TResult? Function(Register register)? deleteRegister,
    TResult? Function()? reset,
  }) {
    return updateRegister?.call(register);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Register register)? createRegister,
    TResult Function(Register register)? updateRegister,
    TResult Function(Register register)? deleteRegister,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (updateRegister != null) {
      return updateRegister(register);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateRegister value) createRegister,
    required TResult Function(_UpdateRegister value) updateRegister,
    required TResult Function(_DeleteRegister value) deleteRegister,
    required TResult Function(_Reset value) reset,
  }) {
    return updateRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateRegister value)? createRegister,
    TResult? Function(_UpdateRegister value)? updateRegister,
    TResult? Function(_DeleteRegister value)? deleteRegister,
    TResult? Function(_Reset value)? reset,
  }) {
    return updateRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateRegister value)? createRegister,
    TResult Function(_UpdateRegister value)? updateRegister,
    TResult Function(_DeleteRegister value)? deleteRegister,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (updateRegister != null) {
      return updateRegister(this);
    }
    return orElse();
  }
}

abstract class _UpdateRegister implements RegisterEvent {
  const factory _UpdateRegister(final Register register) = _$UpdateRegisterImpl;

  Register get register;
  @JsonKey(ignore: true)
  _$$UpdateRegisterImplCopyWith<_$UpdateRegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteRegisterImplCopyWith<$Res> {
  factory _$$DeleteRegisterImplCopyWith(_$DeleteRegisterImpl value,
          $Res Function(_$DeleteRegisterImpl) then) =
      __$$DeleteRegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Register register});

  $RegisterCopyWith<$Res> get register;
}

/// @nodoc
class __$$DeleteRegisterImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$DeleteRegisterImpl>
    implements _$$DeleteRegisterImplCopyWith<$Res> {
  __$$DeleteRegisterImplCopyWithImpl(
      _$DeleteRegisterImpl _value, $Res Function(_$DeleteRegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? register = null,
  }) {
    return _then(_$DeleteRegisterImpl(
      null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as Register,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RegisterCopyWith<$Res> get register {
    return $RegisterCopyWith<$Res>(_value.register, (value) {
      return _then(_value.copyWith(register: value));
    });
  }
}

/// @nodoc

class _$DeleteRegisterImpl implements _DeleteRegister {
  const _$DeleteRegisterImpl(this.register);

  @override
  final Register register;

  @override
  String toString() {
    return 'RegisterEvent.deleteRegister(register: $register)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteRegisterImpl &&
            (identical(other.register, register) ||
                other.register == register));
  }

  @override
  int get hashCode => Object.hash(runtimeType, register);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteRegisterImplCopyWith<_$DeleteRegisterImpl> get copyWith =>
      __$$DeleteRegisterImplCopyWithImpl<_$DeleteRegisterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Register register) createRegister,
    required TResult Function(Register register) updateRegister,
    required TResult Function(Register register) deleteRegister,
    required TResult Function() reset,
  }) {
    return deleteRegister(register);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Register register)? createRegister,
    TResult? Function(Register register)? updateRegister,
    TResult? Function(Register register)? deleteRegister,
    TResult? Function()? reset,
  }) {
    return deleteRegister?.call(register);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Register register)? createRegister,
    TResult Function(Register register)? updateRegister,
    TResult Function(Register register)? deleteRegister,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (deleteRegister != null) {
      return deleteRegister(register);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateRegister value) createRegister,
    required TResult Function(_UpdateRegister value) updateRegister,
    required TResult Function(_DeleteRegister value) deleteRegister,
    required TResult Function(_Reset value) reset,
  }) {
    return deleteRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateRegister value)? createRegister,
    TResult? Function(_UpdateRegister value)? updateRegister,
    TResult? Function(_DeleteRegister value)? deleteRegister,
    TResult? Function(_Reset value)? reset,
  }) {
    return deleteRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateRegister value)? createRegister,
    TResult Function(_UpdateRegister value)? updateRegister,
    TResult Function(_DeleteRegister value)? deleteRegister,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (deleteRegister != null) {
      return deleteRegister(this);
    }
    return orElse();
  }
}

abstract class _DeleteRegister implements RegisterEvent {
  const factory _DeleteRegister(final Register register) = _$DeleteRegisterImpl;

  Register get register;
  @JsonKey(ignore: true)
  _$$DeleteRegisterImplCopyWith<_$DeleteRegisterImpl> get copyWith =>
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
    extends _$RegisterEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'RegisterEvent.reset()';
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
    required TResult Function(Register register) createRegister,
    required TResult Function(Register register) updateRegister,
    required TResult Function(Register register) deleteRegister,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Register register)? createRegister,
    TResult? Function(Register register)? updateRegister,
    TResult? Function(Register register)? deleteRegister,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Register register)? createRegister,
    TResult Function(Register register)? updateRegister,
    TResult Function(Register register)? deleteRegister,
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
    required TResult Function(_CreateRegister value) createRegister,
    required TResult Function(_UpdateRegister value) updateRegister,
    required TResult Function(_DeleteRegister value) deleteRegister,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateRegister value)? createRegister,
    TResult? Function(_UpdateRegister value)? updateRegister,
    TResult? Function(_DeleteRegister value)? deleteRegister,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateRegister value)? createRegister,
    TResult Function(_UpdateRegister value)? updateRegister,
    TResult Function(_DeleteRegister value)? deleteRegister,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements RegisterEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$RegisterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) deleted,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? deleted,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? deleted,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

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
    extends _$RegisterStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'RegisterState.initial()';
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
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) deleted,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? deleted,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(String message)? success,
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
    required TResult Function(_Processing value) processing,
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
    TResult? Function(_Processing value)? processing,
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
    TResult Function(_Processing value)? processing,
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

abstract class _Initial implements RegisterState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ProcessingImplCopyWith<$Res> {
  factory _$$ProcessingImplCopyWith(
          _$ProcessingImpl value, $Res Function(_$ProcessingImpl) then) =
      __$$ProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessingImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$ProcessingImpl>
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
    return 'RegisterState.processing()';
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
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) deleted,
    required TResult Function(String message) failure,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? deleted,
    TResult? Function(String message)? failure,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? deleted,
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
    required TResult Function(_Processing value) processing,
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_Failure value) failure,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_Failure value)? failure,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _Processing implements RegisterState {
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
    extends _$RegisterStateCopyWithImpl<$Res, _$SuccessImpl>
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
    return 'RegisterState.success(message: $message)';
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
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) deleted,
    required TResult Function(String message) failure,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? deleted,
    TResult? Function(String message)? failure,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(String message)? success,
    TResult Function(String message)? deleted,
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
    required TResult Function(_Processing value) processing,
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
    TResult? Function(_Processing value)? processing,
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
    TResult Function(_Processing value)? processing,
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

abstract class _Success implements RegisterState {
  const factory _Success(final String message) = _$SuccessImpl;

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
    extends _$RegisterStateCopyWithImpl<$Res, _$DeletedImpl>
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
    return 'RegisterState.deleted(message: $message)';
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
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) deleted,
    required TResult Function(String message) failure,
  }) {
    return deleted(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? deleted,
    TResult? Function(String message)? failure,
  }) {
    return deleted?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(String message)? success,
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
    required TResult Function(_Processing value) processing,
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
    TResult? Function(_Processing value)? processing,
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
    TResult Function(_Processing value)? processing,
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

abstract class _Deleted implements RegisterState {
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
    extends _$RegisterStateCopyWithImpl<$Res, _$FailureImpl>
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
    return 'RegisterState.failure(message: $message)';
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
    required TResult Function() processing,
    required TResult Function(String message) success,
    required TResult Function(String message) deleted,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? processing,
    TResult? Function(String message)? success,
    TResult? Function(String message)? deleted,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? processing,
    TResult Function(String message)? success,
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
    required TResult Function(_Processing value) processing,
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
    TResult? Function(_Processing value)? processing,
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
    TResult Function(_Processing value)? processing,
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

abstract class _Failure implements RegisterState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
