// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Variant {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  int? get warningStock => throw _privateConstructorUsedError;
  int? get idealStock => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  List<Supplier> get suppliers => throw _privateConstructorUsedError;
  List<BranchInventory> get branchInventories =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VariantCopyWith<Variant> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantCopyWith<$Res> {
  factory $VariantCopyWith(Variant value, $Res Function(Variant) then) =
      _$VariantCopyWithImpl<$Res, Variant>;
  @useResult
  $Res call(
      {int id,
      String name,
      String sku,
      int? warningStock,
      int? idealStock,
      double cost,
      List<Supplier> suppliers,
      List<BranchInventory> branchInventories});
}

/// @nodoc
class _$VariantCopyWithImpl<$Res, $Val extends Variant>
    implements $VariantCopyWith<$Res> {
  _$VariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sku = null,
    Object? warningStock = freezed,
    Object? idealStock = freezed,
    Object? cost = null,
    Object? suppliers = null,
    Object? branchInventories = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      warningStock: freezed == warningStock
          ? _value.warningStock
          : warningStock // ignore: cast_nullable_to_non_nullable
              as int?,
      idealStock: freezed == idealStock
          ? _value.idealStock
          : idealStock // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      suppliers: null == suppliers
          ? _value.suppliers
          : suppliers // ignore: cast_nullable_to_non_nullable
              as List<Supplier>,
      branchInventories: null == branchInventories
          ? _value.branchInventories
          : branchInventories // ignore: cast_nullable_to_non_nullable
              as List<BranchInventory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariantImplCopyWith<$Res> implements $VariantCopyWith<$Res> {
  factory _$$VariantImplCopyWith(
          _$VariantImpl value, $Res Function(_$VariantImpl) then) =
      __$$VariantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String sku,
      int? warningStock,
      int? idealStock,
      double cost,
      List<Supplier> suppliers,
      List<BranchInventory> branchInventories});
}

/// @nodoc
class __$$VariantImplCopyWithImpl<$Res>
    extends _$VariantCopyWithImpl<$Res, _$VariantImpl>
    implements _$$VariantImplCopyWith<$Res> {
  __$$VariantImplCopyWithImpl(
      _$VariantImpl _value, $Res Function(_$VariantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sku = null,
    Object? warningStock = freezed,
    Object? idealStock = freezed,
    Object? cost = null,
    Object? suppliers = null,
    Object? branchInventories = null,
  }) {
    return _then(_$VariantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      warningStock: freezed == warningStock
          ? _value.warningStock
          : warningStock // ignore: cast_nullable_to_non_nullable
              as int?,
      idealStock: freezed == idealStock
          ? _value.idealStock
          : idealStock // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      suppliers: null == suppliers
          ? _value._suppliers
          : suppliers // ignore: cast_nullable_to_non_nullable
              as List<Supplier>,
      branchInventories: null == branchInventories
          ? _value._branchInventories
          : branchInventories // ignore: cast_nullable_to_non_nullable
              as List<BranchInventory>,
    ));
  }
}

/// @nodoc

class _$VariantImpl implements _Variant {
  const _$VariantImpl(
      {required this.id,
      required this.name,
      required this.sku,
      this.warningStock,
      this.idealStock,
      required this.cost,
      required final List<Supplier> suppliers,
      required final List<BranchInventory> branchInventories})
      : _suppliers = suppliers,
        _branchInventories = branchInventories;

  @override
  final int id;
  @override
  final String name;
  @override
  final String sku;
  @override
  final int? warningStock;
  @override
  final int? idealStock;
  @override
  final double cost;
  final List<Supplier> _suppliers;
  @override
  List<Supplier> get suppliers {
    if (_suppliers is EqualUnmodifiableListView) return _suppliers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suppliers);
  }

  final List<BranchInventory> _branchInventories;
  @override
  List<BranchInventory> get branchInventories {
    if (_branchInventories is EqualUnmodifiableListView)
      return _branchInventories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branchInventories);
  }

  @override
  String toString() {
    return 'Variant(id: $id, name: $name, sku: $sku, warningStock: $warningStock, idealStock: $idealStock, cost: $cost, suppliers: $suppliers, branchInventories: $branchInventories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.warningStock, warningStock) ||
                other.warningStock == warningStock) &&
            (identical(other.idealStock, idealStock) ||
                other.idealStock == idealStock) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            const DeepCollectionEquality()
                .equals(other._suppliers, _suppliers) &&
            const DeepCollectionEquality()
                .equals(other._branchInventories, _branchInventories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      sku,
      warningStock,
      idealStock,
      cost,
      const DeepCollectionEquality().hash(_suppliers),
      const DeepCollectionEquality().hash(_branchInventories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantImplCopyWith<_$VariantImpl> get copyWith =>
      __$$VariantImplCopyWithImpl<_$VariantImpl>(this, _$identity);
}

abstract class _Variant implements Variant {
  const factory _Variant(
      {required final int id,
      required final String name,
      required final String sku,
      final int? warningStock,
      final int? idealStock,
      required final double cost,
      required final List<Supplier> suppliers,
      required final List<BranchInventory> branchInventories}) = _$VariantImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get sku;
  @override
  int? get warningStock;
  @override
  int? get idealStock;
  @override
  double get cost;
  @override
  List<Supplier> get suppliers;
  @override
  List<BranchInventory> get branchInventories;
  @override
  @JsonKey(ignore: true)
  _$$VariantImplCopyWith<_$VariantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
