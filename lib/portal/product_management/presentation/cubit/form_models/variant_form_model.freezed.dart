// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variant_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VariantFormModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  int? get warningStock => throw _privateConstructorUsedError;
  int? get idealStock => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  List<Supplier>? get suppliers => throw _privateConstructorUsedError;
  List<BranchInventory>? get branchInventories =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VariantFormModelCopyWith<VariantFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantFormModelCopyWith<$Res> {
  factory $VariantFormModelCopyWith(
          VariantFormModel value, $Res Function(VariantFormModel) then) =
      _$VariantFormModelCopyWithImpl<$Res, VariantFormModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? sku,
      int? warningStock,
      int? idealStock,
      double? cost,
      List<Supplier>? suppliers,
      List<BranchInventory>? branchInventories});
}

/// @nodoc
class _$VariantFormModelCopyWithImpl<$Res, $Val extends VariantFormModel>
    implements $VariantFormModelCopyWith<$Res> {
  _$VariantFormModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? sku = freezed,
    Object? warningStock = freezed,
    Object? idealStock = freezed,
    Object? cost = freezed,
    Object? suppliers = freezed,
    Object? branchInventories = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      warningStock: freezed == warningStock
          ? _value.warningStock
          : warningStock // ignore: cast_nullable_to_non_nullable
              as int?,
      idealStock: freezed == idealStock
          ? _value.idealStock
          : idealStock // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      suppliers: freezed == suppliers
          ? _value.suppliers
          : suppliers // ignore: cast_nullable_to_non_nullable
              as List<Supplier>?,
      branchInventories: freezed == branchInventories
          ? _value.branchInventories
          : branchInventories // ignore: cast_nullable_to_non_nullable
              as List<BranchInventory>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariantFormModelImplCopyWith<$Res>
    implements $VariantFormModelCopyWith<$Res> {
  factory _$$VariantFormModelImplCopyWith(_$VariantFormModelImpl value,
          $Res Function(_$VariantFormModelImpl) then) =
      __$$VariantFormModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? sku,
      int? warningStock,
      int? idealStock,
      double? cost,
      List<Supplier>? suppliers,
      List<BranchInventory>? branchInventories});
}

/// @nodoc
class __$$VariantFormModelImplCopyWithImpl<$Res>
    extends _$VariantFormModelCopyWithImpl<$Res, _$VariantFormModelImpl>
    implements _$$VariantFormModelImplCopyWith<$Res> {
  __$$VariantFormModelImplCopyWithImpl(_$VariantFormModelImpl _value,
      $Res Function(_$VariantFormModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? sku = freezed,
    Object? warningStock = freezed,
    Object? idealStock = freezed,
    Object? cost = freezed,
    Object? suppliers = freezed,
    Object? branchInventories = freezed,
  }) {
    return _then(_$VariantFormModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      warningStock: freezed == warningStock
          ? _value.warningStock
          : warningStock // ignore: cast_nullable_to_non_nullable
              as int?,
      idealStock: freezed == idealStock
          ? _value.idealStock
          : idealStock // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      suppliers: freezed == suppliers
          ? _value._suppliers
          : suppliers // ignore: cast_nullable_to_non_nullable
              as List<Supplier>?,
      branchInventories: freezed == branchInventories
          ? _value._branchInventories
          : branchInventories // ignore: cast_nullable_to_non_nullable
              as List<BranchInventory>?,
    ));
  }
}

/// @nodoc

class _$VariantFormModelImpl implements _VariantFormModel {
  const _$VariantFormModelImpl(
      {this.id,
      this.name,
      this.sku,
      this.warningStock,
      this.idealStock,
      this.cost,
      final List<Supplier>? suppliers,
      final List<BranchInventory>? branchInventories})
      : _suppliers = suppliers,
        _branchInventories = branchInventories;

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? sku;
  @override
  final int? warningStock;
  @override
  final int? idealStock;
  @override
  final double? cost;
  final List<Supplier>? _suppliers;
  @override
  List<Supplier>? get suppliers {
    final value = _suppliers;
    if (value == null) return null;
    if (_suppliers is EqualUnmodifiableListView) return _suppliers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BranchInventory>? _branchInventories;
  @override
  List<BranchInventory>? get branchInventories {
    final value = _branchInventories;
    if (value == null) return null;
    if (_branchInventories is EqualUnmodifiableListView)
      return _branchInventories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VariantFormModel(id: $id, name: $name, sku: $sku, warningStock: $warningStock, idealStock: $idealStock, cost: $cost, suppliers: $suppliers, branchInventories: $branchInventories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantFormModelImpl &&
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
  _$$VariantFormModelImplCopyWith<_$VariantFormModelImpl> get copyWith =>
      __$$VariantFormModelImplCopyWithImpl<_$VariantFormModelImpl>(
          this, _$identity);
}

abstract class _VariantFormModel implements VariantFormModel {
  const factory _VariantFormModel(
      {final int? id,
      final String? name,
      final String? sku,
      final int? warningStock,
      final int? idealStock,
      final double? cost,
      final List<Supplier>? suppliers,
      final List<BranchInventory>? branchInventories}) = _$VariantFormModelImpl;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get sku;
  @override
  int? get warningStock;
  @override
  int? get idealStock;
  @override
  double? get cost;
  @override
  List<Supplier>? get suppliers;
  @override
  List<BranchInventory>? get branchInventories;
  @override
  @JsonKey(ignore: true)
  _$$VariantFormModelImplCopyWith<_$VariantFormModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
