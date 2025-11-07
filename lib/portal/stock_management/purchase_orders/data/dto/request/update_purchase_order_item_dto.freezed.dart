// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_purchase_order_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdatePurchaseOrderItemDto _$UpdatePurchaseOrderItemDtoFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'save':
      return UpdatePurchaseOrderItemDtoSave.fromJson(json);
    case 'saveAndMarkAsShippedWithNewItems':
      return UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems
          .fromJson(json);
    case 'saveAndMarkAsShipped':
      return UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped.fromJson(json);
    case 'saveAndReceived':
      return UpdatePurchaseOrderItemDtoSaveAndReceived.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'UpdatePurchaseOrderItemDto',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UpdatePurchaseOrderItemDto {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int variantId, int? orderedQuantity, double supplierPrice)
        save,
    required TResult Function(
            int variantId, int orderedQuantity, double supplierPrice)
        saveAndMarkAsShippedWithNewItems,
    required TResult Function(int id, int orderedQuantity, double supplierPrice)
        saveAndMarkAsShipped,
    required TResult Function(int id, int receivedQuantity) saveAndReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int variantId, int? orderedQuantity, double supplierPrice)?
        save,
    TResult? Function(int variantId, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShippedWithNewItems,
    TResult? Function(int id, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShipped,
    TResult? Function(int id, int receivedQuantity)? saveAndReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int variantId, int? orderedQuantity, double supplierPrice)?
        save,
    TResult Function(int variantId, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShippedWithNewItems,
    TResult Function(int id, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShipped,
    TResult Function(int id, int receivedQuantity)? saveAndReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePurchaseOrderItemDtoSave value) save,
    required TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)
        saveAndMarkAsShippedWithNewItems,
    required TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)
        saveAndMarkAsShipped,
    required TResult Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)
        saveAndReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePurchaseOrderItemDtoSave value)? save,
    TResult? Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)?
        saveAndMarkAsShippedWithNewItems,
    TResult? Function(UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)?
        saveAndMarkAsShipped,
    TResult? Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)?
        saveAndReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePurchaseOrderItemDtoSave value)? save,
    TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)?
        saveAndMarkAsShippedWithNewItems,
    TResult Function(UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)?
        saveAndMarkAsShipped,
    TResult Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)?
        saveAndReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePurchaseOrderItemDtoCopyWith<$Res> {
  factory $UpdatePurchaseOrderItemDtoCopyWith(UpdatePurchaseOrderItemDto value,
          $Res Function(UpdatePurchaseOrderItemDto) then) =
      _$UpdatePurchaseOrderItemDtoCopyWithImpl<$Res,
          UpdatePurchaseOrderItemDto>;
}

/// @nodoc
class _$UpdatePurchaseOrderItemDtoCopyWithImpl<$Res,
        $Val extends UpdatePurchaseOrderItemDto>
    implements $UpdatePurchaseOrderItemDtoCopyWith<$Res> {
  _$UpdatePurchaseOrderItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdatePurchaseOrderItemDtoSaveImplCopyWith<$Res> {
  factory _$$UpdatePurchaseOrderItemDtoSaveImplCopyWith(
          _$UpdatePurchaseOrderItemDtoSaveImpl value,
          $Res Function(_$UpdatePurchaseOrderItemDtoSaveImpl) then) =
      __$$UpdatePurchaseOrderItemDtoSaveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int variantId, int? orderedQuantity, double supplierPrice});
}

