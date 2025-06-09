// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderItem item) addItem,
    required TResult Function(int id) removeItem,
    required TResult Function(int id, int quantity) updateItemQuantity,
    required TResult Function(int id, DiscountCategory discount)
        setItemDiscount,
    required TResult Function(int id) removeItemDiscount,
    required TResult Function() clearOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderItem item)? addItem,
    TResult? Function(int id)? removeItem,
    TResult? Function(int id, int quantity)? updateItemQuantity,
    TResult? Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult? Function(int id)? removeItemDiscount,
    TResult? Function()? clearOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderItem item)? addItem,
    TResult Function(int id)? removeItem,
    TResult Function(int id, int quantity)? updateItemQuantity,
    TResult Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult Function(int id)? removeItemDiscount,
    TResult Function()? clearOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_SetItemDiscount value) setItemDiscount,
    required TResult Function(_RemoveItemDiscount value) removeItemDiscount,
    required TResult Function(_ClearOrder value) clearOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_SetItemDiscount value)? setItemDiscount,
    TResult? Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult? Function(_ClearOrder value)? clearOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_SetItemDiscount value)? setItemDiscount,
    TResult Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult Function(_ClearOrder value)? clearOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEventCopyWith<$Res> {
  factory $OrderEventCopyWith(
          OrderEvent value, $Res Function(OrderEvent) then) =
      _$OrderEventCopyWithImpl<$Res, OrderEvent>;
}

/// @nodoc
class _$OrderEventCopyWithImpl<$Res, $Val extends OrderEvent>
    implements $OrderEventCopyWith<$Res> {
  _$OrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddItemImplCopyWith<$Res> {
  factory _$$AddItemImplCopyWith(
          _$AddItemImpl value, $Res Function(_$AddItemImpl) then) =
      __$$AddItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrderItem item});

  $OrderItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$AddItemImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$AddItemImpl>
    implements _$$AddItemImplCopyWith<$Res> {
  __$$AddItemImplCopyWithImpl(
      _$AddItemImpl _value, $Res Function(_$AddItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$AddItemImpl(
      null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as OrderItem,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderItemCopyWith<$Res> get item {
    return $OrderItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$AddItemImpl implements _AddItem {
  const _$AddItemImpl(this.item);

  @override
  final OrderItem item;

  @override
  String toString() {
    return 'OrderEvent.addItem(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddItemImplCopyWith<_$AddItemImpl> get copyWith =>
      __$$AddItemImplCopyWithImpl<_$AddItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderItem item) addItem,
    required TResult Function(int id) removeItem,
    required TResult Function(int id, int quantity) updateItemQuantity,
    required TResult Function(int id, DiscountCategory discount)
        setItemDiscount,
    required TResult Function(int id) removeItemDiscount,
    required TResult Function() clearOrder,
  }) {
    return addItem(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderItem item)? addItem,
    TResult? Function(int id)? removeItem,
    TResult? Function(int id, int quantity)? updateItemQuantity,
    TResult? Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult? Function(int id)? removeItemDiscount,
    TResult? Function()? clearOrder,
  }) {
    return addItem?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderItem item)? addItem,
    TResult Function(int id)? removeItem,
    TResult Function(int id, int quantity)? updateItemQuantity,
    TResult Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult Function(int id)? removeItemDiscount,
    TResult Function()? clearOrder,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_SetItemDiscount value) setItemDiscount,
    required TResult Function(_RemoveItemDiscount value) removeItemDiscount,
    required TResult Function(_ClearOrder value) clearOrder,
  }) {
    return addItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_SetItemDiscount value)? setItemDiscount,
    TResult? Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult? Function(_ClearOrder value)? clearOrder,
  }) {
    return addItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_SetItemDiscount value)? setItemDiscount,
    TResult Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult Function(_ClearOrder value)? clearOrder,
    required TResult orElse(),
  }) {
    if (addItem != null) {
      return addItem(this);
    }
    return orElse();
  }
}

abstract class _AddItem implements OrderEvent {
  const factory _AddItem(final OrderItem item) = _$AddItemImpl;

