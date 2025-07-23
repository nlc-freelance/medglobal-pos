// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_inventory_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BranchInventoryDto _$BranchInventoryDtoFromJson(Map<String, dynamic> json) {
  return _BranchInventoryDto.fromJson(json);
}

/// @nodoc
mixin _$BranchInventoryDto {
  int get id => throw _privateConstructorUsedError;
  BranchDto get store => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get currentStock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchInventoryDtoCopyWith<BranchInventoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchInventoryDtoCopyWith<$Res> {
  factory $BranchInventoryDtoCopyWith(
          BranchInventoryDto value, $Res Function(BranchInventoryDto) then) =
      _$BranchInventoryDtoCopyWithImpl<$Res, BranchInventoryDto>;
  @useResult
  $Res call({int id, BranchDto store, double price, int currentStock});

  $BranchDtoCopyWith<$Res> get store;
}

/// @nodoc
class _$BranchInventoryDtoCopyWithImpl<$Res, $Val extends BranchInventoryDto>
    implements $BranchInventoryDtoCopyWith<$Res> {
  _$BranchInventoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? store = null,
    Object? price = null,
    Object? currentStock = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as BranchDto,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currentStock: null == currentStock
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchDtoCopyWith<$Res> get store {
    return $BranchDtoCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BranchInventoryDtoImplCopyWith<$Res>
    implements $BranchInventoryDtoCopyWith<$Res> {
  factory _$$BranchInventoryDtoImplCopyWith(_$BranchInventoryDtoImpl value,
          $Res Function(_$BranchInventoryDtoImpl) then) =
      __$$BranchInventoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, BranchDto store, double price, int currentStock});

  @override
  $BranchDtoCopyWith<$Res> get store;
}

/// @nodoc
class __$$BranchInventoryDtoImplCopyWithImpl<$Res>
    extends _$BranchInventoryDtoCopyWithImpl<$Res, _$BranchInventoryDtoImpl>
    implements _$$BranchInventoryDtoImplCopyWith<$Res> {
  __$$BranchInventoryDtoImplCopyWithImpl(_$BranchInventoryDtoImpl _value,
      $Res Function(_$BranchInventoryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? store = null,
    Object? price = null,
    Object? currentStock = null,
  }) {
    return _then(_$BranchInventoryDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as BranchDto,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      currentStock: null == currentStock
          ? _value.currentStock
          : currentStock // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BranchInventoryDtoImpl implements _BranchInventoryDto {
  const _$BranchInventoryDtoImpl(
      {required this.id,
      required this.store,
      required this.price,
      required this.currentStock});

  factory _$BranchInventoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BranchInventoryDtoImplFromJson(json);

  @override
  final int id;
  @override
  final BranchDto store;
  @override
  final double price;
  @override
  final int currentStock;

  @override
  String toString() {
    return 'BranchInventoryDto(id: $id, store: $store, price: $price, currentStock: $currentStock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BranchInventoryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.currentStock, currentStock) ||
                other.currentStock == currentStock));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, store, price, currentStock);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BranchInventoryDtoImplCopyWith<_$BranchInventoryDtoImpl> get copyWith =>
      __$$BranchInventoryDtoImplCopyWithImpl<_$BranchInventoryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BranchInventoryDtoImplToJson(
      this,
    );
  }
}

abstract class _BranchInventoryDto implements BranchInventoryDto {
  const factory _BranchInventoryDto(
      {required final int id,
      required final BranchDto store,
      required final double price,
      required final int currentStock}) = _$BranchInventoryDtoImpl;

  factory _BranchInventoryDto.fromJson(Map<String, dynamic> json) =
      _$BranchInventoryDtoImpl.fromJson;

  @override
  int get id;
  @override
  BranchDto get store;
  @override
  double get price;
  @override
  int get currentStock;
  @override
  @JsonKey(ignore: true)
  _$$BranchInventoryDtoImplCopyWith<_$BranchInventoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
