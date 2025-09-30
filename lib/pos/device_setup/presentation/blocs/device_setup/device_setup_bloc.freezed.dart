// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_setup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceSetupEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkup,
    required TResult Function(DeviceSettings settings) validate,
    required TResult Function(Register register, String? printer) bind,
    required TResult Function() rebind,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkup,
    TResult? Function(DeviceSettings settings)? validate,
    TResult? Function(Register register, String? printer)? bind,
    TResult? Function()? rebind,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkup,
    TResult Function(DeviceSettings settings)? validate,
    TResult Function(Register register, String? printer)? bind,
    TResult Function()? rebind,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckDeviceSetting value) checkup,
    required TResult Function(_ValidateDeviceBinding value) validate,
    required TResult Function(_BindDevice value) bind,
    required TResult Function(_RebindDevice value) rebind,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckDeviceSetting value)? checkup,
    TResult? Function(_ValidateDeviceBinding value)? validate,
    TResult? Function(_BindDevice value)? bind,
    TResult? Function(_RebindDevice value)? rebind,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckDeviceSetting value)? checkup,
    TResult Function(_ValidateDeviceBinding value)? validate,
    TResult Function(_BindDevice value)? bind,
    TResult Function(_RebindDevice value)? rebind,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceSetupEventCopyWith<$Res> {
  factory $DeviceSetupEventCopyWith(
          DeviceSetupEvent value, $Res Function(DeviceSetupEvent) then) =
      _$DeviceSetupEventCopyWithImpl<$Res, DeviceSetupEvent>;
}

/// @nodoc
class _$DeviceSetupEventCopyWithImpl<$Res, $Val extends DeviceSetupEvent>
    implements $DeviceSetupEventCopyWith<$Res> {
  _$DeviceSetupEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckDeviceSettingImplCopyWith<$Res> {
  factory _$$CheckDeviceSettingImplCopyWith(_$CheckDeviceSettingImpl value,
          $Res Function(_$CheckDeviceSettingImpl) then) =
      __$$CheckDeviceSettingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckDeviceSettingImplCopyWithImpl<$Res>
    extends _$DeviceSetupEventCopyWithImpl<$Res, _$CheckDeviceSettingImpl>
    implements _$$CheckDeviceSettingImplCopyWith<$Res> {
  __$$CheckDeviceSettingImplCopyWithImpl(_$CheckDeviceSettingImpl _value,
      $Res Function(_$CheckDeviceSettingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckDeviceSettingImpl implements _CheckDeviceSetting {
  const _$CheckDeviceSettingImpl();

  @override
  String toString() {
    return 'DeviceSetupEvent.checkup()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckDeviceSettingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkup,
    required TResult Function(DeviceSettings settings) validate,
    required TResult Function(Register register, String? printer) bind,
    required TResult Function() rebind,
  }) {
    return checkup();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkup,
    TResult? Function(DeviceSettings settings)? validate,
    TResult? Function(Register register, String? printer)? bind,
    TResult? Function()? rebind,
  }) {
    return checkup?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkup,
    TResult Function(DeviceSettings settings)? validate,
    TResult Function(Register register, String? printer)? bind,
    TResult Function()? rebind,
    required TResult orElse(),
  }) {
    if (checkup != null) {
      return checkup();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckDeviceSetting value) checkup,
    required TResult Function(_ValidateDeviceBinding value) validate,
    required TResult Function(_BindDevice value) bind,
    required TResult Function(_RebindDevice value) rebind,
  }) {
    return checkup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckDeviceSetting value)? checkup,
    TResult? Function(_ValidateDeviceBinding value)? validate,
    TResult? Function(_BindDevice value)? bind,
    TResult? Function(_RebindDevice value)? rebind,
  }) {
    return checkup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckDeviceSetting value)? checkup,
    TResult Function(_ValidateDeviceBinding value)? validate,
    TResult Function(_BindDevice value)? bind,
    TResult Function(_RebindDevice value)? rebind,
    required TResult orElse(),
  }) {
    if (checkup != null) {
      return checkup(this);
    }
    return orElse();
  }
}

abstract class _CheckDeviceSetting implements DeviceSetupEvent {
  const factory _CheckDeviceSetting() = _$CheckDeviceSettingImpl;
}