  OrderItem get item;
  @JsonKey(ignore: true)
  _$$AddItemImplCopyWith<_$AddItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveItemImplCopyWith<$Res> {
  factory _$$RemoveItemImplCopyWith(
          _$RemoveItemImpl value, $Res Function(_$RemoveItemImpl) then) =
      __$$RemoveItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$RemoveItemImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$RemoveItemImpl>
    implements _$$RemoveItemImplCopyWith<$Res> {
  __$$RemoveItemImplCopyWithImpl(
      _$RemoveItemImpl _value, $Res Function(_$RemoveItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemoveItemImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveItemImpl implements _RemoveItem {
  const _$RemoveItemImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'OrderEvent.removeItem(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveItemImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveItemImplCopyWith<_$RemoveItemImpl> get copyWith =>
      __$$RemoveItemImplCopyWithImpl<_$RemoveItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderItem item) addItem,
    required TResult Function(int id) removeItem,
    required TResult Function(int id, int quantity) updateItemQuantity,
    required TResult Function(int id, DiscountCategory discount)
        setItemDiscount,
    required TResult Function(int id) removeItemDiscount,
    required TResult Function() clearOrder,
  }) {
    return removeItem(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderItem item)? addItem,
    TResult? Function(int id)? removeItem,
    TResult? Function(int id, int quantity)? updateItemQuantity,
    TResult? Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult? Function(int id)? removeItemDiscount,
    TResult? Function()? clearOrder,
  }) {
    return removeItem?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderItem item)? addItem,
    TResult Function(int id)? removeItem,
    TResult Function(int id, int quantity)? updateItemQuantity,
    TResult Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult Function(int id)? removeItemDiscount,
    TResult Function()? clearOrder,
    required TResult orElse(),
  }) {
    if (removeItem != null) {
      return removeItem(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_SetItemDiscount value) setItemDiscount,
    required TResult Function(_RemoveItemDiscount value) removeItemDiscount,
    required TResult Function(_ClearOrder value) clearOrder,
  }) {
    return removeItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_SetItemDiscount value)? setItemDiscount,
    TResult? Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult? Function(_ClearOrder value)? clearOrder,
  }) {
    return removeItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_SetItemDiscount value)? setItemDiscount,
    TResult Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult Function(_ClearOrder value)? clearOrder,
    required TResult orElse(),
  }) {
    if (removeItem != null) {
      return removeItem(this);
    }
    return orElse();
  }
}

abstract class _RemoveItem implements OrderEvent {
  const factory _RemoveItem(final int id) = _$RemoveItemImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$RemoveItemImplCopyWith<_$RemoveItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateItemQuantityImplCopyWith<$Res> {
  factory _$$UpdateItemQuantityImplCopyWith(_$UpdateItemQuantityImpl value,
          $Res Function(_$UpdateItemQuantityImpl) then) =
      __$$UpdateItemQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, int quantity});
}

