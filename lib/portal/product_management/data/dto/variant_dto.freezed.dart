// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'variant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VariantDto _$VariantDtoFromJson(Map<String, dynamic> json) {
  return _VariantDto.fromJson(json);
}

/// @nodoc
mixin _$VariantDto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  int? get warningStock => throw _privateConstructorUsedError;
  int? get idealStock => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;
  List<SupplierDto> get suppliers => throw _privateConstructorUsedError;
  List<BranchInventoryDto> get variantStoreDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VariantDtoCopyWith<VariantDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantDtoCopyWith<$Res> {
  factory $VariantDtoCopyWith(
          VariantDto value, $Res Function(VariantDto) then) =
      _$VariantDtoCopyWithImpl<$Res, VariantDto>;
  @useResult
  $Res call(
      {int id,
      String name,
      String sku,
      int? warningStock,
      int? idealStock,
      double cost,
      List<SupplierDto> suppliers,
      List<BranchInventoryDto> variantStoreDetails});
}

/// @nodoc
class _$VariantDtoCopyWithImpl<$Res, $Val extends VariantDto>
    implements $VariantDtoCopyWith<$Res> {
  _$VariantDtoCopyWithImpl(this._value, this._then);

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
    Object? variantStoreDetails = null,
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
              as List<SupplierDto>,
      variantStoreDetails: null == variantStoreDetails
          ? _value.variantStoreDetails
          : variantStoreDetails // ignore: cast_nullable_to_non_nullable
              as List<BranchInventoryDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariantDtoImplCopyWith<$Res>
    implements $VariantDtoCopyWith<$Res> {
  factory _$$VariantDtoImplCopyWith(
          _$VariantDtoImpl value, $Res Function(_$VariantDtoImpl) then) =
      __$$VariantDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String sku,
      int? warningStock,
      int? idealStock,
      double cost,
      List<SupplierDto> suppliers,
      List<BranchInventoryDto> variantStoreDetails});
}

/// @nodoc
class __$$VariantDtoImplCopyWithImpl<$Res>
    extends _$VariantDtoCopyWithImpl<$Res, _$VariantDtoImpl>
    implements _$$VariantDtoImplCopyWith<$Res> {
  __$$VariantDtoImplCopyWithImpl(
      _$VariantDtoImpl _value, $Res Function(_$VariantDtoImpl) _then)
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
    Object? variantStoreDetails = null,
  }) {
    return _then(_$VariantDtoImpl(
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
              as List<SupplierDto>,
      variantStoreDetails: null == variantStoreDetails
          ? _value._variantStoreDetails
          : variantStoreDetails // ignore: cast_nullable_to_non_nullable
              as List<BranchInventoryDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VariantDtoImpl extends _VariantDto {
  const _$VariantDtoImpl(
      {required this.id,
      required this.name,
      required this.sku,
      this.warningStock,
      this.idealStock,
      required this.cost,
      required final List<SupplierDto> suppliers,
      required final List<BranchInventoryDto> variantStoreDetails})
      : _suppliers = suppliers,
        _variantStoreDetails = variantStoreDetails,
        super._();

  factory _$VariantDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariantDtoImplFromJson(json);

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
  final List<SupplierDto> _suppliers;
  @override
  List<SupplierDto> get suppliers {
    if (_suppliers is EqualUnmodifiableListView) return _suppliers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suppliers);
  }

  final List<BranchInventoryDto> _variantStoreDetails;
  @override
  List<BranchInventoryDto> get variantStoreDetails {
    if (_variantStoreDetails is EqualUnmodifiableListView)
      return _variantStoreDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variantStoreDetails);
  }

  @override
  String toString() {
    return 'VariantDto(id: $id, name: $name, sku: $sku, warningStock: $warningStock, idealStock: $idealStock, cost: $cost, suppliers: $suppliers, variantStoreDetails: $variantStoreDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantDtoImpl &&
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
                .equals(other._variantStoreDetails, _variantStoreDetails));
  }

  @JsonKey(ignore: true)
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
      const DeepCollectionEquality().hash(_variantStoreDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantDtoImplCopyWith<_$VariantDtoImpl> get copyWith =>
      __$$VariantDtoImplCopyWithImpl<_$VariantDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariantDtoImplToJson(
      this,
    );
  }
}

abstract class _VariantDto extends VariantDto {
  const factory _VariantDto(
          {required final int id,
          required final String name,
          required final String sku,
          final int? warningStock,
          final int? idealStock,
          required final double cost,
          required final List<SupplierDto> suppliers,
          required final List<BranchInventoryDto> variantStoreDetails}) =
      _$VariantDtoImpl;
  const _VariantDto._() : super._();

