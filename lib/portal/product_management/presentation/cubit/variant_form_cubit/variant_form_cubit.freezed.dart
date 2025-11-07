// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variant_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VariantFormState {
  VariantFormModel get variant => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VariantFormStateCopyWith<VariantFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantFormStateCopyWith<$Res> {
  factory $VariantFormStateCopyWith(
          VariantFormState value, $Res Function(VariantFormState) then) =
      _$VariantFormStateCopyWithImpl<$Res, VariantFormState>;
  @useResult
  $Res call({VariantFormModel variant, bool isValid});

  $VariantFormModelCopyWith<$Res> get variant;
}

/// @nodoc
class _$VariantFormStateCopyWithImpl<$Res, $Val extends VariantFormState>
    implements $VariantFormStateCopyWith<$Res> {
  _$VariantFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      variant: null == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as VariantFormModel,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VariantFormModelCopyWith<$Res> get variant {
    return $VariantFormModelCopyWith<$Res>(_value.variant, (value) {
      return _then(_value.copyWith(variant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VariantFormStateImplCopyWith<$Res>
    implements $VariantFormStateCopyWith<$Res> {
  factory _$$VariantFormStateImplCopyWith(_$VariantFormStateImpl value,
          $Res Function(_$VariantFormStateImpl) then) =
      __$$VariantFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VariantFormModel variant, bool isValid});

  @override
  $VariantFormModelCopyWith<$Res> get variant;
}

/// @nodoc
class __$$VariantFormStateImplCopyWithImpl<$Res>
    extends _$VariantFormStateCopyWithImpl<$Res, _$VariantFormStateImpl>
    implements _$$VariantFormStateImplCopyWith<$Res> {
  __$$VariantFormStateImplCopyWithImpl(_$VariantFormStateImpl _value,
      $Res Function(_$VariantFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? isValid = null,
  }) {
    return _then(_$VariantFormStateImpl(
      variant: null == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as VariantFormModel,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VariantFormStateImpl implements _VariantFormState {
  const _$VariantFormStateImpl({required this.variant, this.isValid = true});

  @override
  final VariantFormModel variant;
  @override
  @JsonKey()
  final bool isValid;

  @override
  String toString() {
    return 'VariantFormState(variant: $variant, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantFormStateImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, variant, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantFormStateImplCopyWith<_$VariantFormStateImpl> get copyWith =>
      __$$VariantFormStateImplCopyWithImpl<_$VariantFormStateImpl>(
          this, _$identity);
}

abstract class _VariantFormState implements VariantFormState {
  const factory _VariantFormState(
      {required final VariantFormModel variant,
      final bool isValid}) = _$VariantFormStateImpl;

  @override
  VariantFormModel get variant;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$VariantFormStateImplCopyWith<_$VariantFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