/// @nodoc
class __$$UpdateItemQuantityImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$UpdateItemQuantityImpl>
    implements _$$UpdateItemQuantityImplCopyWith<$Res> {
  __$$UpdateItemQuantityImplCopyWithImpl(_$UpdateItemQuantityImpl _value,
      $Res Function(_$UpdateItemQuantityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
  }) {
    return _then(_$UpdateItemQuantityImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateItemQuantityImpl implements _UpdateItemQuantity {
  const _$UpdateItemQuantityImpl(this.id, this.quantity);

  @override
  final int id;
  @override
  final int quantity;

  @override
  String toString() {
    return 'OrderEvent.updateItemQuantity(id: $id, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateItemQuantityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateItemQuantityImplCopyWith<_$UpdateItemQuantityImpl> get copyWith =>
      __$$UpdateItemQuantityImplCopyWithImpl<_$UpdateItemQuantityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderItem item) addItem,
    required TResult Function(int id) removeItem,
    required TResult Function(int id, int quantity) updateItemQuantity,
    required TResult Function(int id, DiscountCategory discount)
        setItemDiscount,
    required TResult Function(int id) removeItemDiscount,
    required TResult Function() clearOrder,
  }) {
    return updateItemQuantity(id, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderItem item)? addItem,
    TResult? Function(int id)? removeItem,
    TResult? Function(int id, int quantity)? updateItemQuantity,
    TResult? Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult? Function(int id)? removeItemDiscount,
    TResult? Function()? clearOrder,
  }) {
    return updateItemQuantity?.call(id, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderItem item)? addItem,
    TResult Function(int id)? removeItem,
    TResult Function(int id, int quantity)? updateItemQuantity,
    TResult Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult Function(int id)? removeItemDiscount,
    TResult Function()? clearOrder,
    required TResult orElse(),
  }) {
    if (updateItemQuantity != null) {
      return updateItemQuantity(id, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_SetItemDiscount value) setItemDiscount,
    required TResult Function(_RemoveItemDiscount value) removeItemDiscount,
    required TResult Function(_ClearOrder value) clearOrder,
  }) {
    return updateItemQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_SetItemDiscount value)? setItemDiscount,
    TResult? Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult? Function(_ClearOrder value)? clearOrder,
  }) {
    return updateItemQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_SetItemDiscount value)? setItemDiscount,
    TResult Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult Function(_ClearOrder value)? clearOrder,
    required TResult orElse(),
  }) {
    if (updateItemQuantity != null) {
      return updateItemQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateItemQuantity implements OrderEvent {
  const factory _UpdateItemQuantity(final int id, final int quantity) =
      _$UpdateItemQuantityImpl;

  int get id;
  int get quantity;
  @JsonKey(ignore: true)
  _$$UpdateItemQuantityImplCopyWith<_$UpdateItemQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetItemDiscountImplCopyWith<$Res> {
  factory _$$SetItemDiscountImplCopyWith(_$SetItemDiscountImpl value,
          $Res Function(_$SetItemDiscountImpl) then) =
      __$$SetItemDiscountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, DiscountCategory discount});
}

/// @nodoc
class __$$SetItemDiscountImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$SetItemDiscountImpl>
    implements _$$SetItemDiscountImplCopyWith<$Res> {
  __$$SetItemDiscountImplCopyWithImpl(
      _$SetItemDiscountImpl _value, $Res Function(_$SetItemDiscountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? discount = null,
  }) {
    return _then(_$SetItemDiscountImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as DiscountCategory,
    ));
  }
}

/// @nodoc

class _$SetItemDiscountImpl implements _SetItemDiscount {
  const _$SetItemDiscountImpl(this.id, this.discount);

  @override
  final int id;
  @override
  final DiscountCategory discount;

  @override
  String toString() {
    return 'OrderEvent.setItemDiscount(id: $id, discount: $discount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetItemDiscountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, discount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetItemDiscountImplCopyWith<_$SetItemDiscountImpl> get copyWith =>
      __$$SetItemDiscountImplCopyWithImpl<_$SetItemDiscountImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderItem item) addItem,
    required TResult Function(int id) removeItem,
    required TResult Function(int id, int quantity) updateItemQuantity,
    required TResult Function(int id, DiscountCategory discount)
        setItemDiscount,
    required TResult Function(int id) removeItemDiscount,
    required TResult Function() clearOrder,
  }) {
    return setItemDiscount(id, discount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderItem item)? addItem,
    TResult? Function(int id)? removeItem,
    TResult? Function(int id, int quantity)? updateItemQuantity,
    TResult? Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult? Function(int id)? removeItemDiscount,
    TResult? Function()? clearOrder,
  }) {
    return setItemDiscount?.call(id, discount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderItem item)? addItem,
    TResult Function(int id)? removeItem,
    TResult Function(int id, int quantity)? updateItemQuantity,
    TResult Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult Function(int id)? removeItemDiscount,
    TResult Function()? clearOrder,
    required TResult orElse(),
  }) {
    if (setItemDiscount != null) {
      return setItemDiscount(id, discount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_SetItemDiscount value) setItemDiscount,
    required TResult Function(_RemoveItemDiscount value) removeItemDiscount,
    required TResult Function(_ClearOrder value) clearOrder,
  }) {
    return setItemDiscount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_SetItemDiscount value)? setItemDiscount,
    TResult? Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult? Function(_ClearOrder value)? clearOrder,
  }) {
    return setItemDiscount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_SetItemDiscount value)? setItemDiscount,
    TResult Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult Function(_ClearOrder value)? clearOrder,
    required TResult orElse(),
  }) {
    if (setItemDiscount != null) {
      return setItemDiscount(this);
    }
    return orElse();
  }
}

