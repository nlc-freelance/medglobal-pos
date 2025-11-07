// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_refund_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateRefundDto _$CreateRefundDtoFromJson(Map<String, dynamic> json) {
  return _CreateRefundDto.fromJson(json);
}

/// @nodoc
mixin _$CreateRefundDto {
  int get registerId => throw _privateConstructorUsedError;
  int get saleTransactionId => throw _privateConstructorUsedError;
  List<CreateRefundItemDto> get items => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateRefundDtoCopyWith<CreateRefundDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRefundDtoCopyWith<$Res> {
  factory $CreateRefundDtoCopyWith(
          CreateRefundDto value, $Res Function(CreateRefundDto) then) =
      _$CreateRefundDtoCopyWithImpl<$Res, CreateRefundDto>;
  @useResult
  $Res call(
      {int registerId,
      int saleTransactionId,
      List<CreateRefundItemDto> items,
      String? notes});
}

/// @nodoc
class _$CreateRefundDtoCopyWithImpl<$Res, $Val extends CreateRefundDto>
    implements $CreateRefundDtoCopyWith<$Res> {
  _$CreateRefundDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerId = null,
    Object? saleTransactionId = null,
    Object? items = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      registerId: null == registerId
          ? _value.registerId
          : registerId // ignore: cast_nullable_to_non_nullable
              as int,
      saleTransactionId: null == saleTransactionId
          ? _value.saleTransactionId
          : saleTransactionId // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CreateRefundItemDto>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateRefundDtoImplCopyWith<$Res>
    implements $CreateRefundDtoCopyWith<$Res> {
  factory _$$CreateRefundDtoImplCopyWith(_$CreateRefundDtoImpl value,
          $Res Function(_$CreateRefundDtoImpl) then) =
      __$$CreateRefundDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int registerId,
      int saleTransactionId,
      List<CreateRefundItemDto> items,
      String? notes});
}

/// @nodoc
class __$$CreateRefundDtoImplCopyWithImpl<$Res>
    extends _$CreateRefundDtoCopyWithImpl<$Res, _$CreateRefundDtoImpl>
    implements _$$CreateRefundDtoImplCopyWith<$Res> {
  __$$CreateRefundDtoImplCopyWithImpl(
      _$CreateRefundDtoImpl _value, $Res Function(_$CreateRefundDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerId = null,
    Object? saleTransactionId = null,
    Object? items = null,
    Object? notes = freezed,
  }) {
    return _then(_$CreateRefundDtoImpl(
      registerId: null == registerId
          ? _value.registerId
          : registerId // ignore: cast_nullable_to_non_nullable
              as int,
      saleTransactionId: null == saleTransactionId
          ? _value.saleTransactionId
          : saleTransactionId // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CreateRefundItemDto>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateRefundDtoImpl implements _CreateRefundDto {
  const _$CreateRefundDtoImpl(
      {required this.registerId,
      required this.saleTransactionId,
      required final List<CreateRefundItemDto> items,
      this.notes})
      : _items = items;

  factory _$CreateRefundDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRefundDtoImplFromJson(json);

  @override
  final int registerId;
  @override
  final int saleTransactionId;
  final List<CreateRefundItemDto> _items;
  @override
  List<CreateRefundItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? notes;

  @override
  String toString() {
    return 'CreateRefundDto(registerId: $registerId, saleTransactionId: $saleTransactionId, items: $items, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRefundDtoImpl &&
            (identical(other.registerId, registerId) ||
                other.registerId == registerId) &&
            (identical(other.saleTransactionId, saleTransactionId) ||
                other.saleTransactionId == saleTransactionId) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, registerId, saleTransactionId,
      const DeepCollectionEquality().hash(_items), notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRefundDtoImplCopyWith<_$CreateRefundDtoImpl> get copyWith =>
      __$$CreateRefundDtoImplCopyWithImpl<_$CreateRefundDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRefundDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateRefundDto implements CreateRefundDto {
  const factory _CreateRefundDto(
      {required final int registerId,
      required final int saleTransactionId,
      required final List<CreateRefundItemDto> items,
      final String? notes}) = _$CreateRefundDtoImpl;

  factory _CreateRefundDto.fromJson(Map<String, dynamic> json) =
      _$CreateRefundDtoImpl.fromJson;

  @override
  int get registerId;
  @override
  int get saleTransactionId;
  @override
  List<CreateRefundItemDto> get items;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$CreateRefundDtoImplCopyWith<_$CreateRefundDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateRefundItemDto _$CreateRefundItemDtoFromJson(Map<String, dynamic> json) {
  return _CreateRefundItemDto.fromJson(json);
}

/// @nodoc
mixin _$CreateRefundItemDto {
  int get variantId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateRefundItemDtoCopyWith<CreateRefundItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRefundItemDtoCopyWith<$Res> {
  factory $CreateRefundItemDtoCopyWith(
          CreateRefundItemDto value, $Res Function(CreateRefundItemDto) then) =
      _$CreateRefundItemDtoCopyWithImpl<$Res, CreateRefundItemDto>;
  @useResult
  $Res call({int variantId, int quantity});
}

/// @nodoc
class _$CreateRefundItemDtoCopyWithImpl<$Res, $Val extends CreateRefundItemDto>
    implements $CreateRefundItemDtoCopyWith<$Res> {
  _$CreateRefundItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variantId = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateRefundItemDtoImplCopyWith<$Res>
    implements $CreateRefundItemDtoCopyWith<$Res> {
  factory _$$CreateRefundItemDtoImplCopyWith(_$CreateRefundItemDtoImpl value,
          $Res Function(_$CreateRefundItemDtoImpl) then) =
      __$$CreateRefundItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int variantId, int quantity});
}

/// @nodoc
class __$$CreateRefundItemDtoImplCopyWithImpl<$Res>
    extends _$CreateRefundItemDtoCopyWithImpl<$Res, _$CreateRefundItemDtoImpl>
    implements _$$CreateRefundItemDtoImplCopyWith<$Res> {
  __$$CreateRefundItemDtoImplCopyWithImpl(_$CreateRefundItemDtoImpl _value,
      $Res Function(_$CreateRefundItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variantId = null,
    Object? quantity = null,
  }) {
    return _then(_$CreateRefundItemDtoImpl(
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateRefundItemDtoImpl implements _CreateRefundItemDto {
  const _$CreateRefundItemDtoImpl(
      {required this.variantId, required this.quantity});

  factory _$CreateRefundItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRefundItemDtoImplFromJson(json);

  @override
  final int variantId;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CreateRefundItemDto(variantId: $variantId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRefundItemDtoImpl &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, variantId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRefundItemDtoImplCopyWith<_$CreateRefundItemDtoImpl> get copyWith =>
      __$$CreateRefundItemDtoImplCopyWithImpl<_$CreateRefundItemDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRefundItemDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateRefundItemDto implements CreateRefundItemDto {
  const factory _CreateRefundItemDto(
      {required final int variantId,
      required final int quantity}) = _$CreateRefundItemDtoImpl;

  factory _CreateRefundItemDto.fromJson(Map<String, dynamic> json) =
      _$CreateRefundItemDtoImpl.fromJson;

  @override
  int get variantId;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$CreateRefundItemDtoImplCopyWith<_$CreateRefundItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
