// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionItemDto _$TransactionItemDtoFromJson(Map<String, dynamic> json) {
  return _TransactionItemDto.fromJson(json);
}

/// @nodoc
mixin _$TransactionItemDto {
  int get id => throw _privateConstructorUsedError;
  ProductVariantDto? get variant => throw _privateConstructorUsedError; // Lite
  int? get quantity => throw _privateConstructorUsedError;
  PriceDto? get price =>
      throw _privateConstructorUsedError; // double? discountedPrice,
// double? discount,
  String? get discountType => throw _privateConstructorUsedError;
  double? get discountValue => throw _privateConstructorUsedError;
  double? get discountInPeso => throw _privateConstructorUsedError;
  double? get subTotal => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  int? get restockQuantity => throw _privateConstructorUsedError;
  int? get writeOffQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionItemDtoCopyWith<TransactionItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionItemDtoCopyWith<$Res> {
  factory $TransactionItemDtoCopyWith(
          TransactionItemDto value, $Res Function(TransactionItemDto) then) =
      _$TransactionItemDtoCopyWithImpl<$Res, TransactionItemDto>;
  @useResult
  $Res call(
      {int id,
      ProductVariantDto? variant,
      int? quantity,
      PriceDto? price,
      String? discountType,
      double? discountValue,
      double? discountInPeso,
      double? subTotal,
      double? total,
      String? comment,
      int? restockQuantity,
      int? writeOffQuantity});
}

/// @nodoc
class _$TransactionItemDtoCopyWithImpl<$Res, $Val extends TransactionItemDto>
    implements $TransactionItemDtoCopyWith<$Res> {
  _$TransactionItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? variant = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? discountInPeso = freezed,
    Object? subTotal = freezed,
    Object? total = freezed,
    Object? comment = freezed,
    Object? restockQuantity = freezed,
    Object? writeOffQuantity = freezed,
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
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceDto?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      discountInPeso: freezed == discountInPeso
          ? _value.discountInPeso
          : discountInPeso // ignore: cast_nullable_to_non_nullable
              as double?,
      subTotal: freezed == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      restockQuantity: freezed == restockQuantity
          ? _value.restockQuantity
          : restockQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      writeOffQuantity: freezed == writeOffQuantity
          ? _value.writeOffQuantity
          : writeOffQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionItemDtoImplCopyWith<$Res>
    implements $TransactionItemDtoCopyWith<$Res> {
  factory _$$TransactionItemDtoImplCopyWith(_$TransactionItemDtoImpl value,
          $Res Function(_$TransactionItemDtoImpl) then) =
      __$$TransactionItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      ProductVariantDto? variant,
      int? quantity,
      PriceDto? price,
      String? discountType,
      double? discountValue,
      double? discountInPeso,
      double? subTotal,
      double? total,
      String? comment,
      int? restockQuantity,
      int? writeOffQuantity});
}

/// @nodoc
class __$$TransactionItemDtoImplCopyWithImpl<$Res>
    extends _$TransactionItemDtoCopyWithImpl<$Res, _$TransactionItemDtoImpl>
    implements _$$TransactionItemDtoImplCopyWith<$Res> {
  __$$TransactionItemDtoImplCopyWithImpl(_$TransactionItemDtoImpl _value,
      $Res Function(_$TransactionItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? variant = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? discountInPeso = freezed,
    Object? subTotal = freezed,
    Object? total = freezed,
    Object? comment = freezed,
    Object? restockQuantity = freezed,
    Object? writeOffQuantity = freezed,
  }) {
    return _then(_$TransactionItemDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      variant: freezed == variant
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as ProductVariantDto?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceDto?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      discountInPeso: freezed == discountInPeso
          ? _value.discountInPeso
          : discountInPeso // ignore: cast_nullable_to_non_nullable
              as double?,
      subTotal: freezed == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      restockQuantity: freezed == restockQuantity
          ? _value.restockQuantity
          : restockQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      writeOffQuantity: freezed == writeOffQuantity
          ? _value.writeOffQuantity
          : writeOffQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionItemDtoImpl implements _TransactionItemDto {
  const _$TransactionItemDtoImpl(
      {required this.id,
      this.variant,
      this.quantity,
      this.price,
      this.discountType,
      this.discountValue,
      this.discountInPeso,
      this.subTotal,
      this.total,
      this.comment,
      this.restockQuantity,
      this.writeOffQuantity});

  factory _$TransactionItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionItemDtoImplFromJson(json);

  @override
  final int id;
  @override
  final ProductVariantDto? variant;
// Lite
  @override
  final int? quantity;
  @override
  final PriceDto? price;
// double? discountedPrice,
// double? discount,
  @override
  final String? discountType;
  @override
  final double? discountValue;
  @override
  final double? discountInPeso;
  @override
  final double? subTotal;
  @override
  final double? total;
  @override
  final String? comment;
  @override
  final int? restockQuantity;
  @override
  final int? writeOffQuantity;

  @override
  String toString() {
    return 'TransactionItemDto(id: $id, variant: $variant, quantity: $quantity, price: $price, discountType: $discountType, discountValue: $discountValue, discountInPeso: $discountInPeso, subTotal: $subTotal, total: $total, comment: $comment, restockQuantity: $restockQuantity, writeOffQuantity: $writeOffQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.discountInPeso, discountInPeso) ||
                other.discountInPeso == discountInPeso) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.restockQuantity, restockQuantity) ||
                other.restockQuantity == restockQuantity) &&
            (identical(other.writeOffQuantity, writeOffQuantity) ||
                other.writeOffQuantity == writeOffQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      variant,
      quantity,
      price,
      discountType,
      discountValue,
      discountInPeso,
      subTotal,
      total,
      comment,
      restockQuantity,
      writeOffQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionItemDtoImplCopyWith<_$TransactionItemDtoImpl> get copyWith =>
      __$$TransactionItemDtoImplCopyWithImpl<_$TransactionItemDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionItemDtoImplToJson(
      this,
    );
  }
}

abstract class _TransactionItemDto implements TransactionItemDto {
  const factory _TransactionItemDto(
      {required final int id,
      final ProductVariantDto? variant,
      final int? quantity,
      final PriceDto? price,
      final String? discountType,
      final double? discountValue,
      final double? discountInPeso,
      final double? subTotal,
      final double? total,
      final String? comment,
      final int? restockQuantity,
      final int? writeOffQuantity}) = _$TransactionItemDtoImpl;

  factory _TransactionItemDto.fromJson(Map<String, dynamic> json) =
      _$TransactionItemDtoImpl.fromJson;

  @override
  int get id;
  @override
  ProductVariantDto? get variant;
  @override // Lite
  int? get quantity;
  @override
  PriceDto? get price;
  @override // double? discountedPrice,
// double? discount,
  String? get discountType;
  @override
  double? get discountValue;
  @override
  double? get discountInPeso;
  @override
  double? get subTotal;
  @override
  double? get total;
  @override
  String? get comment;
  @override
  int? get restockQuantity;
  @override
  int? get writeOffQuantity;
  @override
  @JsonKey(ignore: true)
  _$$TransactionItemDtoImplCopyWith<_$TransactionItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
