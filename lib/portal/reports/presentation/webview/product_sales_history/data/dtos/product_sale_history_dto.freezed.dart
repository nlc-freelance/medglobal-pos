// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_sale_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductSaleHistoryDto {
  String get displayName => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  ApiPaginatedList<ProductSaleHistoryItemDto> get transactions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductSaleHistoryDtoCopyWith<ProductSaleHistoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSaleHistoryDtoCopyWith<$Res> {
  factory $ProductSaleHistoryDtoCopyWith(ProductSaleHistoryDto value,
          $Res Function(ProductSaleHistoryDto) then) =
      _$ProductSaleHistoryDtoCopyWithImpl<$Res, ProductSaleHistoryDto>;
  @useResult
  $Res call(
      {String displayName,
      String sku,
      String category,
      ApiPaginatedList<ProductSaleHistoryItemDto> transactions});
}

/// @nodoc
class _$ProductSaleHistoryDtoCopyWithImpl<$Res,
        $Val extends ProductSaleHistoryDto>
    implements $ProductSaleHistoryDtoCopyWith<$Res> {
  _$ProductSaleHistoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? sku = null,
    Object? category = null,
    Object? transactions = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as ApiPaginatedList<ProductSaleHistoryItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductSaleHistoryDtoImplCopyWith<$Res>
    implements $ProductSaleHistoryDtoCopyWith<$Res> {
  factory _$$ProductSaleHistoryDtoImplCopyWith(
          _$ProductSaleHistoryDtoImpl value,
          $Res Function(_$ProductSaleHistoryDtoImpl) then) =
      __$$ProductSaleHistoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String displayName,
      String sku,
      String category,
      ApiPaginatedList<ProductSaleHistoryItemDto> transactions});
}

/// @nodoc
class __$$ProductSaleHistoryDtoImplCopyWithImpl<$Res>
    extends _$ProductSaleHistoryDtoCopyWithImpl<$Res,
        _$ProductSaleHistoryDtoImpl>
    implements _$$ProductSaleHistoryDtoImplCopyWith<$Res> {
  __$$ProductSaleHistoryDtoImplCopyWithImpl(_$ProductSaleHistoryDtoImpl _value,
      $Res Function(_$ProductSaleHistoryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? sku = null,
    Object? category = null,
    Object? transactions = null,
  }) {
    return _then(_$ProductSaleHistoryDtoImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      sku: null == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as ApiPaginatedList<ProductSaleHistoryItemDto>,
    ));
  }
}

/// @nodoc

class _$ProductSaleHistoryDtoImpl implements _ProductSaleHistoryDto {
  const _$ProductSaleHistoryDtoImpl(
      {required this.displayName,
      required this.sku,
      required this.category,
      required this.transactions});

  @override
  final String displayName;
  @override
  final String sku;
  @override
  final String category;
  @override
  final ApiPaginatedList<ProductSaleHistoryItemDto> transactions;

  @override
  String toString() {
    return 'ProductSaleHistoryDto(displayName: $displayName, sku: $sku, category: $category, transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductSaleHistoryDtoImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.transactions, transactions) ||
                other.transactions == transactions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, displayName, sku, category, transactions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductSaleHistoryDtoImplCopyWith<_$ProductSaleHistoryDtoImpl>
      get copyWith => __$$ProductSaleHistoryDtoImplCopyWithImpl<
          _$ProductSaleHistoryDtoImpl>(this, _$identity);
}

abstract class _ProductSaleHistoryDto implements ProductSaleHistoryDto {
  const factory _ProductSaleHistoryDto(
      {required final String displayName,
      required final String sku,
      required final String category,
      required final ApiPaginatedList<ProductSaleHistoryItemDto>
          transactions}) = _$ProductSaleHistoryDtoImpl;

  @override
  String get displayName;
  @override
  String get sku;
  @override
  String get category;
  @override
  ApiPaginatedList<ProductSaleHistoryItemDto> get transactions;
  @override
  @JsonKey(ignore: true)
  _$$ProductSaleHistoryDtoImplCopyWith<_$ProductSaleHistoryDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