/// @nodoc
class __$$UpdatePurchaseOrderItemDtoSaveImplCopyWithImpl<$Res>
    extends _$UpdatePurchaseOrderItemDtoCopyWithImpl<$Res,
        _$UpdatePurchaseOrderItemDtoSaveImpl>
    implements _$$UpdatePurchaseOrderItemDtoSaveImplCopyWith<$Res> {
  __$$UpdatePurchaseOrderItemDtoSaveImplCopyWithImpl(
      _$UpdatePurchaseOrderItemDtoSaveImpl _value,
      $Res Function(_$UpdatePurchaseOrderItemDtoSaveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variantId = null,
    Object? orderedQuantity = freezed,
    Object? supplierPrice = null,
  }) {
    return _then(_$UpdatePurchaseOrderItemDtoSaveImpl(
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int,
      orderedQuantity: freezed == orderedQuantity
          ? _value.orderedQuantity
          : orderedQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierPrice: null == supplierPrice
          ? _value.supplierPrice
          : supplierPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePurchaseOrderItemDtoSaveImpl
    implements UpdatePurchaseOrderItemDtoSave {
  const _$UpdatePurchaseOrderItemDtoSaveImpl(
      {required this.variantId,
      this.orderedQuantity,
      required this.supplierPrice,
      final String? $type})
      : $type = $type ?? 'save';

  factory _$UpdatePurchaseOrderItemDtoSaveImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdatePurchaseOrderItemDtoSaveImplFromJson(json);

  @override
  final int variantId;
  @override
  final int? orderedQuantity;
  @override
  final double supplierPrice;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UpdatePurchaseOrderItemDto.save(variantId: $variantId, orderedQuantity: $orderedQuantity, supplierPrice: $supplierPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePurchaseOrderItemDtoSaveImpl &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.orderedQuantity, orderedQuantity) ||
                other.orderedQuantity == orderedQuantity) &&
            (identical(other.supplierPrice, supplierPrice) ||
                other.supplierPrice == supplierPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, variantId, orderedQuantity, supplierPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePurchaseOrderItemDtoSaveImplCopyWith<
          _$UpdatePurchaseOrderItemDtoSaveImpl>
      get copyWith => __$$UpdatePurchaseOrderItemDtoSaveImplCopyWithImpl<
          _$UpdatePurchaseOrderItemDtoSaveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int variantId, int? orderedQuantity, double supplierPrice)
        save,
    required TResult Function(
            int variantId, int orderedQuantity, double supplierPrice)
        saveAndMarkAsShippedWithNewItems,
    required TResult Function(int id, int orderedQuantity, double supplierPrice)
        saveAndMarkAsShipped,
    required TResult Function(int id, int receivedQuantity) saveAndReceived,
  }) {
    return save(variantId, orderedQuantity, supplierPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int variantId, int? orderedQuantity, double supplierPrice)?
        save,
    TResult? Function(int variantId, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShippedWithNewItems,
    TResult? Function(int id, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShipped,
    TResult? Function(int id, int receivedQuantity)? saveAndReceived,
  }) {
    return save?.call(variantId, orderedQuantity, supplierPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int variantId, int? orderedQuantity, double supplierPrice)?
        save,
    TResult Function(int variantId, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShippedWithNewItems,
    TResult Function(int id, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShipped,
    TResult Function(int id, int receivedQuantity)? saveAndReceived,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(variantId, orderedQuantity, supplierPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePurchaseOrderItemDtoSave value) save,
    required TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)
        saveAndMarkAsShippedWithNewItems,
    required TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)
        saveAndMarkAsShipped,
    required TResult Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)
        saveAndReceived,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePurchaseOrderItemDtoSave value)? save,
    TResult? Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)?
        saveAndMarkAsShippedWithNewItems,
    TResult? Function(UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)?
        saveAndMarkAsShipped,
    TResult? Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)?
        saveAndReceived,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePurchaseOrderItemDtoSave value)? save,
    TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)?
        saveAndMarkAsShippedWithNewItems,
    TResult Function(UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)?
        saveAndMarkAsShipped,
    TResult Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)?
        saveAndReceived,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePurchaseOrderItemDtoSaveImplToJson(
      this,
    );
  }
}

