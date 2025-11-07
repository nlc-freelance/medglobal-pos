// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_purchase_order_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewPurchaseOrderFormState {
  int? get branchId => throw _privateConstructorUsedError;
  int? get supplierId => throw _privateConstructorUsedError;
  bool get isAutoFill => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPurchaseOrderFormStateCopyWith<NewPurchaseOrderFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPurchaseOrderFormStateCopyWith<$Res> {
  factory $NewPurchaseOrderFormStateCopyWith(NewPurchaseOrderFormState value,
          $Res Function(NewPurchaseOrderFormState) then) =
      _$NewPurchaseOrderFormStateCopyWithImpl<$Res, NewPurchaseOrderFormState>;
  @useResult
  $Res call({int? branchId, int? supplierId, bool isAutoFill});
}

/// @nodoc
class _$NewPurchaseOrderFormStateCopyWithImpl<$Res,
        $Val extends NewPurchaseOrderFormState>
    implements $NewPurchaseOrderFormStateCopyWith<$Res> {
  _$NewPurchaseOrderFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchId = freezed,
    Object? supplierId = freezed,
    Object? isAutoFill = null,
  }) {
    return _then(_value.copyWith(
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierId: freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAutoFill: null == isAutoFill
          ? _value.isAutoFill
          : isAutoFill // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewPurchaseOrderFormStateImplCopyWith<$Res>
    implements $NewPurchaseOrderFormStateCopyWith<$Res> {
  factory _$$NewPurchaseOrderFormStateImplCopyWith(
          _$NewPurchaseOrderFormStateImpl value,
          $Res Function(_$NewPurchaseOrderFormStateImpl) then) =
      __$$NewPurchaseOrderFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? branchId, int? supplierId, bool isAutoFill});
}

/// @nodoc
class __$$NewPurchaseOrderFormStateImplCopyWithImpl<$Res>
    extends _$NewPurchaseOrderFormStateCopyWithImpl<$Res,
        _$NewPurchaseOrderFormStateImpl>
    implements _$$NewPurchaseOrderFormStateImplCopyWith<$Res> {
  __$$NewPurchaseOrderFormStateImplCopyWithImpl(
      _$NewPurchaseOrderFormStateImpl _value,
      $Res Function(_$NewPurchaseOrderFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchId = freezed,
    Object? supplierId = freezed,
    Object? isAutoFill = null,
  }) {
    return _then(_$NewPurchaseOrderFormStateImpl(
      branchId: freezed == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierId: freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
      isAutoFill: null == isAutoFill
          ? _value.isAutoFill
          : isAutoFill // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NewPurchaseOrderFormStateImpl extends _NewPurchaseOrderFormState {
  const _$NewPurchaseOrderFormStateImpl(
      {this.branchId, this.supplierId, this.isAutoFill = false})
      : super._();

  @override
  final int? branchId;
  @override
  final int? supplierId;
  @override
  @JsonKey()
  final bool isAutoFill;

  @override
  String toString() {
    return 'NewPurchaseOrderFormState(branchId: $branchId, supplierId: $supplierId, isAutoFill: $isAutoFill)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPurchaseOrderFormStateImpl &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.isAutoFill, isAutoFill) ||
                other.isAutoFill == isAutoFill));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, branchId, supplierId, isAutoFill);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPurchaseOrderFormStateImplCopyWith<_$NewPurchaseOrderFormStateImpl>
      get copyWith => __$$NewPurchaseOrderFormStateImplCopyWithImpl<
          _$NewPurchaseOrderFormStateImpl>(this, _$identity);
}

abstract class _NewPurchaseOrderFormState extends NewPurchaseOrderFormState {
  const factory _NewPurchaseOrderFormState(
      {final int? branchId,
      final int? supplierId,
      final bool isAutoFill}) = _$NewPurchaseOrderFormStateImpl;
  const _NewPurchaseOrderFormState._() : super._();

  @override
  int? get branchId;
  @override
  int? get supplierId;
  @override
  bool get isAutoFill;
  @override
  @JsonKey(ignore: true)
  _$$NewPurchaseOrderFormStateImplCopyWith<_$NewPurchaseOrderFormStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
