// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RefundFormState {
  List<RefundItem> get items => throw _privateConstructorUsedError;
  String? get reasonForRefund => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RefundFormStateCopyWith<RefundFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundFormStateCopyWith<$Res> {
  factory $RefundFormStateCopyWith(
          RefundFormState value, $Res Function(RefundFormState) then) =
      _$RefundFormStateCopyWithImpl<$Res, RefundFormState>;
  @useResult
  $Res call({List<RefundItem> items, String? reasonForRefund});
}

/// @nodoc
class _$RefundFormStateCopyWithImpl<$Res, $Val extends RefundFormState>
    implements $RefundFormStateCopyWith<$Res> {
  _$RefundFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? reasonForRefund = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RefundItem>,
      reasonForRefund: freezed == reasonForRefund
          ? _value.reasonForRefund
          : reasonForRefund // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefundFormStateImplCopyWith<$Res>
    implements $RefundFormStateCopyWith<$Res> {
  factory _$$RefundFormStateImplCopyWith(_$RefundFormStateImpl value,
          $Res Function(_$RefundFormStateImpl) then) =
      __$$RefundFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RefundItem> items, String? reasonForRefund});
}

/// @nodoc
class __$$RefundFormStateImplCopyWithImpl<$Res>
    extends _$RefundFormStateCopyWithImpl<$Res, _$RefundFormStateImpl>
    implements _$$RefundFormStateImplCopyWith<$Res> {
  __$$RefundFormStateImplCopyWithImpl(
      _$RefundFormStateImpl _value, $Res Function(_$RefundFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? reasonForRefund = freezed,
  }) {
    return _then(_$RefundFormStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<RefundItem>,
      reasonForRefund: freezed == reasonForRefund
          ? _value.reasonForRefund
          : reasonForRefund // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RefundFormStateImpl implements _RefundFormState {
  const _$RefundFormStateImpl(
      {final List<RefundItem> items = const [], this.reasonForRefund})
      : _items = items;

  final List<RefundItem> _items;
  @override
  @JsonKey()
  List<RefundItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? reasonForRefund;

  @override
  String toString() {
    return 'RefundFormState(items: $items, reasonForRefund: $reasonForRefund)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundFormStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.reasonForRefund, reasonForRefund) ||
                other.reasonForRefund == reasonForRefund));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), reasonForRefund);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundFormStateImplCopyWith<_$RefundFormStateImpl> get copyWith =>
      __$$RefundFormStateImplCopyWithImpl<_$RefundFormStateImpl>(
          this, _$identity);
}

abstract class _RefundFormState implements RefundFormState {
  const factory _RefundFormState(
      {final List<RefundItem> items,
      final String? reasonForRefund}) = _$RefundFormStateImpl;

  @override
  List<RefundItem> get items;
  @override
  String? get reasonForRefund;
  @override
  @JsonKey(ignore: true)
  _$$RefundFormStateImplCopyWith<_$RefundFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