/// @nodoc
abstract class _$$ValidateDeviceBindingImplCopyWith<$Res> {
  factory _$$ValidateDeviceBindingImplCopyWith(
          _$ValidateDeviceBindingImpl value,
          $Res Function(_$ValidateDeviceBindingImpl) then) =
      __$$ValidateDeviceBindingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceSettings settings});

  $DeviceSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$ValidateDeviceBindingImplCopyWithImpl<$Res>
    extends _$DeviceSetupEventCopyWithImpl<$Res, _$ValidateDeviceBindingImpl>
    implements _$$ValidateDeviceBindingImplCopyWith<$Res> {
  __$$ValidateDeviceBindingImplCopyWithImpl(_$ValidateDeviceBindingImpl _value,
      $Res Function(_$ValidateDeviceBindingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
  }) {
    return _then(_$ValidateDeviceBindingImpl(
      null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as DeviceSettings,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceSettingsCopyWith<$Res> get settings {
    return $DeviceSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc

class _$ValidateDeviceBindingImpl implements _ValidateDeviceBinding {
  const _$ValidateDeviceBindingImpl(this.settings);

  @override
  final DeviceSettings settings;

  @override
  String toString() {
    return 'DeviceSetupEvent.validate(settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateDeviceBindingImpl &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateDeviceBindingImplCopyWith<_$ValidateDeviceBindingImpl>
      get copyWith => __$$ValidateDeviceBindingImplCopyWithImpl<
          _$ValidateDeviceBindingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkup,
    required TResult Function(DeviceSettings settings) validate,
    required TResult Function(Register register, String? printer) bind,
    required TResult Function() rebind,
  }) {
    return validate(settings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkup,
    TResult? Function(DeviceSettings settings)? validate,
    TResult? Function(Register register, String? printer)? bind,
    TResult? Function()? rebind,
  }) {
    return validate?.call(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkup,
    TResult Function(DeviceSettings settings)? validate,
    TResult Function(Register register, String? printer)? bind,
    TResult Function()? rebind,
    required TResult orElse(),
  }) {
    if (validate != null) {
      return validate(settings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckDeviceSetting value) checkup,
    required TResult Function(_ValidateDeviceBinding value) validate,
    required TResult Function(_BindDevice value) bind,
    required TResult Function(_RebindDevice value) rebind,
  }) {
    return validate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckDeviceSetting value)? checkup,
    TResult? Function(_ValidateDeviceBinding value)? validate,
    TResult? Function(_BindDevice value)? bind,
    TResult? Function(_RebindDevice value)? rebind,
  }) {
    return validate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckDeviceSetting value)? checkup,
    TResult Function(_ValidateDeviceBinding value)? validate,
    TResult Function(_BindDevice value)? bind,
    TResult Function(_RebindDevice value)? rebind,
    required TResult orElse(),
  }) {
    if (validate != null) {
      return validate(this);
    }
    return orElse();
  }
}

abstract class _ValidateDeviceBinding implements DeviceSetupEvent {
  const factory _ValidateDeviceBinding(final DeviceSettings settings) =
      _$ValidateDeviceBindingImpl;

  DeviceSettings get settings;
  @JsonKey(ignore: true)
  _$$ValidateDeviceBindingImplCopyWith<_$ValidateDeviceBindingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BindDeviceImplCopyWith<$Res> {
  factory _$$BindDeviceImplCopyWith(
          _$BindDeviceImpl value, $Res Function(_$BindDeviceImpl) then) =
      __$$BindDeviceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Register register, String? printer});

  $RegisterCopyWith<$Res> get register;
}

