// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnState {
  List<TransactionItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnStateCopyWith<ReturnState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnStateCopyWith<$Res> {
  factory $ReturnStateCopyWith(
          ReturnState value, $Res Function(ReturnState) then) =
      _$ReturnStateCopyWithImpl<$Res, ReturnState>;
  @useResult
  $Res call({List<TransactionItem> items});
}

/// @nodoc
class _$ReturnStateCopyWithImpl<$Res, $Val extends ReturnState>
    implements $ReturnStateCopyWith<$Res> {
  _$ReturnStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReturnStateImplCopyWith<$Res>
    implements $ReturnStateCopyWith<$Res> {
  factory _$$ReturnStateImplCopyWith(
          _$ReturnStateImpl value, $Res Function(_$ReturnStateImpl) then) =
      __$$ReturnStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TransactionItem> items});
}

/// @nodoc
class __$$ReturnStateImplCopyWithImpl<$Res>
    extends _$ReturnStateCopyWithImpl<$Res, _$ReturnStateImpl>
    implements _$$ReturnStateImplCopyWith<$Res> {
  __$$ReturnStateImplCopyWithImpl(
      _$ReturnStateImpl _value, $Res Function(_$ReturnStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$ReturnStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
    ));
  }
}

/// @nodoc

class _$ReturnStateImpl implements _ReturnState {
  const _$ReturnStateImpl({final List<TransactionItem> items = const []})
      : _items = items;

  final List<TransactionItem> _items;
  @override
  @JsonKey()
  List<TransactionItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ReturnState(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnStateImplCopyWith<_$ReturnStateImpl> get copyWith =>
      __$$ReturnStateImplCopyWithImpl<_$ReturnStateImpl>(this, _$identity);
}

abstract class _ReturnState implements ReturnState {
  const factory _ReturnState({final List<TransactionItem> items}) =
      _$ReturnStateImpl;

  @override
  List<TransactionItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$ReturnStateImplCopyWith<_$ReturnStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
