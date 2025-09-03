// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_sale_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductSaleHistory {
  String get displayName => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  PaginatedList<ProductSaleHistoryItem> get transactions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductSaleHistoryCopyWith<ProductSaleHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSaleHistoryCopyWith<$Res> {
  factory $ProductSaleHistoryCopyWith(
          ProductSaleHistory value, $Res Function(ProductSaleHistory) then) =
      _$ProductSaleHistoryCopyWithImpl<$Res, ProductSaleHistory>;
  @useResult
  $Res call(
      {String displayName,
      String sku,
      String category,
      PaginatedList<ProductSaleHistoryItem> transactions});

  $PaginatedListCopyWith<ProductSaleHistoryItem, $Res> get transactions;
}

/// @nodoc
class _$ProductSaleHistoryCopyWithImpl<$Res, $Val extends ProductSaleHistory>
    implements $ProductSaleHistoryCopyWith<$Res> {
  _$ProductSaleHistoryCopyWithImpl(this._value, this._then);

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
              as PaginatedList<ProductSaleHistoryItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginatedListCopyWith<ProductSaleHistoryItem, $Res> get transactions {
    return $PaginatedListCopyWith<ProductSaleHistoryItem, $Res>(
        _value.transactions, (value) {
      return _then(_value.copyWith(transactions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductSaleHistoryImplCopyWith<$Res>
    implements $ProductSaleHistoryCopyWith<$Res> {
  factory _$$ProductSaleHistoryImplCopyWith(_$ProductSaleHistoryImpl value,
          $Res Function(_$ProductSaleHistoryImpl) then) =
      __$$ProductSaleHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String displayName,
      String sku,
      String category,
      PaginatedList<ProductSaleHistoryItem> transactions});

  @override
  $PaginatedListCopyWith<ProductSaleHistoryItem, $Res> get transactions;
}

/// @nodoc
class __$$ProductSaleHistoryImplCopyWithImpl<$Res>
    extends _$ProductSaleHistoryCopyWithImpl<$Res, _$ProductSaleHistoryImpl>
    implements _$$ProductSaleHistoryImplCopyWith<$Res> {
  __$$ProductSaleHistoryImplCopyWithImpl(_$ProductSaleHistoryImpl _value,
      $Res Function(_$ProductSaleHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? sku = null,
    Object? category = null,
    Object? transactions = null,
  }) {
    return _then(_$ProductSaleHistoryImpl(
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
              as PaginatedList<ProductSaleHistoryItem>,
    ));
  }
}

/// @nodoc

class _$ProductSaleHistoryImpl implements _ProductSaleHistory {
  const _$ProductSaleHistoryImpl(
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
  final PaginatedList<ProductSaleHistoryItem> transactions;

  @override
  String toString() {
    return 'ProductSaleHistory(displayName: $displayName, sku: $sku, category: $category, transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductSaleHistoryImpl &&
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
  _$$ProductSaleHistoryImplCopyWith<_$ProductSaleHistoryImpl> get copyWith =>
      __$$ProductSaleHistoryImplCopyWithImpl<_$ProductSaleHistoryImpl>(
          this, _$identity);
}

abstract class _ProductSaleHistory implements ProductSaleHistory {
  const factory _ProductSaleHistory(
          {required final String displayName,
          required final String sku,
          required final String category,
          required final PaginatedList<ProductSaleHistoryItem> transactions}) =
      _$ProductSaleHistoryImpl;

  @override
  String get displayName;
  @override
  String get sku;
  @override
  String get category;
  @override
  PaginatedList<ProductSaleHistoryItem> get transactions;
  @override
  @JsonKey(ignore: true)
  _$$ProductSaleHistoryImplCopyWith<_$ProductSaleHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