abstract class UpdatePurchaseOrderItemDtoSave
    implements UpdatePurchaseOrderItemDto {
  const factory UpdatePurchaseOrderItemDtoSave(
          {required final int variantId,
          final int? orderedQuantity,
          required final double supplierPrice}) =
      _$UpdatePurchaseOrderItemDtoSaveImpl;

  factory UpdatePurchaseOrderItemDtoSave.fromJson(Map<String, dynamic> json) =
      _$UpdatePurchaseOrderItemDtoSaveImpl.fromJson;

  int get variantId;
  int? get orderedQuantity;
  double get supplierPrice;
  @JsonKey(ignore: true)
  _$$UpdatePurchaseOrderItemDtoSaveImplCopyWith<
          _$UpdatePurchaseOrderItemDtoSaveImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImplCopyWith<
    $Res> {
  factory _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImplCopyWith(
          _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl value,
          $Res Function(
                  _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl)
              then) =
      __$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImplCopyWithImpl<
          $Res>;
  @useResult
  $Res call({int variantId, int orderedQuantity, double supplierPrice});
}

/// @nodoc
class __$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImplCopyWithImpl<
        $Res>
    extends _$UpdatePurchaseOrderItemDtoCopyWithImpl<$Res,
        _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl>
    implements
        _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImplCopyWith<
            $Res> {
  __$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImplCopyWithImpl(
      _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl _value,
      $Res Function(
              _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variantId = null,
    Object? orderedQuantity = null,
    Object? supplierPrice = null,
  }) {
    return _then(
        _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl(
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int,
      orderedQuantity: null == orderedQuantity
          ? _value.orderedQuantity
          : orderedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      supplierPrice: null == supplierPrice
          ? _value.supplierPrice
          : supplierPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl
    implements UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems {
  const _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl(
      {required this.variantId,
      required this.orderedQuantity,
      required this.supplierPrice,
      final String? $type})
      : $type = $type ?? 'saveAndMarkAsShippedWithNewItems';

  factory _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImplFromJson(
          json);

  @override
  final int variantId;
  @override
  final int orderedQuantity;
  @override
  final double supplierPrice;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UpdatePurchaseOrderItemDto.saveAndMarkAsShippedWithNewItems(variantId: $variantId, orderedQuantity: $orderedQuantity, supplierPrice: $supplierPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other
                is _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.orderedQuantity, orderedQuantity) ||
                other.orderedQuantity == orderedQuantity) &&
            (identical(other.supplierPrice, supplierPrice) ||
                other.supplierPrice == supplierPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, variantId, orderedQuantity, supplierPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImplCopyWith<
          _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl>
      get copyWith =>
          __$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImplCopyWithImpl<
                  _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int variantId, int? orderedQuantity, double supplierPrice)
        save,
    required TResult Function(
            int variantId, int orderedQuantity, double supplierPrice)
        saveAndMarkAsShippedWithNewItems,
    required TResult Function(int id, int orderedQuantity, double supplierPrice)
        saveAndMarkAsShipped,
    required TResult Function(int id, int receivedQuantity) saveAndReceived,
  }) {
    return saveAndMarkAsShippedWithNewItems(
        variantId, orderedQuantity, supplierPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int variantId, int? orderedQuantity, double supplierPrice)?
        save,
    TResult? Function(int variantId, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShippedWithNewItems,
    TResult? Function(int id, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShipped,
    TResult? Function(int id, int receivedQuantity)? saveAndReceived,
  }) {
    return saveAndMarkAsShippedWithNewItems?.call(
        variantId, orderedQuantity, supplierPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int variantId, int? orderedQuantity, double supplierPrice)?
        save,
    TResult Function(int variantId, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShippedWithNewItems,
    TResult Function(int id, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShipped,
    TResult Function(int id, int receivedQuantity)? saveAndReceived,
    required TResult orElse(),
  }) {
    if (saveAndMarkAsShippedWithNewItems != null) {
      return saveAndMarkAsShippedWithNewItems(
          variantId, orderedQuantity, supplierPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePurchaseOrderItemDtoSave value) save,
    required TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)
        saveAndMarkAsShippedWithNewItems,
    required TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)
        saveAndMarkAsShipped,
    required TResult Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)
        saveAndReceived,
  }) {
    return saveAndMarkAsShippedWithNewItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePurchaseOrderItemDtoSave value)? save,
    TResult? Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)?
        saveAndMarkAsShippedWithNewItems,
    TResult? Function(UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)?
        saveAndMarkAsShipped,
    TResult? Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)?
        saveAndReceived,
  }) {
    return saveAndMarkAsShippedWithNewItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePurchaseOrderItemDtoSave value)? save,
    TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)?
        saveAndMarkAsShippedWithNewItems,
    TResult Function(UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)?
        saveAndMarkAsShipped,
    TResult Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)?
        saveAndReceived,
    required TResult orElse(),
  }) {
    if (saveAndMarkAsShippedWithNewItems != null) {
      return saveAndMarkAsShippedWithNewItems(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImplToJson(
      this,
    );
  }
}

abstract class UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems
    implements UpdatePurchaseOrderItemDto {
  const factory UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems(
          {required final int variantId,
          required final int orderedQuantity,
          required final double supplierPrice}) =
      _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl;

  factory UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems.fromJson(
          Map<String, dynamic> json) =
      _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl.fromJson;

  int get variantId;
  int get orderedQuantity;
  double get supplierPrice;
  @JsonKey(ignore: true)
  _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImplCopyWith<
          _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItemsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImplCopyWith<
    $Res> {
  factory _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImplCopyWith(
          _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl value,
          $Res Function(_$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl)
              then) =
      __$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, int orderedQuantity, double supplierPrice});
}