/// @nodoc
class __$$BindDeviceImplCopyWithImpl<$Res>
    extends _$DeviceSetupEventCopyWithImpl<$Res, _$BindDeviceImpl>
    implements _$$BindDeviceImplCopyWith<$Res> {
  __$$BindDeviceImplCopyWithImpl(
      _$BindDeviceImpl _value, $Res Function(_$BindDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? register = null,
    Object? printer = freezed,
  }) {
    return _then(_$BindDeviceImpl(
      null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as Register,
      printer: freezed == printer
          ? _value.printer
          : printer // ignore: cast_nullable_to_non_nullable
              as String?,
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

class _$BindDeviceImpl implements _BindDevice {
  const _$BindDeviceImpl(this.register, {this.printer});

  @override
  final Register register;
  @override
  final String? printer;

  @override
  String toString() {
    return 'DeviceSetupEvent.bind(register: $register, printer: $printer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BindDeviceImpl &&
            (identical(other.register, register) ||
                other.register == register) &&
            (identical(other.printer, printer) || other.printer == printer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, register, printer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BindDeviceImplCopyWith<_$BindDeviceImpl> get copyWith =>
      __$$BindDeviceImplCopyWithImpl<_$BindDeviceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkup,
    required TResult Function(DeviceSettings settings) validate,
    required TResult Function(Register register, String? printer) bind,
    required TResult Function() rebind,
  }) {
    return bind(register, printer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkup,
    TResult? Function(DeviceSettings settings)? validate,
    TResult? Function(Register register, String? printer)? bind,
    TResult? Function()? rebind,
  }) {
    return bind?.call(register, printer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkup,
    TResult Function(DeviceSettings settings)? validate,
    TResult Function(Register register, String? printer)? bind,
    TResult Function()? rebind,
    required TResult orElse(),
  }) {
    if (bind != null) {
      return bind(register, printer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckDeviceSetting value) checkup,
    required TResult Function(_ValidateDeviceBinding value) validate,
    required TResult Function(_BindDevice value) bind,
    required TResult Function(_RebindDevice value) rebind,
  }) {
    return bind(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckDeviceSetting value)? checkup,
    TResult? Function(_ValidateDeviceBinding value)? validate,
    TResult? Function(_BindDevice value)? bind,
    TResult? Function(_RebindDevice value)? rebind,
  }) {
    return bind?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckDeviceSetting value)? checkup,
    TResult Function(_ValidateDeviceBinding value)? validate,
    TResult Function(_BindDevice value)? bind,
    TResult Function(_RebindDevice value)? rebind,
    required TResult orElse(),
  }) {
    if (bind != null) {
      return bind(this);
    }
    return orElse();
  }
}

abstract class _BindDevice implements DeviceSetupEvent {
  const factory _BindDevice(final Register register, {final String? printer}) =
      _$BindDeviceImpl;

  Register get register;
  String? get printer;
  @JsonKey(ignore: true)
  _$$BindDeviceImplCopyWith<_$BindDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RebindDeviceImplCopyWith<$Res> {
  factory _$$RebindDeviceImplCopyWith(
          _$RebindDeviceImpl value, $Res Function(_$RebindDeviceImpl) then) =
      __$$RebindDeviceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RebindDeviceImplCopyWithImpl<$Res>
    extends _$DeviceSetupEventCopyWithImpl<$Res, _$RebindDeviceImpl>
    implements _$$RebindDeviceImplCopyWith<$Res> {
  __$$RebindDeviceImplCopyWithImpl(
      _$RebindDeviceImpl _value, $Res Function(_$RebindDeviceImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RebindDeviceImpl implements _RebindDevice {
  const _$RebindDeviceImpl();

  @override
  String toString() {
    return 'DeviceSetupEvent.rebind()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RebindDeviceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkup,
    required TResult Function(DeviceSettings settings) validate,
    required TResult Function(Register register, String? printer) bind,
    required TResult Function() rebind,
  }) {
    return rebind();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkup,
    TResult? Function(DeviceSettings settings)? validate,
    TResult? Function(Register register, String? printer)? bind,
    TResult? Function()? rebind,
  }) {
    return rebind?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkup,
    TResult Function(DeviceSettings settings)? validate,
    TResult Function(Register register, String? printer)? bind,
    TResult Function()? rebind,
    required TResult orElse(),
  }) {
    if (rebind != null) {
      return rebind();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckDeviceSetting value) checkup,
    required TResult Function(_ValidateDeviceBinding value) validate,
    required TResult Function(_BindDevice value) bind,
    required TResult Function(_RebindDevice value) rebind,
  }) {
    return rebind(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckDeviceSetting value)? checkup,
    TResult? Function(_ValidateDeviceBinding value)? validate,
    TResult? Function(_BindDevice value)? bind,
    TResult? Function(_RebindDevice value)? rebind,
  }) {
    return rebind?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckDeviceSetting value)? checkup,
    TResult Function(_ValidateDeviceBinding value)? validate,
    TResult Function(_BindDevice value)? bind,
    TResult Function(_RebindDevice value)? rebind,
    required TResult orElse(),
  }) {
    if (rebind != null) {
      return rebind(this);
    }
    return orElse();
  }
}

