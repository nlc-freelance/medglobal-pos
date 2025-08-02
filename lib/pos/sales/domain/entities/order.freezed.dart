// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Order {
  RegisterPartial get register => throw _privateConstructorUsedError;
  BranchPartial get branch => throw _privateConstructorUsedError;
  EmployeePartial get employee => throw _privateConstructorUsedError;

  /// Items added in cart
  List<OrderItem> get items => throw _privateConstructorUsedError;

  /// Total amount due
// @Default(0.0) double total,
  /// Amount customer gave as payment
  double get amountPaid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {RegisterPartial register,
      BranchPartial branch,
      EmployeePartial employee,
      List<OrderItem> items,
      double amountPaid});

  $RegisterPartialCopyWith<$Res> get register;
  $BranchPartialCopyWith<$Res> get branch;
  $EmployeePartialCopyWith<$Res> get employee;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? register = null,
    Object? branch = null,
    Object? employee = null,
    Object? items = null,
    Object? amountPaid = null,
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
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as EmployeePartial,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
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
  $EmployeePartialCopyWith<$Res> get employee {
    return $EmployeePartialCopyWith<$Res>(_value.employee, (value) {
      return _then(_value.copyWith(employee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RegisterPartial register,
      BranchPartial branch,
      EmployeePartial employee,
      List<OrderItem> items,
      double amountPaid});

  @override
  $RegisterPartialCopyWith<$Res> get register;
  @override
  $BranchPartialCopyWith<$Res> get branch;
  @override
  $EmployeePartialCopyWith<$Res> get employee;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? register = null,
    Object? branch = null,
    Object? employee = null,
    Object? items = null,
    Object? amountPaid = null,
  }) {
    return _then(_$OrderImpl(
      register: null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as RegisterPartial,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as BranchPartial,
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as EmployeePartial,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.register,
      required this.branch,
      required this.employee,
      final List<OrderItem> items = const [],
      required this.amountPaid})
      : _items = items;

  @override
  final RegisterPartial register;
  @override
  final BranchPartial branch;
  @override
  final EmployeePartial employee;

  /// Items added in cart
  final List<OrderItem> _items;

  /// Items added in cart
  @override
  @JsonKey()
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Total amount due
// @Default(0.0) double total,
  /// Amount customer gave as payment
  @override
  final double amountPaid;

  @override
  String toString() {
    return 'Order(register: $register, branch: $branch, employee: $employee, items: $items, amountPaid: $amountPaid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.register, register) ||
                other.register == register) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.employee, employee) ||
                other.employee == employee) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, register, branch, employee,
      const DeepCollectionEquality().hash(_items), amountPaid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);
}

abstract class _Order implements Order {
  const factory _Order(
      {required final RegisterPartial register,
      required final BranchPartial branch,
      required final EmployeePartial employee,
      final List<OrderItem> items,
      required final double amountPaid}) = _$OrderImpl;

  @override
  RegisterPartial get register;
  @override
  BranchPartial get branch;
  @override
  EmployeePartial get employee;
  @override

  /// Items added in cart
  List<OrderItem> get items;
  @override

  /// Total amount due
// @Default(0.0) double total,
  /// Amount customer gave as payment
  double get amountPaid;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