  factory _VariantDto.fromJson(Map<String, dynamic> json) =
      _$VariantDtoImpl.fromJson;

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
  List<SupplierDto> get suppliers;
  @override
  List<BranchInventoryDto> get variantStoreDetails;
  @override
  @JsonKey(ignore: true)
  _$$VariantDtoImplCopyWith<_$VariantDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VariantLiteDto _$VariantLiteDtoFromJson(Map<String, dynamic> json) {
  return _VariantLiteDto.fromJson(json);
}

/// @nodoc
mixin _$VariantLiteDto {
  int get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VariantLiteDtoCopyWith<VariantLiteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantLiteDtoCopyWith<$Res> {
  factory $VariantLiteDtoCopyWith(
          VariantLiteDto value, $Res Function(VariantLiteDto) then) =
      _$VariantLiteDtoCopyWithImpl<$Res, VariantLiteDto>;
  @useResult
  $Res call({int id, String displayName, String sku});
}

/// @nodoc
class _$VariantLiteDtoCopyWithImpl<$Res, $Val extends VariantLiteDto>
    implements $VariantLiteDtoCopyWith<$Res> {
  _$VariantLiteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? sku = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VariantLiteDtoImplCopyWith<$Res>
    implements $VariantLiteDtoCopyWith<$Res> {
  factory _$$VariantLiteDtoImplCopyWith(_$VariantLiteDtoImpl value,
          $Res Function(_$VariantLiteDtoImpl) then) =
      __$$VariantLiteDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String displayName, String sku});
}

/// @nodoc
class __$$VariantLiteDtoImplCopyWithImpl<$Res>
    extends _$VariantLiteDtoCopyWithImpl<$Res, _$VariantLiteDtoImpl>
    implements _$$VariantLiteDtoImplCopyWith<$Res> {
  __$$VariantLiteDtoImplCopyWithImpl(
      _$VariantLiteDtoImpl _value, $Res Function(_$VariantLiteDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? sku = null,
  }) {
    return _then(_$VariantLiteDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VariantLiteDtoImpl extends _VariantLiteDto {
  const _$VariantLiteDtoImpl(
      {required this.id, required this.displayName, required this.sku})
      : super._();

  factory _$VariantLiteDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariantLiteDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String displayName;
  @override
  final String sku;

  @override
  String toString() {
    return 'VariantLiteDto(id: $id, displayName: $displayName, sku: $sku)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantLiteDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.sku, sku) || other.sku == sku));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, displayName, sku);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantLiteDtoImplCopyWith<_$VariantLiteDtoImpl> get copyWith =>
      __$$VariantLiteDtoImplCopyWithImpl<_$VariantLiteDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariantLiteDtoImplToJson(
      this,
    );
  }
}

abstract class _VariantLiteDto extends VariantLiteDto {
  const factory _VariantLiteDto(
      {required final int id,
      required final String displayName,
      required final String sku}) = _$VariantLiteDtoImpl;
  const _VariantLiteDto._() : super._();

  factory _VariantLiteDto.fromJson(Map<String, dynamic> json) =
      _$VariantLiteDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get displayName;
  @override
  String get sku;
  @override
  @JsonKey(ignore: true)
  _$$VariantLiteDtoImplCopyWith<_$VariantLiteDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VariantPartialDto _$VariantPartialDtoFromJson(Map<String, dynamic> json) {
  return _VariantPartialDto.fromJson(json);
}

/// @nodoc
mixin _$VariantPartialDto {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  int? get warningStock => throw _privateConstructorUsedError;
  int? get idealStock => throw _privateConstructorUsedError;
  int? get currentStock => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  ProductLiteDto? get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VariantPartialDtoCopyWith<VariantPartialDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VariantPartialDtoCopyWith<$Res> {
  factory $VariantPartialDtoCopyWith(
          VariantPartialDto value, $Res Function(VariantPartialDto) then) =
      _$VariantPartialDtoCopyWithImpl<$Res, VariantPartialDto>;
  @useResult
  $Res call(
      {int? id,
      String name,
      String? sku,
      String? displayName,
      int? warningStock,
      int? idealStock,
      int? currentStock,
      double? cost,
      double? price,
      ProductLiteDto? product});

  $ProductLiteDtoCopyWith<$Res>? get product;
}

/// @nodoc
class _$VariantPartialDtoCopyWithImpl<$Res, $Val extends VariantPartialDto>
    implements $VariantPartialDtoCopyWith<$Res> {
  _$VariantPartialDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? sku = freezed,
    Object? displayName = freezed,
    Object? warningStock = freezed,
    Object? idealStock = freezed,
    Object? currentStock = freezed,
    Object? cost = freezed,
    Object? price = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      warningStock: freezed == warningStock
          ? _value.warningStock
          : warningStock // ignore: cast_nullable_to_non_nullable
              as int?,
      idealStock: freezed == idealStock
          ? _value.idealStock
          : idealStock // ignore: cast_nullable_to_non_nullable
              as int?,
      currentStock: freezed == currentStock
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductLiteDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductLiteDtoCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductLiteDtoCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VariantPartialDtoImplCopyWith<$Res>
    implements $VariantPartialDtoCopyWith<$Res> {
  factory _$$VariantPartialDtoImplCopyWith(_$VariantPartialDtoImpl value,
          $Res Function(_$VariantPartialDtoImpl) then) =
      __$$VariantPartialDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      String? sku,
      String? displayName,
      int? warningStock,
      int? idealStock,
      int? currentStock,
      double? cost,
      double? price,
      ProductLiteDto? product});

  @override
  $ProductLiteDtoCopyWith<$Res>? get product;
}

/// @nodoc
class __$$VariantPartialDtoImplCopyWithImpl<$Res>
    extends _$VariantPartialDtoCopyWithImpl<$Res, _$VariantPartialDtoImpl>
    implements _$$VariantPartialDtoImplCopyWith<$Res> {
  __$$VariantPartialDtoImplCopyWithImpl(_$VariantPartialDtoImpl _value,
      $Res Function(_$VariantPartialDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? sku = freezed,
    Object? displayName = freezed,
    Object? warningStock = freezed,
    Object? idealStock = freezed,
    Object? currentStock = freezed,
    Object? cost = freezed,
    Object? price = freezed,
    Object? product = freezed,
  }) {
    return _then(_$VariantPartialDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      warningStock: freezed == warningStock
          ? _value.warningStock
          : warningStock // ignore: cast_nullable_to_non_nullable
              as int?,
      idealStock: freezed == idealStock
          ? _value.idealStock
          : idealStock // ignore: cast_nullable_to_non_nullable
              as int?,
      currentStock: freezed == currentStock
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductLiteDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VariantPartialDtoImpl extends _VariantPartialDto {
  const _$VariantPartialDtoImpl(
      {this.id,
      required this.name,
      this.sku,
      this.displayName,
      this.warningStock,
      this.idealStock,
      this.currentStock,
      this.cost,
      this.price,
      this.product})
      : super._();

  factory _$VariantPartialDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VariantPartialDtoImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String? sku;
  @override
  final String? displayName;
  @override
  final int? warningStock;
  @override
  final int? idealStock;
  @override
  final int? currentStock;
  @override
  final double? cost;
  @override
  final double? price;
  @override
  final ProductLiteDto? product;

  @override
  String toString() {
    return 'VariantPartialDto(id: $id, name: $name, sku: $sku, displayName: $displayName, warningStock: $warningStock, idealStock: $idealStock, currentStock: $currentStock, cost: $cost, price: $price, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VariantPartialDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.warningStock, warningStock) ||
                other.warningStock == warningStock) &&
            (identical(other.idealStock, idealStock) ||
                other.idealStock == idealStock) &&
            (identical(other.currentStock, currentStock) ||
                other.currentStock == currentStock) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, sku, displayName,
      warningStock, idealStock, currentStock, cost, price, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VariantPartialDtoImplCopyWith<_$VariantPartialDtoImpl> get copyWith =>
      __$$VariantPartialDtoImplCopyWithImpl<_$VariantPartialDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VariantPartialDtoImplToJson(
      this,
    );
  }
}

abstract class _VariantPartialDto extends VariantPartialDto {
  const factory _VariantPartialDto(
      {final int? id,
      required final String name,
      final String? sku,
      final String? displayName,
      final int? warningStock,
      final int? idealStock,
      final int? currentStock,
      final double? cost,
      final double? price,
      final ProductLiteDto? product}) = _$VariantPartialDtoImpl;
  const _VariantPartialDto._() : super._();

  factory _VariantPartialDto.fromJson(Map<String, dynamic> json) =
      _$VariantPartialDtoImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  String? get sku;
  @override
  String? get displayName;
  @override
  int? get warningStock;
  @override
  int? get idealStock;
  @override
  int? get currentStock;
  @override
  double? get cost;
  @override
  double? get price;
  @override
  ProductLiteDto? get product;
  @override
  @JsonKey(ignore: true)
  _$$VariantPartialDtoImplCopyWith<_$VariantPartialDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
