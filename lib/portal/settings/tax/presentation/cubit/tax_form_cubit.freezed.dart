// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaxFormState {
  int? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  double? get rate => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaxFormStateCopyWith<TaxFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxFormStateCopyWith<$Res> {
  factory $TaxFormStateCopyWith(
          TaxFormState value, $Res Function(TaxFormState) then) =
      _$TaxFormStateCopyWithImpl<$Res, TaxFormState>;
  @useResult
  $Res call({int? id, String? code, double? rate, bool isDefault});
}

/// @nodoc
class _$TaxFormStateCopyWithImpl<$Res, $Val extends TaxFormState>
    implements $TaxFormStateCopyWith<$Res> {
  _$TaxFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? rate = freezed,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxFormStateImplCopyWith<$Res>
    implements $TaxFormStateCopyWith<$Res> {
  factory _$$TaxFormStateImplCopyWith(
          _$TaxFormStateImpl value, $Res Function(_$TaxFormStateImpl) then) =
      __$$TaxFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? code, double? rate, bool isDefault});
}

/// @nodoc
class __$$TaxFormStateImplCopyWithImpl<$Res>
    extends _$TaxFormStateCopyWithImpl<$Res, _$TaxFormStateImpl>
    implements _$$TaxFormStateImplCopyWith<$Res> {
  __$$TaxFormStateImplCopyWithImpl(
      _$TaxFormStateImpl _value, $Res Function(_$TaxFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? rate = freezed,
    Object? isDefault = null,
  }) {
    return _then(_$TaxFormStateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TaxFormStateImpl implements _TaxFormState {
  const _$TaxFormStateImpl(
      {this.id, this.code, this.rate, this.isDefault = false});

  @override
  final int? id;
  @override
  final String? code;
  @override
  final double? rate;
  @override
  @JsonKey()
  final bool isDefault;

  @override
  String toString() {
    return 'TaxFormState(id: $id, code: $code, rate: $rate, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxFormStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, code, rate, isDefault);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxFormStateImplCopyWith<_$TaxFormStateImpl> get copyWith =>
      __$$TaxFormStateImplCopyWithImpl<_$TaxFormStateImpl>(this, _$identity);
}

abstract class _TaxFormState implements TaxFormState {
  const factory _TaxFormState(
      {final int? id,
      final String? code,
      final double? rate,
      final bool isDefault}) = _$TaxFormStateImpl;

  @override
  int? get id;
  @override
  String? get code;
  @override
  double? get rate;
  @override
  bool get isDefault;
  @override
  @JsonKey(ignore: true)
  _$$TaxFormStateImplCopyWith<_$TaxFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