/// @nodoc
class __$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImplCopyWithImpl<$Res>
    extends _$UpdatePurchaseOrderItemDtoCopyWithImpl<$Res,
        _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl>
    implements
        _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImplCopyWith<$Res> {
  __$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImplCopyWithImpl(
      _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl _value,
      $Res Function(_$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderedQuantity = null,
    Object? supplierPrice = null,
  }) {
    return _then(_$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderedQuantity: null == orderedQuantity
          ? _value.orderedQuantity
          : orderedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      supplierPrice: null == supplierPrice
          ? _value.supplierPrice
          : supplierPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl
    implements UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped {
  const _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl(
      {required this.id,
      required this.orderedQuantity,
      required this.supplierPrice,
      final String? $type})
      : $type = $type ?? 'saveAndMarkAsShipped';

  factory _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImplFromJson(json);

  @override
  final int id;
  @override
  final int orderedQuantity;
  @override
  final double supplierPrice;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UpdatePurchaseOrderItemDto.saveAndMarkAsShipped(id: $id, orderedQuantity: $orderedQuantity, supplierPrice: $supplierPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderedQuantity, orderedQuantity) ||
                other.orderedQuantity == orderedQuantity) &&
            (identical(other.supplierPrice, supplierPrice) ||
                other.supplierPrice == supplierPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, orderedQuantity, supplierPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImplCopyWith<
          _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl>
      get copyWith =>
          __$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImplCopyWithImpl<
                  _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int variantId, int? orderedQuantity, double supplierPrice)
        save,
    required TResult Function(
            int variantId, int orderedQuantity, double supplierPrice)
        saveAndMarkAsShippedWithNewItems,
    required TResult Function(int id, int orderedQuantity, double supplierPrice)
        saveAndMarkAsShipped,
    required TResult Function(int id, int receivedQuantity) saveAndReceived,
  }) {
    return saveAndMarkAsShipped(id, orderedQuantity, supplierPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int variantId, int? orderedQuantity, double supplierPrice)?
        save,
    TResult? Function(int variantId, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShippedWithNewItems,
    TResult? Function(int id, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShipped,
    TResult? Function(int id, int receivedQuantity)? saveAndReceived,
  }) {
    return saveAndMarkAsShipped?.call(id, orderedQuantity, supplierPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int variantId, int? orderedQuantity, double supplierPrice)?
        save,
    TResult Function(int variantId, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShippedWithNewItems,
    TResult Function(int id, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShipped,
    TResult Function(int id, int receivedQuantity)? saveAndReceived,
    required TResult orElse(),
  }) {
    if (saveAndMarkAsShipped != null) {
      return saveAndMarkAsShipped(id, orderedQuantity, supplierPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePurchaseOrderItemDtoSave value) save,
    required TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)
        saveAndMarkAsShippedWithNewItems,
    required TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)
        saveAndMarkAsShipped,
    required TResult Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)
        saveAndReceived,
  }) {
    return saveAndMarkAsShipped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePurchaseOrderItemDtoSave value)? save,
    TResult? Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)?
        saveAndMarkAsShippedWithNewItems,
    TResult? Function(UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)?
        saveAndMarkAsShipped,
    TResult? Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)?
        saveAndReceived,
  }) {
    return saveAndMarkAsShipped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePurchaseOrderItemDtoSave value)? save,
    TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)?
        saveAndMarkAsShippedWithNewItems,
    TResult Function(UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)?
        saveAndMarkAsShipped,
    TResult Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)?
        saveAndReceived,
    required TResult orElse(),
  }) {
    if (saveAndMarkAsShipped != null) {
      return saveAndMarkAsShipped(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImplToJson(
      this,
    );
  }
}

abstract class UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped
    implements UpdatePurchaseOrderItemDto {
  const factory UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped(
          {required final int id,
          required final int orderedQuantity,
          required final double supplierPrice}) =
      _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl;

  factory UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped.fromJson(
          Map<String, dynamic> json) =
      _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl.fromJson;

  int get id;
  int get orderedQuantity;
  double get supplierPrice;
  @JsonKey(ignore: true)
  _$$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImplCopyWith<
          _$UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePurchaseOrderItemDtoSaveAndReceivedImplCopyWith<$Res> {
  factory _$$UpdatePurchaseOrderItemDtoSaveAndReceivedImplCopyWith(
          _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl value,
          $Res Function(_$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl) then) =
      __$$UpdatePurchaseOrderItemDtoSaveAndReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, int receivedQuantity});
}

