// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseOrderItemDto _$PurchaseOrderItemDtoFromJson(Map<String, dynamic> json) {
  return _PurchaseOrderItemDto.fromJson(json);
}

/// @nodoc
mixin _$PurchaseOrderItemDto {
  int get id => throw _privateConstructorUsedError;
  ProductVariantDto? get variant => throw _privateConstructorUsedError;
  int? get orderedQuantity => throw _privateConstructorUsedError;
  int? get actualQuantity => throw _privateConstructorUsedError;
  double? get supplierPrice => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseOrderItemDtoCopyWith<PurchaseOrderItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderItemDtoCopyWith<$Res> {
  factory $PurchaseOrderItemDtoCopyWith(PurchaseOrderItemDto value,
          $Res Function(PurchaseOrderItemDto) then) =
      _$PurchaseOrderItemDtoCopyWithImpl<$Res, PurchaseOrderItemDto>;
  @useResult
  $Res call(
      {int id,
      ProductVariantDto? variant,
      int? orderedQuantity,
      int? actualQuantity,
      double? supplierPrice,
      double? price});
}

/// @nodoc
class _$PurchaseOrderItemDtoCopyWithImpl<$Res,
        $Val extends PurchaseOrderItemDto>
    implements $PurchaseOrderItemDtoCopyWith<$Res> {
  _$PurchaseOrderItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? variant = freezed,
    Object? orderedQuantity = freezed,
    Object? actualQuantity = freezed,
    Object? supplierPrice = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as ProductVariantDto?,
      orderedQuantity: freezed == orderedQuantity
          ? _value.orderedQuantity
          : orderedQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      actualQuantity: freezed == actualQuantity
          ? _value.actualQuantity
          : actualQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierPrice: freezed == supplierPrice
          ? _value.supplierPrice
          : supplierPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseOrderItemDtoImplCopyWith<$Res>
    implements $PurchaseOrderItemDtoCopyWith<$Res> {
  factory _$$PurchaseOrderItemDtoImplCopyWith(_$PurchaseOrderItemDtoImpl value,
          $Res Function(_$PurchaseOrderItemDtoImpl) then) =
      __$$PurchaseOrderItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      ProductVariantDto? variant,
      int? orderedQuantity,
      int? actualQuantity,
      double? supplierPrice,
      double? price});
}

/// @nodoc
class __$$PurchaseOrderItemDtoImplCopyWithImpl<$Res>
    extends _$PurchaseOrderItemDtoCopyWithImpl<$Res, _$PurchaseOrderItemDtoImpl>
    implements _$$PurchaseOrderItemDtoImplCopyWith<$Res> {
  __$$PurchaseOrderItemDtoImplCopyWithImpl(_$PurchaseOrderItemDtoImpl _value,
      $Res Function(_$PurchaseOrderItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? variant = freezed,
    Object? orderedQuantity = freezed,
    Object? actualQuantity = freezed,
    Object? supplierPrice = freezed,
    Object? price = freezed,
  }) {
    return _then(_$PurchaseOrderItemDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as ProductVariantDto?,
      orderedQuantity: freezed == orderedQuantity
          ? _value.orderedQuantity
          : orderedQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      actualQuantity: freezed == actualQuantity
          ? _value.actualQuantity
          : actualQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierPrice: freezed == supplierPrice
          ? _value.supplierPrice
          : supplierPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseOrderItemDtoImpl extends _PurchaseOrderItemDto {
  const _$PurchaseOrderItemDtoImpl(
      {required this.id,
      this.variant,
      this.orderedQuantity,
      this.actualQuantity,
      this.supplierPrice,
      this.price})
      : super._();

  factory _$PurchaseOrderItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseOrderItemDtoImplFromJson(json);

  @override
  final int id;
  @override
  final ProductVariantDto? variant;
  @override
  final int? orderedQuantity;
  @override
  final int? actualQuantity;
  @override
  final double? supplierPrice;
  @override
  final double? price;

  @override
  String toString() {
    return 'PurchaseOrderItemDto(id: $id, variant: $variant, orderedQuantity: $orderedQuantity, actualQuantity: $actualQuantity, supplierPrice: $supplierPrice, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.orderedQuantity, orderedQuantity) ||
                other.orderedQuantity == orderedQuantity) &&
            (identical(other.actualQuantity, actualQuantity) ||
                other.actualQuantity == actualQuantity) &&
            (identical(other.supplierPrice, supplierPrice) ||
                other.supplierPrice == supplierPrice) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, variant, orderedQuantity,
      actualQuantity, supplierPrice, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderItemDtoImplCopyWith<_$PurchaseOrderItemDtoImpl>
      get copyWith =>
          __$$PurchaseOrderItemDtoImplCopyWithImpl<_$PurchaseOrderItemDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseOrderItemDtoImplToJson(
      this,
    );
  }
}

abstract class _PurchaseOrderItemDto extends PurchaseOrderItemDto {
  const factory _PurchaseOrderItemDto(
      {required final int id,
      final ProductVariantDto? variant,
      final int? orderedQuantity,
      final int? actualQuantity,
      final double? supplierPrice,
      final double? price}) = _$PurchaseOrderItemDtoImpl;
  const _PurchaseOrderItemDto._() : super._();

  factory _PurchaseOrderItemDto.fromJson(Map<String, dynamic> json) =
      _$PurchaseOrderItemDtoImpl.fromJson;

  @override
  int get id;
  @override
  ProductVariantDto? get variant;
  @override
  int? get orderedQuantity;
  @override
  int? get actualQuantity;
  @override
  double? get supplierPrice;
  @override
  double? get price;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseOrderItemDtoImplCopyWith<_$PurchaseOrderItemDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
