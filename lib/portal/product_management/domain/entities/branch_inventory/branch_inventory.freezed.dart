// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_inventory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BranchInventory {
  int get id => throw _privateConstructorUsedError;
  Branch get branch => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get quantityOnHand => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BranchInventoryCopyWith<BranchInventory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchInventoryCopyWith<$Res> {
  factory $BranchInventoryCopyWith(
          BranchInventory value, $Res Function(BranchInventory) then) =
      _$BranchInventoryCopyWithImpl<$Res, BranchInventory>;
  @useResult
  $Res call({int id, Branch branch, double? price, int? quantityOnHand});

  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class _$BranchInventoryCopyWithImpl<$Res, $Val extends BranchInventory>
    implements $BranchInventoryCopyWith<$Res> {
  _$BranchInventoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? branch = null,
    Object? price = freezed,
    Object? quantityOnHand = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quantityOnHand: freezed == quantityOnHand
          ? _value.quantityOnHand
          : quantityOnHand // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res> get branch {
    return $BranchCopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BranchInventoryImplCopyWith<$Res>
    implements $BranchInventoryCopyWith<$Res> {
  factory _$$BranchInventoryImplCopyWith(_$BranchInventoryImpl value,
          $Res Function(_$BranchInventoryImpl) then) =
      __$$BranchInventoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Branch branch, double? price, int? quantityOnHand});

  @override
  $BranchCopyWith<$Res> get branch;
}

/// @nodoc
class __$$BranchInventoryImplCopyWithImpl<$Res>
    extends _$BranchInventoryCopyWithImpl<$Res, _$BranchInventoryImpl>
    implements _$$BranchInventoryImplCopyWith<$Res> {
  __$$BranchInventoryImplCopyWithImpl(
      _$BranchInventoryImpl _value, $Res Function(_$BranchInventoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? branch = null,
    Object? price = freezed,
    Object? quantityOnHand = freezed,
  }) {
    return _then(_$BranchInventoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as Branch,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quantityOnHand: freezed == quantityOnHand
          ? _value.quantityOnHand
          : quantityOnHand // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$BranchInventoryImpl implements _BranchInventory {
  const _$BranchInventoryImpl(
      {required this.id,
      required this.branch,
      this.price,
      this.quantityOnHand});

  @override
  final int id;
  @override
  final Branch branch;
  @override
  final double? price;
  @override
  final int? quantityOnHand;

  @override
  String toString() {
    return 'BranchInventory(id: $id, branch: $branch, price: $price, quantityOnHand: $quantityOnHand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchInventoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantityOnHand, quantityOnHand) ||
                other.quantityOnHand == quantityOnHand));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, branch, price, quantityOnHand);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchInventoryImplCopyWith<_$BranchInventoryImpl> get copyWith =>
      __$$BranchInventoryImplCopyWithImpl<_$BranchInventoryImpl>(
          this, _$identity);
}

abstract class _BranchInventory implements BranchInventory {
  const factory _BranchInventory(
      {required final int id,
      required final Branch branch,
      final double? price,
      final int? quantityOnHand}) = _$BranchInventoryImpl;

  @override
  int get id;
  @override
  Branch get branch;
  @override
  double? get price;
  @override
  int? get quantityOnHand;
  @override
  @JsonKey(ignore: true)
  _$$BranchInventoryImplCopyWith<_$BranchInventoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