/// @nodoc
class __$$UpdatePurchaseOrderItemDtoSaveAndReceivedImplCopyWithImpl<$Res>
    extends _$UpdatePurchaseOrderItemDtoCopyWithImpl<$Res,
        _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl>
    implements _$$UpdatePurchaseOrderItemDtoSaveAndReceivedImplCopyWith<$Res> {
  __$$UpdatePurchaseOrderItemDtoSaveAndReceivedImplCopyWithImpl(
      _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl _value,
      $Res Function(_$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receivedQuantity = null,
  }) {
    return _then(_$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      receivedQuantity: null == receivedQuantity
          ? _value.receivedQuantity
          : receivedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl
    implements UpdatePurchaseOrderItemDtoSaveAndReceived {
  const _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl(
      {required this.id, required this.receivedQuantity, final String? $type})
      : $type = $type ?? 'saveAndReceived';

  factory _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdatePurchaseOrderItemDtoSaveAndReceivedImplFromJson(json);

  @override
  final int id;
  @override
  final int receivedQuantity;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UpdatePurchaseOrderItemDto.saveAndReceived(id: $id, receivedQuantity: $receivedQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.receivedQuantity, receivedQuantity) ||
                other.receivedQuantity == receivedQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, receivedQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePurchaseOrderItemDtoSaveAndReceivedImplCopyWith<
          _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl>
      get copyWith =>
          __$$UpdatePurchaseOrderItemDtoSaveAndReceivedImplCopyWithImpl<
                  _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int variantId, int? orderedQuantity, double supplierPrice)
        save,
    required TResult Function(
            int variantId, int orderedQuantity, double supplierPrice)
        saveAndMarkAsShippedWithNewItems,
    required TResult Function(int id, int orderedQuantity, double supplierPrice)
        saveAndMarkAsShipped,
    required TResult Function(int id, int receivedQuantity) saveAndReceived,
  }) {
    return saveAndReceived(id, receivedQuantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            int variantId, int? orderedQuantity, double supplierPrice)?
        save,
    TResult? Function(int variantId, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShippedWithNewItems,
    TResult? Function(int id, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShipped,
    TResult? Function(int id, int receivedQuantity)? saveAndReceived,
  }) {
    return saveAndReceived?.call(id, receivedQuantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int variantId, int? orderedQuantity, double supplierPrice)?
        save,
    TResult Function(int variantId, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShippedWithNewItems,
    TResult Function(int id, int orderedQuantity, double supplierPrice)?
        saveAndMarkAsShipped,
    TResult Function(int id, int receivedQuantity)? saveAndReceived,
    required TResult orElse(),
  }) {
    if (saveAndReceived != null) {
      return saveAndReceived(id, receivedQuantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePurchaseOrderItemDtoSave value) save,
    required TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)
        saveAndMarkAsShippedWithNewItems,
    required TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)
        saveAndMarkAsShipped,
    required TResult Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)
        saveAndReceived,
  }) {
    return saveAndReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePurchaseOrderItemDtoSave value)? save,
    TResult? Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)?
        saveAndMarkAsShippedWithNewItems,
    TResult? Function(UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)?
        saveAndMarkAsShipped,
    TResult? Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)?
        saveAndReceived,
  }) {
    return saveAndReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePurchaseOrderItemDtoSave value)? save,
    TResult Function(
            UpdatePurchaseOrderItemDtoSaveAndMarkAsShippedWithNewItems value)?
        saveAndMarkAsShippedWithNewItems,
    TResult Function(UpdatePurchaseOrderItemDtoSaveAndMarkAsShipped value)?
        saveAndMarkAsShipped,
    TResult Function(UpdatePurchaseOrderItemDtoSaveAndReceived value)?
        saveAndReceived,
    required TResult orElse(),
  }) {
    if (saveAndReceived != null) {
      return saveAndReceived(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePurchaseOrderItemDtoSaveAndReceivedImplToJson(
      this,
    );
  }
}

abstract class UpdatePurchaseOrderItemDtoSaveAndReceived
    implements UpdatePurchaseOrderItemDto {
  const factory UpdatePurchaseOrderItemDtoSaveAndReceived(
          {required final int id, required final int receivedQuantity}) =
      _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl;

  factory UpdatePurchaseOrderItemDtoSaveAndReceived.fromJson(
          Map<String, dynamic> json) =
      _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl.fromJson;

  int get id;
  int get receivedQuantity;
  @JsonKey(ignore: true)
  _$$UpdatePurchaseOrderItemDtoSaveAndReceivedImplCopyWith<
          _$UpdatePurchaseOrderItemDtoSaveAndReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