abstract class _RebindDevice implements DeviceSetupEvent {
  const factory _RebindDevice() = _$RebindDeviceImpl;
}

/// @nodoc
mixin _$DeviceSetupState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unready,
    required TResult Function(DeviceSettings settings) ready,
    required TResult Function(DateTime now) deactivated,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unready,
    TResult? Function(DeviceSettings settings)? ready,
    TResult? Function(DateTime now)? deactivated,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unready,
    TResult Function(DeviceSettings settings)? ready,
    TResult Function(DateTime now)? deactivated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DeviceSetupInProgress value) loading,
    required TResult Function(_DeviceUnready value) unready,
    required TResult Function(_DeviceReady value) ready,
    required TResult Function(_DeviceDeactivated value) deactivated,
    required TResult Function(_DeviceSetupFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DeviceSetupInProgress value)? loading,
    TResult? Function(_DeviceUnready value)? unready,
    TResult? Function(_DeviceReady value)? ready,
    TResult? Function(_DeviceDeactivated value)? deactivated,
    TResult? Function(_DeviceSetupFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DeviceSetupInProgress value)? loading,
    TResult Function(_DeviceUnready value)? unready,
    TResult Function(_DeviceReady value)? ready,
    TResult Function(_DeviceDeactivated value)? deactivated,
    TResult Function(_DeviceSetupFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceSetupStateCopyWith<$Res> {
  factory $DeviceSetupStateCopyWith(
          DeviceSetupState value, $Res Function(DeviceSetupState) then) =
      _$DeviceSetupStateCopyWithImpl<$Res, DeviceSetupState>;
}

/// @nodoc
class _$DeviceSetupStateCopyWithImpl<$Res, $Val extends DeviceSetupState>
    implements $DeviceSetupStateCopyWith<$Res> {
  _$DeviceSetupStateCopyWithImpl(this._value, this._then);

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
    extends _$DeviceSetupStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'DeviceSetupState.initial()';
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
    required TResult Function() unready,
    required TResult Function(DeviceSettings settings) ready,
    required TResult Function(DateTime now) deactivated,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unready,
    TResult? Function(DeviceSettings settings)? ready,
    TResult? Function(DateTime now)? deactivated,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unready,
    TResult Function(DeviceSettings settings)? ready,
    TResult Function(DateTime now)? deactivated,
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
    required TResult Function(_DeviceSetupInProgress value) loading,
    required TResult Function(_DeviceUnready value) unready,
    required TResult Function(_DeviceReady value) ready,
    required TResult Function(_DeviceDeactivated value) deactivated,
    required TResult Function(_DeviceSetupFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DeviceSetupInProgress value)? loading,
    TResult? Function(_DeviceUnready value)? unready,
    TResult? Function(_DeviceReady value)? ready,
    TResult? Function(_DeviceDeactivated value)? deactivated,
    TResult? Function(_DeviceSetupFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DeviceSetupInProgress value)? loading,
    TResult Function(_DeviceUnready value)? unready,
    TResult Function(_DeviceReady value)? ready,
    TResult Function(_DeviceDeactivated value)? deactivated,
    TResult Function(_DeviceSetupFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DeviceSetupState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$DeviceSetupInProgressImplCopyWith<$Res> {
  factory _$$DeviceSetupInProgressImplCopyWith(
          _$DeviceSetupInProgressImpl value,
          $Res Function(_$DeviceSetupInProgressImpl) then) =
      __$$DeviceSetupInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeviceSetupInProgressImplCopyWithImpl<$Res>
    extends _$DeviceSetupStateCopyWithImpl<$Res, _$DeviceSetupInProgressImpl>
    implements _$$DeviceSetupInProgressImplCopyWith<$Res> {
  __$$DeviceSetupInProgressImplCopyWithImpl(_$DeviceSetupInProgressImpl _value,
      $Res Function(_$DeviceSetupInProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeviceSetupInProgressImpl implements _DeviceSetupInProgress {
  const _$DeviceSetupInProgressImpl();

  @override
  String toString() {
    return 'DeviceSetupState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceSetupInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unready,
    required TResult Function(DeviceSettings settings) ready,
    required TResult Function(DateTime now) deactivated,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unready,
    TResult? Function(DeviceSettings settings)? ready,
    TResult? Function(DateTime now)? deactivated,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unready,
    TResult Function(DeviceSettings settings)? ready,
    TResult Function(DateTime now)? deactivated,
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
    required TResult Function(_DeviceSetupInProgress value) loading,
    required TResult Function(_DeviceUnready value) unready,
    required TResult Function(_DeviceReady value) ready,
    required TResult Function(_DeviceDeactivated value) deactivated,
    required TResult Function(_DeviceSetupFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DeviceSetupInProgress value)? loading,
    TResult? Function(_DeviceUnready value)? unready,
    TResult? Function(_DeviceReady value)? ready,
    TResult? Function(_DeviceDeactivated value)? deactivated,
    TResult? Function(_DeviceSetupFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DeviceSetupInProgress value)? loading,
    TResult Function(_DeviceUnready value)? unready,
    TResult Function(_DeviceReady value)? ready,
    TResult Function(_DeviceDeactivated value)? deactivated,
    TResult Function(_DeviceSetupFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _DeviceSetupInProgress implements DeviceSetupState {
  const factory _DeviceSetupInProgress() = _$DeviceSetupInProgressImpl;
}

/// @nodoc
abstract class _$$DeviceUnreadyImplCopyWith<$Res> {
  factory _$$DeviceUnreadyImplCopyWith(
          _$DeviceUnreadyImpl value, $Res Function(_$DeviceUnreadyImpl) then) =
      __$$DeviceUnreadyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeviceUnreadyImplCopyWithImpl<$Res>
    extends _$DeviceSetupStateCopyWithImpl<$Res, _$DeviceUnreadyImpl>
    implements _$$DeviceUnreadyImplCopyWith<$Res> {
  __$$DeviceUnreadyImplCopyWithImpl(
      _$DeviceUnreadyImpl _value, $Res Function(_$DeviceUnreadyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeviceUnreadyImpl implements _DeviceUnready {
  const _$DeviceUnreadyImpl();

  @override
  String toString() {
    return 'DeviceSetupState.unready()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeviceUnreadyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unready,
    required TResult Function(DeviceSettings settings) ready,
    required TResult Function(DateTime now) deactivated,
    required TResult Function(String message) failure,
  }) {
    return unready();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unready,
    TResult? Function(DeviceSettings settings)? ready,
    TResult? Function(DateTime now)? deactivated,
    TResult? Function(String message)? failure,
  }) {
    return unready?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unready,
    TResult Function(DeviceSettings settings)? ready,
    TResult Function(DateTime now)? deactivated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (unready != null) {
      return unready();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DeviceSetupInProgress value) loading,
    required TResult Function(_DeviceUnready value) unready,
    required TResult Function(_DeviceReady value) ready,
    required TResult Function(_DeviceDeactivated value) deactivated,
    required TResult Function(_DeviceSetupFailure value) failure,
  }) {
    return unready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DeviceSetupInProgress value)? loading,
    TResult? Function(_DeviceUnready value)? unready,
    TResult? Function(_DeviceReady value)? ready,
    TResult? Function(_DeviceDeactivated value)? deactivated,
    TResult? Function(_DeviceSetupFailure value)? failure,
  }) {
    return unready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DeviceSetupInProgress value)? loading,
    TResult Function(_DeviceUnready value)? unready,
    TResult Function(_DeviceReady value)? ready,
    TResult Function(_DeviceDeactivated value)? deactivated,
    TResult Function(_DeviceSetupFailure value)? failure,
    required TResult orElse(),
  }) {
    if (unready != null) {
      return unready(this);
    }
    return orElse();
  }
}

abstract class _DeviceUnready implements DeviceSetupState {
  const factory _DeviceUnready() = _$DeviceUnreadyImpl;
}

/// @nodoc
abstract class _$$DeviceReadyImplCopyWith<$Res> {
  factory _$$DeviceReadyImplCopyWith(
          _$DeviceReadyImpl value, $Res Function(_$DeviceReadyImpl) then) =
      __$$DeviceReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeviceSettings settings});

  $DeviceSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$DeviceReadyImplCopyWithImpl<$Res>
    extends _$DeviceSetupStateCopyWithImpl<$Res, _$DeviceReadyImpl>
    implements _$$DeviceReadyImplCopyWith<$Res> {
  __$$DeviceReadyImplCopyWithImpl(
      _$DeviceReadyImpl _value, $Res Function(_$DeviceReadyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
  }) {
    return _then(_$DeviceReadyImpl(
      null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as DeviceSettings,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceSettingsCopyWith<$Res> get settings {
    return $DeviceSettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc

class _$DeviceReadyImpl implements _DeviceReady {
  const _$DeviceReadyImpl(this.settings);

  @override
  final DeviceSettings settings;

  @override
  String toString() {
    return 'DeviceSetupState.ready(settings: $settings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceReadyImpl &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceReadyImplCopyWith<_$DeviceReadyImpl> get copyWith =>
      __$$DeviceReadyImplCopyWithImpl<_$DeviceReadyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unready,
    required TResult Function(DeviceSettings settings) ready,
    required TResult Function(DateTime now) deactivated,
    required TResult Function(String message) failure,
  }) {
    return ready(settings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unready,
    TResult? Function(DeviceSettings settings)? ready,
    TResult? Function(DateTime now)? deactivated,
    TResult? Function(String message)? failure,
  }) {
    return ready?.call(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unready,
    TResult Function(DeviceSettings settings)? ready,
    TResult Function(DateTime now)? deactivated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(settings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DeviceSetupInProgress value) loading,
    required TResult Function(_DeviceUnready value) unready,
    required TResult Function(_DeviceReady value) ready,
    required TResult Function(_DeviceDeactivated value) deactivated,
    required TResult Function(_DeviceSetupFailure value) failure,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DeviceSetupInProgress value)? loading,
    TResult? Function(_DeviceUnready value)? unready,
    TResult? Function(_DeviceReady value)? ready,
    TResult? Function(_DeviceDeactivated value)? deactivated,
    TResult? Function(_DeviceSetupFailure value)? failure,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DeviceSetupInProgress value)? loading,
    TResult Function(_DeviceUnready value)? unready,
    TResult Function(_DeviceReady value)? ready,
    TResult Function(_DeviceDeactivated value)? deactivated,
    TResult Function(_DeviceSetupFailure value)? failure,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _DeviceReady implements DeviceSetupState {
  const factory _DeviceReady(final DeviceSettings settings) = _$DeviceReadyImpl;

  DeviceSettings get settings;
  @JsonKey(ignore: true)
  _$$DeviceReadyImplCopyWith<_$DeviceReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceDeactivatedImplCopyWith<$Res> {
  factory _$$DeviceDeactivatedImplCopyWith(_$DeviceDeactivatedImpl value,
          $Res Function(_$DeviceDeactivatedImpl) then) =
      __$$DeviceDeactivatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime now});
}

/// @nodoc
class __$$DeviceDeactivatedImplCopyWithImpl<$Res>
    extends _$DeviceSetupStateCopyWithImpl<$Res, _$DeviceDeactivatedImpl>
    implements _$$DeviceDeactivatedImplCopyWith<$Res> {
  __$$DeviceDeactivatedImplCopyWithImpl(_$DeviceDeactivatedImpl _value,
      $Res Function(_$DeviceDeactivatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? now = null,
  }) {
    return _then(_$DeviceDeactivatedImpl(
      null == now
          ? _value.now
          : now // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DeviceDeactivatedImpl implements _DeviceDeactivated {
  const _$DeviceDeactivatedImpl(this.now);

  @override
  final DateTime now;

  @override
  String toString() {
    return 'DeviceSetupState.deactivated(now: $now)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceDeactivatedImpl &&
            (identical(other.now, now) || other.now == now));
  }

  @override
  int get hashCode => Object.hash(runtimeType, now);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceDeactivatedImplCopyWith<_$DeviceDeactivatedImpl> get copyWith =>
      __$$DeviceDeactivatedImplCopyWithImpl<_$DeviceDeactivatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unready,
    required TResult Function(DeviceSettings settings) ready,
    required TResult Function(DateTime now) deactivated,
    required TResult Function(String message) failure,
  }) {
    return deactivated(now);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unready,
    TResult? Function(DeviceSettings settings)? ready,
    TResult? Function(DateTime now)? deactivated,
    TResult? Function(String message)? failure,
  }) {
    return deactivated?.call(now);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unready,
    TResult Function(DeviceSettings settings)? ready,
    TResult Function(DateTime now)? deactivated,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (deactivated != null) {
      return deactivated(now);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DeviceSetupInProgress value) loading,
    required TResult Function(_DeviceUnready value) unready,
    required TResult Function(_DeviceReady value) ready,
    required TResult Function(_DeviceDeactivated value) deactivated,
    required TResult Function(_DeviceSetupFailure value) failure,
  }) {
    return deactivated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DeviceSetupInProgress value)? loading,
    TResult? Function(_DeviceUnready value)? unready,
    TResult? Function(_DeviceReady value)? ready,
    TResult? Function(_DeviceDeactivated value)? deactivated,
    TResult? Function(_DeviceSetupFailure value)? failure,
  }) {
    return deactivated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DeviceSetupInProgress value)? loading,
    TResult Function(_DeviceUnready value)? unready,
    TResult Function(_DeviceReady value)? ready,
    TResult Function(_DeviceDeactivated value)? deactivated,
    TResult Function(_DeviceSetupFailure value)? failure,
    required TResult orElse(),
  }) {
    if (deactivated != null) {
      return deactivated(this);
    }
    return orElse();
  }
}

abstract class _DeviceDeactivated implements DeviceSetupState {
  const factory _DeviceDeactivated(final DateTime now) =
      _$DeviceDeactivatedImpl;

  DateTime get now;
  @JsonKey(ignore: true)
  _$$DeviceDeactivatedImplCopyWith<_$DeviceDeactivatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeviceSetupFailureImplCopyWith<$Res> {
  factory _$$DeviceSetupFailureImplCopyWith(_$DeviceSetupFailureImpl value,
          $Res Function(_$DeviceSetupFailureImpl) then) =
      __$$DeviceSetupFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DeviceSetupFailureImplCopyWithImpl<$Res>
    extends _$DeviceSetupStateCopyWithImpl<$Res, _$DeviceSetupFailureImpl>
    implements _$$DeviceSetupFailureImplCopyWith<$Res> {
  __$$DeviceSetupFailureImplCopyWithImpl(_$DeviceSetupFailureImpl _value,
      $Res Function(_$DeviceSetupFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DeviceSetupFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeviceSetupFailureImpl implements _DeviceSetupFailure {
  const _$DeviceSetupFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DeviceSetupState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceSetupFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceSetupFailureImplCopyWith<_$DeviceSetupFailureImpl> get copyWith =>
      __$$DeviceSetupFailureImplCopyWithImpl<_$DeviceSetupFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() unready,
    required TResult Function(DeviceSettings settings) ready,
    required TResult Function(DateTime now) deactivated,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? unready,
    TResult? Function(DeviceSettings settings)? ready,
    TResult? Function(DateTime now)? deactivated,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? unready,
    TResult Function(DeviceSettings settings)? ready,
    TResult Function(DateTime now)? deactivated,
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
    required TResult Function(_DeviceSetupInProgress value) loading,
    required TResult Function(_DeviceUnready value) unready,
    required TResult Function(_DeviceReady value) ready,
    required TResult Function(_DeviceDeactivated value) deactivated,
    required TResult Function(_DeviceSetupFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DeviceSetupInProgress value)? loading,
    TResult? Function(_DeviceUnready value)? unready,
    TResult? Function(_DeviceReady value)? ready,
    TResult? Function(_DeviceDeactivated value)? deactivated,
    TResult? Function(_DeviceSetupFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DeviceSetupInProgress value)? loading,
    TResult Function(_DeviceUnready value)? unready,
    TResult Function(_DeviceReady value)? ready,
    TResult Function(_DeviceDeactivated value)? deactivated,
    TResult Function(_DeviceSetupFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _DeviceSetupFailure implements DeviceSetupState {
  const factory _DeviceSetupFailure(final String message) =
      _$DeviceSetupFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$DeviceSetupFailureImplCopyWith<_$DeviceSetupFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
