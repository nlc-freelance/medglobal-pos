// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceSettings {
  RegisterPartial get register => throw _privateConstructorUsedError;
  BranchPartial get branch => throw _privateConstructorUsedError;
  ReceiptConfiguration? get receiptConfig => throw _privateConstructorUsedError;
  String? get printer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceSettingsCopyWith<DeviceSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceSettingsCopyWith<$Res> {
  factory $DeviceSettingsCopyWith(
          DeviceSettings value, $Res Function(DeviceSettings) then) =
      _$DeviceSettingsCopyWithImpl<$Res, DeviceSettings>;
  @useResult
  $Res call(
      {RegisterPartial register,
      BranchPartial branch,
      ReceiptConfiguration? receiptConfig,
      String? printer});

  $RegisterPartialCopyWith<$Res> get register;
  $BranchPartialCopyWith<$Res> get branch;
  $ReceiptConfigurationCopyWith<$Res>? get receiptConfig;
}

/// @nodoc
class _$DeviceSettingsCopyWithImpl<$Res, $Val extends DeviceSettings>
    implements $DeviceSettingsCopyWith<$Res> {
  _$DeviceSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? register = null,
    Object? branch = null,
    Object? receiptConfig = freezed,
    Object? printer = freezed,
  }) {
    return _then(_value.copyWith(
      register: null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as RegisterPartial,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as BranchPartial,
      receiptConfig: freezed == receiptConfig
          ? _value.receiptConfig
          : receiptConfig // ignore: cast_nullable_to_non_nullable
              as ReceiptConfiguration?,
      printer: freezed == printer
          ? _value.printer
          : printer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RegisterPartialCopyWith<$Res> get register {
    return $RegisterPartialCopyWith<$Res>(_value.register, (value) {
      return _then(_value.copyWith(register: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchPartialCopyWith<$Res> get branch {
    return $BranchPartialCopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceiptConfigurationCopyWith<$Res>? get receiptConfig {
    if (_value.receiptConfig == null) {
      return null;
    }

    return $ReceiptConfigurationCopyWith<$Res>(_value.receiptConfig!, (value) {
      return _then(_value.copyWith(receiptConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeviceSettingsImplCopyWith<$Res>
    implements $DeviceSettingsCopyWith<$Res> {
  factory _$$DeviceSettingsImplCopyWith(_$DeviceSettingsImpl value,
          $Res Function(_$DeviceSettingsImpl) then) =
      __$$DeviceSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RegisterPartial register,
      BranchPartial branch,
      ReceiptConfiguration? receiptConfig,
      String? printer});

  @override
  $RegisterPartialCopyWith<$Res> get register;
  @override
  $BranchPartialCopyWith<$Res> get branch;
  @override
  $ReceiptConfigurationCopyWith<$Res>? get receiptConfig;
}

/// @nodoc
class __$$DeviceSettingsImplCopyWithImpl<$Res>
    extends _$DeviceSettingsCopyWithImpl<$Res, _$DeviceSettingsImpl>
    implements _$$DeviceSettingsImplCopyWith<$Res> {
  __$$DeviceSettingsImplCopyWithImpl(
      _$DeviceSettingsImpl _value, $Res Function(_$DeviceSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? register = null,
    Object? branch = null,
    Object? receiptConfig = freezed,
    Object? printer = freezed,
  }) {
    return _then(_$DeviceSettingsImpl(
      register: null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as RegisterPartial,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as BranchPartial,
      receiptConfig: freezed == receiptConfig
          ? _value.receiptConfig
          : receiptConfig // ignore: cast_nullable_to_non_nullable
              as ReceiptConfiguration?,
      printer: freezed == printer
          ? _value.printer
          : printer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DeviceSettingsImpl implements _DeviceSettings {
  const _$DeviceSettingsImpl(
      {required this.register,
      required this.branch,
      required this.receiptConfig,
      this.printer});

  @override
  final RegisterPartial register;
  @override
  final BranchPartial branch;
  @override
  final ReceiptConfiguration? receiptConfig;
  @override
  final String? printer;

  @override
  String toString() {
    return 'DeviceSettings(register: $register, branch: $branch, receiptConfig: $receiptConfig, printer: $printer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceSettingsImpl &&
            (identical(other.register, register) ||
                other.register == register) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.receiptConfig, receiptConfig) ||
                other.receiptConfig == receiptConfig) &&
            (identical(other.printer, printer) || other.printer == printer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, register, branch, receiptConfig, printer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceSettingsImplCopyWith<_$DeviceSettingsImpl> get copyWith =>
      __$$DeviceSettingsImplCopyWithImpl<_$DeviceSettingsImpl>(
          this, _$identity);
}

abstract class _DeviceSettings implements DeviceSettings {
  const factory _DeviceSettings(
      {required final RegisterPartial register,
      required final BranchPartial branch,
      required final ReceiptConfiguration? receiptConfig,
      final String? printer}) = _$DeviceSettingsImpl;

  @override
  RegisterPartial get register;
  @override
  BranchPartial get branch;
  @override
  ReceiptConfiguration? get receiptConfig;
  @override
  String? get printer;
  @override
  @JsonKey(ignore: true)
  _$$DeviceSettingsImplCopyWith<_$DeviceSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