abstract class _SetItemDiscount implements OrderEvent {
  const factory _SetItemDiscount(
      final int id, final DiscountCategory discount) = _$SetItemDiscountImpl;

  int get id;
  DiscountCategory get discount;
  @JsonKey(ignore: true)
  _$$SetItemDiscountImplCopyWith<_$SetItemDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveItemDiscountImplCopyWith<$Res> {
  factory _$$RemoveItemDiscountImplCopyWith(_$RemoveItemDiscountImpl value,
          $Res Function(_$RemoveItemDiscountImpl) then) =
      __$$RemoveItemDiscountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$RemoveItemDiscountImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$RemoveItemDiscountImpl>
    implements _$$RemoveItemDiscountImplCopyWith<$Res> {
  __$$RemoveItemDiscountImplCopyWithImpl(_$RemoveItemDiscountImpl _value,
      $Res Function(_$RemoveItemDiscountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$RemoveItemDiscountImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveItemDiscountImpl implements _RemoveItemDiscount {
  const _$RemoveItemDiscountImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'OrderEvent.removeItemDiscount(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveItemDiscountImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveItemDiscountImplCopyWith<_$RemoveItemDiscountImpl> get copyWith =>
      __$$RemoveItemDiscountImplCopyWithImpl<_$RemoveItemDiscountImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderItem item) addItem,
    required TResult Function(int id) removeItem,
    required TResult Function(int id, int quantity) updateItemQuantity,
    required TResult Function(int id, DiscountCategory discount)
        setItemDiscount,
    required TResult Function(int id) removeItemDiscount,
    required TResult Function() clearOrder,
  }) {
    return removeItemDiscount(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderItem item)? addItem,
    TResult? Function(int id)? removeItem,
    TResult? Function(int id, int quantity)? updateItemQuantity,
    TResult? Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult? Function(int id)? removeItemDiscount,
    TResult? Function()? clearOrder,
  }) {
    return removeItemDiscount?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderItem item)? addItem,
    TResult Function(int id)? removeItem,
    TResult Function(int id, int quantity)? updateItemQuantity,
    TResult Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult Function(int id)? removeItemDiscount,
    TResult Function()? clearOrder,
    required TResult orElse(),
  }) {
    if (removeItemDiscount != null) {
      return removeItemDiscount(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_SetItemDiscount value) setItemDiscount,
    required TResult Function(_RemoveItemDiscount value) removeItemDiscount,
    required TResult Function(_ClearOrder value) clearOrder,
  }) {
    return removeItemDiscount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_SetItemDiscount value)? setItemDiscount,
    TResult? Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult? Function(_ClearOrder value)? clearOrder,
  }) {
    return removeItemDiscount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_SetItemDiscount value)? setItemDiscount,
    TResult Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult Function(_ClearOrder value)? clearOrder,
    required TResult orElse(),
  }) {
    if (removeItemDiscount != null) {
      return removeItemDiscount(this);
    }
    return orElse();
  }
}

