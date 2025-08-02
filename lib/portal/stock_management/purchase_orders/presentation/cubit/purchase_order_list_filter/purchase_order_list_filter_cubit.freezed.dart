// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_list_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PurchaseOrderListFilterState {
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  int? get branchId => throw _privateConstructorUsedError;
  StockOrderStatus? get status => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchaseOrderListFilterStateCopyWith<PurchaseOrderListFilterState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderListFilterStateCopyWith<$Res> {
  factory $PurchaseOrderListFilterStateCopyWith(
          PurchaseOrderListFilterState value,
          $Res Function(PurchaseOrderListFilterState) then) =
      _$PurchaseOrderListFilterStateCopyWithImpl<$Res,
          PurchaseOrderListFilterState>;
  @useResult
  $Res call(
      {int page,
      int size,
      int? branchId,
      StockOrderStatus? status,
      String? startDate,
      String? endDate});
}

/// @nodoc
class _$PurchaseOrderListFilterStateCopyWithImpl<$Res,
        $Val extends PurchaseOrderListFilterState>
    implements $PurchaseOrderListFilterStateCopyWith<$Res> {
  _$PurchaseOrderListFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? branchId = freezed,
    Object? status = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StockOrderStatus?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseOrderListFilterStateImplCopyWith<$Res>
    implements $PurchaseOrderListFilterStateCopyWith<$Res> {
  factory _$$PurchaseOrderListFilterStateImplCopyWith(
          _$PurchaseOrderListFilterStateImpl value,
          $Res Function(_$PurchaseOrderListFilterStateImpl) then) =
      __$$PurchaseOrderListFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      int size,
      int? branchId,
      StockOrderStatus? status,
      String? startDate,
      String? endDate});
}

/// @nodoc
class __$$PurchaseOrderListFilterStateImplCopyWithImpl<$Res>
    extends _$PurchaseOrderListFilterStateCopyWithImpl<$Res,
        _$PurchaseOrderListFilterStateImpl>
    implements _$$PurchaseOrderListFilterStateImplCopyWith<$Res> {
  __$$PurchaseOrderListFilterStateImplCopyWithImpl(
      _$PurchaseOrderListFilterStateImpl _value,
      $Res Function(_$PurchaseOrderListFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? size = null,
    Object? branchId = freezed,
    Object? status = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$PurchaseOrderListFilterStateImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StockOrderStatus?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PurchaseOrderListFilterStateImpl
    implements _PurchaseOrderListFilterState {
  const _$PurchaseOrderListFilterStateImpl(
      {this.page = 1,
      this.size = 20,
      this.branchId,
      this.status,
      this.startDate,
      this.endDate});

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;
  @override
  final int? branchId;
  @override
  final StockOrderStatus? status;
  @override
  final String? startDate;
  @override
  final String? endDate;

  @override
  String toString() {
    return 'PurchaseOrderListFilterState(page: $page, size: $size, branchId: $branchId, status: $status, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderListFilterStateImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, page, size, branchId, status, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderListFilterStateImplCopyWith<
          _$PurchaseOrderListFilterStateImpl>
      get copyWith => __$$PurchaseOrderListFilterStateImplCopyWithImpl<
          _$PurchaseOrderListFilterStateImpl>(this, _$identity);
}

abstract class _PurchaseOrderListFilterState
    implements PurchaseOrderListFilterState {
  const factory _PurchaseOrderListFilterState(
      {final int page,
      final int size,
      final int? branchId,
      final StockOrderStatus? status,
      final String? startDate,
      final String? endDate}) = _$PurchaseOrderListFilterStateImpl;

  @override
  int get page;
  @override
  int get size;
  @override
  int? get branchId;
  @override
  StockOrderStatus? get status;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$PurchaseOrderListFilterStateImplCopyWith<
          _$PurchaseOrderListFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