abstract class _RemoveItemDiscount implements OrderEvent {
  const factory _RemoveItemDiscount(final int id) = _$RemoveItemDiscountImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$RemoveItemDiscountImplCopyWith<_$RemoveItemDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearOrderImplCopyWith<$Res> {
  factory _$$ClearOrderImplCopyWith(
          _$ClearOrderImpl value, $Res Function(_$ClearOrderImpl) then) =
      __$$ClearOrderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearOrderImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$ClearOrderImpl>
    implements _$$ClearOrderImplCopyWith<$Res> {
  __$$ClearOrderImplCopyWithImpl(
      _$ClearOrderImpl _value, $Res Function(_$ClearOrderImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearOrderImpl implements _ClearOrder {
  const _$ClearOrderImpl();

  @override
  String toString() {
    return 'OrderEvent.clearOrder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearOrderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(OrderItem item) addItem,
    required TResult Function(int id) removeItem,
    required TResult Function(int id, int quantity) updateItemQuantity,
    required TResult Function(int id, DiscountCategory discount)
        setItemDiscount,
    required TResult Function(int id) removeItemDiscount,
    required TResult Function() clearOrder,
  }) {
    return clearOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(OrderItem item)? addItem,
    TResult? Function(int id)? removeItem,
    TResult? Function(int id, int quantity)? updateItemQuantity,
    TResult? Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult? Function(int id)? removeItemDiscount,
    TResult? Function()? clearOrder,
  }) {
    return clearOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(OrderItem item)? addItem,
    TResult Function(int id)? removeItem,
    TResult Function(int id, int quantity)? updateItemQuantity,
    TResult Function(int id, DiscountCategory discount)? setItemDiscount,
    TResult Function(int id)? removeItemDiscount,
    TResult Function()? clearOrder,
    required TResult orElse(),
  }) {
    if (clearOrder != null) {
      return clearOrder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddItem value) addItem,
    required TResult Function(_RemoveItem value) removeItem,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_SetItemDiscount value) setItemDiscount,
    required TResult Function(_RemoveItemDiscount value) removeItemDiscount,
    required TResult Function(_ClearOrder value) clearOrder,
  }) {
    return clearOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddItem value)? addItem,
    TResult? Function(_RemoveItem value)? removeItem,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_SetItemDiscount value)? setItemDiscount,
    TResult? Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult? Function(_ClearOrder value)? clearOrder,
  }) {
    return clearOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddItem value)? addItem,
    TResult Function(_RemoveItem value)? removeItem,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_SetItemDiscount value)? setItemDiscount,
    TResult Function(_RemoveItemDiscount value)? removeItemDiscount,
    TResult Function(_ClearOrder value)? clearOrder,
    required TResult orElse(),
  }) {
    if (clearOrder != null) {
      return clearOrder(this);
    }
    return orElse();
  }
}

abstract class _ClearOrder implements OrderEvent {
  const factory _ClearOrder() = _$ClearOrderImpl;
}

OrderState _$OrderStateFromJson(Map<String, dynamic> json) {
  return _OrderState.fromJson(json);
}

/// @nodoc
mixin _$OrderState {
  Order get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStateCopyWith<OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
  @useResult
  $Res call({Order order});

  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderCopyWith<$Res> get order {
    return $OrderCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderStateImplCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory _$$OrderStateImplCopyWith(
          _$OrderStateImpl value, $Res Function(_$OrderStateImpl) then) =
      __$$OrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Order order});

  @override
  $OrderCopyWith<$Res> get order;
}

/// @nodoc
class __$$OrderStateImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateImpl>
    implements _$$OrderStateImplCopyWith<$Res> {
  __$$OrderStateImplCopyWithImpl(
      _$OrderStateImpl _value, $Res Function(_$OrderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
  }) {
    return _then(_$OrderStateImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as Order,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderStateImpl implements _OrderState {
  const _$OrderStateImpl({required this.order});

  factory _$OrderStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStateImplFromJson(json);

  @override
  final Order order;

  @override
  String toString() {
    return 'OrderState(order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateImpl &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      __$$OrderStateImplCopyWithImpl<_$OrderStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderStateImplToJson(
      this,
    );
  }
}

abstract class _OrderState implements OrderState {
  const factory _OrderState({required final Order order}) = _$OrderStateImpl;

  factory _OrderState.fromJson(Map<String, dynamic> json) =
      _$OrderStateImpl.fromJson;

  @override
  Order get order;
  @override
  @JsonKey(ignore: true)
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
