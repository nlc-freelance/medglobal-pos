// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_purchase_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdatePurchaseOrderDto _$UpdatePurchaseOrderDtoFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'saveOrShip':
      return UpdatePurchaseOrderDtoSaveOrShip.fromJson(json);
    case 'receive':
      return UpdatePurchaseOrderDtoReceive.fromJson(json);
    case 'cancel':
      return UpdatePurchaseOrderDtoCancel.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'UpdatePurchaseOrderDto',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$UpdatePurchaseOrderDto {
  String get status => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? estimatedDateOfArrival,
            double? tax,
            double? discount,
            String? notes)
        saveOrShip,
    required TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? notes)
        receive,
    required TResult Function(String status) cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? estimatedDateOfArrival,
            double? tax,
            double? discount,
            String? notes)?
        saveOrShip,
    TResult? Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? notes)?
        receive,
    TResult? Function(String status)? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? estimatedDateOfArrival,
            double? tax,
            double? discount,
            String? notes)?
        saveOrShip,
    TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? notes)?
        receive,
    TResult Function(String status)? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePurchaseOrderDtoSaveOrShip value)
        saveOrShip,
    required TResult Function(UpdatePurchaseOrderDtoReceive value) receive,
    required TResult Function(UpdatePurchaseOrderDtoCancel value) cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePurchaseOrderDtoSaveOrShip value)? saveOrShip,
    TResult? Function(UpdatePurchaseOrderDtoReceive value)? receive,
    TResult? Function(UpdatePurchaseOrderDtoCancel value)? cancel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePurchaseOrderDtoSaveOrShip value)? saveOrShip,
    TResult Function(UpdatePurchaseOrderDtoReceive value)? receive,
    TResult Function(UpdatePurchaseOrderDtoCancel value)? cancel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatePurchaseOrderDtoCopyWith<UpdatePurchaseOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePurchaseOrderDtoCopyWith<$Res> {
  factory $UpdatePurchaseOrderDtoCopyWith(UpdatePurchaseOrderDto value,
          $Res Function(UpdatePurchaseOrderDto) then) =
      _$UpdatePurchaseOrderDtoCopyWithImpl<$Res, UpdatePurchaseOrderDto>;
  @useResult
  $Res call({String status});
}

/// @nodoc
class _$UpdatePurchaseOrderDtoCopyWithImpl<$Res,
        $Val extends UpdatePurchaseOrderDto>
    implements $UpdatePurchaseOrderDtoCopyWith<$Res> {
  _$UpdatePurchaseOrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePurchaseOrderDtoSaveOrShipImplCopyWith<$Res>
    implements $UpdatePurchaseOrderDtoCopyWith<$Res> {
  factory _$$UpdatePurchaseOrderDtoSaveOrShipImplCopyWith(
          _$UpdatePurchaseOrderDtoSaveOrShipImpl value,
          $Res Function(_$UpdatePurchaseOrderDtoSaveOrShipImpl) then) =
      __$$UpdatePurchaseOrderDtoSaveOrShipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
      String? estimatedDateOfArrival,
      double? tax,
      double? discount,
      String? notes});
}

/// @nodoc
class __$$UpdatePurchaseOrderDtoSaveOrShipImplCopyWithImpl<$Res>
    extends _$UpdatePurchaseOrderDtoCopyWithImpl<$Res,
        _$UpdatePurchaseOrderDtoSaveOrShipImpl>
    implements _$$UpdatePurchaseOrderDtoSaveOrShipImplCopyWith<$Res> {
  __$$UpdatePurchaseOrderDtoSaveOrShipImplCopyWithImpl(
      _$UpdatePurchaseOrderDtoSaveOrShipImpl _value,
      $Res Function(_$UpdatePurchaseOrderDtoSaveOrShipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? purchaseOrderDetails = freezed,
    Object? estimatedDateOfArrival = freezed,
    Object? tax = freezed,
    Object? discount = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$UpdatePurchaseOrderDtoSaveOrShipImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDetails: freezed == purchaseOrderDetails
          ? _value._purchaseOrderDetails
          : purchaseOrderDetails // ignore: cast_nullable_to_non_nullable
              as List<UpdatePurchaseOrderItemDto>?,
      estimatedDateOfArrival: freezed == estimatedDateOfArrival
          ? _value.estimatedDateOfArrival
          : estimatedDateOfArrival // ignore: cast_nullable_to_non_nullable
              as String?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePurchaseOrderDtoSaveOrShipImpl
    implements UpdatePurchaseOrderDtoSaveOrShip {
  const _$UpdatePurchaseOrderDtoSaveOrShipImpl(
      {required this.status,
      final List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
      this.estimatedDateOfArrival,
      this.tax,
      this.discount,
      this.notes,
      final String? $type})
      : _purchaseOrderDetails = purchaseOrderDetails,
        $type = $type ?? 'saveOrShip';

  factory _$UpdatePurchaseOrderDtoSaveOrShipImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdatePurchaseOrderDtoSaveOrShipImplFromJson(json);

  @override
  final String status;
  final List<UpdatePurchaseOrderItemDto>? _purchaseOrderDetails;
  @override
  List<UpdatePurchaseOrderItemDto>? get purchaseOrderDetails {
    final value = _purchaseOrderDetails;
    if (value == null) return null;
    if (_purchaseOrderDetails is EqualUnmodifiableListView)
      return _purchaseOrderDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? estimatedDateOfArrival;
  @override
  final double? tax;
  @override
  final double? discount;
  @override
  final String? notes;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UpdatePurchaseOrderDto.saveOrShip(status: $status, purchaseOrderDetails: $purchaseOrderDetails, estimatedDateOfArrival: $estimatedDateOfArrival, tax: $tax, discount: $discount, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePurchaseOrderDtoSaveOrShipImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._purchaseOrderDetails, _purchaseOrderDetails) &&
            (identical(other.estimatedDateOfArrival, estimatedDateOfArrival) ||
                other.estimatedDateOfArrival == estimatedDateOfArrival) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_purchaseOrderDetails),
      estimatedDateOfArrival,
      tax,
      discount,
      notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePurchaseOrderDtoSaveOrShipImplCopyWith<
          _$UpdatePurchaseOrderDtoSaveOrShipImpl>
      get copyWith => __$$UpdatePurchaseOrderDtoSaveOrShipImplCopyWithImpl<
          _$UpdatePurchaseOrderDtoSaveOrShipImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? estimatedDateOfArrival,
            double? tax,
            double? discount,
            String? notes)
        saveOrShip,
    required TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? notes)
        receive,
    required TResult Function(String status) cancel,
  }) {
    return saveOrShip(status, purchaseOrderDetails, estimatedDateOfArrival, tax,
        discount, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? estimatedDateOfArrival,
            double? tax,
            double? discount,
            String? notes)?
        saveOrShip,
    TResult? Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? notes)?
        receive,
    TResult? Function(String status)? cancel,
  }) {
    return saveOrShip?.call(status, purchaseOrderDetails,
        estimatedDateOfArrival, tax, discount, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? estimatedDateOfArrival,
            double? tax,
            double? discount,
            String? notes)?
        saveOrShip,
    TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? notes)?
        receive,
    TResult Function(String status)? cancel,
    required TResult orElse(),
  }) {
    if (saveOrShip != null) {
      return saveOrShip(status, purchaseOrderDetails, estimatedDateOfArrival,
          tax, discount, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePurchaseOrderDtoSaveOrShip value)
        saveOrShip,
    required TResult Function(UpdatePurchaseOrderDtoReceive value) receive,
    required TResult Function(UpdatePurchaseOrderDtoCancel value) cancel,
  }) {
    return saveOrShip(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePurchaseOrderDtoSaveOrShip value)? saveOrShip,
    TResult? Function(UpdatePurchaseOrderDtoReceive value)? receive,
    TResult? Function(UpdatePurchaseOrderDtoCancel value)? cancel,
  }) {
    return saveOrShip?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePurchaseOrderDtoSaveOrShip value)? saveOrShip,
    TResult Function(UpdatePurchaseOrderDtoReceive value)? receive,
    TResult Function(UpdatePurchaseOrderDtoCancel value)? cancel,
    required TResult orElse(),
  }) {
    if (saveOrShip != null) {
      return saveOrShip(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePurchaseOrderDtoSaveOrShipImplToJson(
      this,
    );
  }
}

abstract class UpdatePurchaseOrderDtoSaveOrShip
    implements UpdatePurchaseOrderDto {
  const factory UpdatePurchaseOrderDtoSaveOrShip(
      {required final String status,
      final List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
      final String? estimatedDateOfArrival,
      final double? tax,
      final double? discount,
      final String? notes}) = _$UpdatePurchaseOrderDtoSaveOrShipImpl;

  factory UpdatePurchaseOrderDtoSaveOrShip.fromJson(Map<String, dynamic> json) =
      _$UpdatePurchaseOrderDtoSaveOrShipImpl.fromJson;

  @override
  String get status;
  List<UpdatePurchaseOrderItemDto>? get purchaseOrderDetails;
  String? get estimatedDateOfArrival;
  double? get tax;
  double? get discount;
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePurchaseOrderDtoSaveOrShipImplCopyWith<
          _$UpdatePurchaseOrderDtoSaveOrShipImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePurchaseOrderDtoReceiveImplCopyWith<$Res>
    implements $UpdatePurchaseOrderDtoCopyWith<$Res> {
  factory _$$UpdatePurchaseOrderDtoReceiveImplCopyWith(
          _$UpdatePurchaseOrderDtoReceiveImpl value,
          $Res Function(_$UpdatePurchaseOrderDtoReceiveImpl) then) =
      __$$UpdatePurchaseOrderDtoReceiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
      String? notes});
}

/// @nodoc
class __$$UpdatePurchaseOrderDtoReceiveImplCopyWithImpl<$Res>
    extends _$UpdatePurchaseOrderDtoCopyWithImpl<$Res,
        _$UpdatePurchaseOrderDtoReceiveImpl>
    implements _$$UpdatePurchaseOrderDtoReceiveImplCopyWith<$Res> {
  __$$UpdatePurchaseOrderDtoReceiveImplCopyWithImpl(
      _$UpdatePurchaseOrderDtoReceiveImpl _value,
      $Res Function(_$UpdatePurchaseOrderDtoReceiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? purchaseOrderDetails = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$UpdatePurchaseOrderDtoReceiveImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDetails: freezed == purchaseOrderDetails
          ? _value._purchaseOrderDetails
          : purchaseOrderDetails // ignore: cast_nullable_to_non_nullable
              as List<UpdatePurchaseOrderItemDto>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePurchaseOrderDtoReceiveImpl
    implements UpdatePurchaseOrderDtoReceive {
  const _$UpdatePurchaseOrderDtoReceiveImpl(
      {required this.status,
      required final List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
      this.notes,
      final String? $type})
      : _purchaseOrderDetails = purchaseOrderDetails,
        $type = $type ?? 'receive';

  factory _$UpdatePurchaseOrderDtoReceiveImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdatePurchaseOrderDtoReceiveImplFromJson(json);

  @override
  final String status;
  final List<UpdatePurchaseOrderItemDto>? _purchaseOrderDetails;
  @override
  List<UpdatePurchaseOrderItemDto>? get purchaseOrderDetails {
    final value = _purchaseOrderDetails;
    if (value == null) return null;
    if (_purchaseOrderDetails is EqualUnmodifiableListView)
      return _purchaseOrderDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? notes;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UpdatePurchaseOrderDto.receive(status: $status, purchaseOrderDetails: $purchaseOrderDetails, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePurchaseOrderDtoReceiveImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._purchaseOrderDetails, _purchaseOrderDetails) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_purchaseOrderDetails), notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePurchaseOrderDtoReceiveImplCopyWith<
          _$UpdatePurchaseOrderDtoReceiveImpl>
      get copyWith => __$$UpdatePurchaseOrderDtoReceiveImplCopyWithImpl<
          _$UpdatePurchaseOrderDtoReceiveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? estimatedDateOfArrival,
            double? tax,
            double? discount,
            String? notes)
        saveOrShip,
    required TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? notes)
        receive,
    required TResult Function(String status) cancel,
  }) {
    return receive(status, purchaseOrderDetails, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? estimatedDateOfArrival,
            double? tax,
            double? discount,
            String? notes)?
        saveOrShip,
    TResult? Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? notes)?
        receive,
    TResult? Function(String status)? cancel,
  }) {
    return receive?.call(status, purchaseOrderDetails, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? estimatedDateOfArrival,
            double? tax,
            double? discount,
            String? notes)?
        saveOrShip,
    TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? notes)?
        receive,
    TResult Function(String status)? cancel,
    required TResult orElse(),
  }) {
    if (receive != null) {
      return receive(status, purchaseOrderDetails, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePurchaseOrderDtoSaveOrShip value)
        saveOrShip,
    required TResult Function(UpdatePurchaseOrderDtoReceive value) receive,
    required TResult Function(UpdatePurchaseOrderDtoCancel value) cancel,
  }) {
    return receive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePurchaseOrderDtoSaveOrShip value)? saveOrShip,
    TResult? Function(UpdatePurchaseOrderDtoReceive value)? receive,
    TResult? Function(UpdatePurchaseOrderDtoCancel value)? cancel,
  }) {
    return receive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePurchaseOrderDtoSaveOrShip value)? saveOrShip,
    TResult Function(UpdatePurchaseOrderDtoReceive value)? receive,
    TResult Function(UpdatePurchaseOrderDtoCancel value)? cancel,
    required TResult orElse(),
  }) {
    if (receive != null) {
      return receive(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePurchaseOrderDtoReceiveImplToJson(
      this,
    );
  }
}

abstract class UpdatePurchaseOrderDtoReceive implements UpdatePurchaseOrderDto {
  const factory UpdatePurchaseOrderDtoReceive(
      {required final String status,
      required final List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
      final String? notes}) = _$UpdatePurchaseOrderDtoReceiveImpl;

  factory UpdatePurchaseOrderDtoReceive.fromJson(Map<String, dynamic> json) =
      _$UpdatePurchaseOrderDtoReceiveImpl.fromJson;

  @override
  String get status;
  List<UpdatePurchaseOrderItemDto>? get purchaseOrderDetails;
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePurchaseOrderDtoReceiveImplCopyWith<
          _$UpdatePurchaseOrderDtoReceiveImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePurchaseOrderDtoCancelImplCopyWith<$Res>
    implements $UpdatePurchaseOrderDtoCopyWith<$Res> {
  factory _$$UpdatePurchaseOrderDtoCancelImplCopyWith(
          _$UpdatePurchaseOrderDtoCancelImpl value,
          $Res Function(_$UpdatePurchaseOrderDtoCancelImpl) then) =
      __$$UpdatePurchaseOrderDtoCancelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status});
}

/// @nodoc
class __$$UpdatePurchaseOrderDtoCancelImplCopyWithImpl<$Res>
    extends _$UpdatePurchaseOrderDtoCopyWithImpl<$Res,
        _$UpdatePurchaseOrderDtoCancelImpl>
    implements _$$UpdatePurchaseOrderDtoCancelImplCopyWith<$Res> {
  __$$UpdatePurchaseOrderDtoCancelImplCopyWithImpl(
      _$UpdatePurchaseOrderDtoCancelImpl _value,
      $Res Function(_$UpdatePurchaseOrderDtoCancelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$UpdatePurchaseOrderDtoCancelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePurchaseOrderDtoCancelImpl
    implements UpdatePurchaseOrderDtoCancel {
  const _$UpdatePurchaseOrderDtoCancelImpl(
      {required this.status, final String? $type})
      : $type = $type ?? 'cancel';

  factory _$UpdatePurchaseOrderDtoCancelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdatePurchaseOrderDtoCancelImplFromJson(json);

  @override
  final String status;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'UpdatePurchaseOrderDto.cancel(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePurchaseOrderDtoCancelImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePurchaseOrderDtoCancelImplCopyWith<
          _$UpdatePurchaseOrderDtoCancelImpl>
      get copyWith => __$$UpdatePurchaseOrderDtoCancelImplCopyWithImpl<
          _$UpdatePurchaseOrderDtoCancelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? estimatedDateOfArrival,
            double? tax,
            double? discount,
            String? notes)
        saveOrShip,
    required TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? notes)
        receive,
    required TResult Function(String status) cancel,
  }) {
    return cancel(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? estimatedDateOfArrival,
            double? tax,
            double? discount,
            String? notes)?
        saveOrShip,
    TResult? Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? notes)?
        receive,
    TResult? Function(String status)? cancel,
  }) {
    return cancel?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? estimatedDateOfArrival,
            double? tax,
            double? discount,
            String? notes)?
        saveOrShip,
    TResult Function(
            String status,
            List<UpdatePurchaseOrderItemDto>? purchaseOrderDetails,
            String? notes)?
        receive,
    TResult Function(String status)? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePurchaseOrderDtoSaveOrShip value)
        saveOrShip,
    required TResult Function(UpdatePurchaseOrderDtoReceive value) receive,
    required TResult Function(UpdatePurchaseOrderDtoCancel value) cancel,
  }) {
    return cancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePurchaseOrderDtoSaveOrShip value)? saveOrShip,
    TResult? Function(UpdatePurchaseOrderDtoReceive value)? receive,
    TResult? Function(UpdatePurchaseOrderDtoCancel value)? cancel,
  }) {
    return cancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePurchaseOrderDtoSaveOrShip value)? saveOrShip,
    TResult Function(UpdatePurchaseOrderDtoReceive value)? receive,
    TResult Function(UpdatePurchaseOrderDtoCancel value)? cancel,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePurchaseOrderDtoCancelImplToJson(
      this,
    );
  }
}

abstract class UpdatePurchaseOrderDtoCancel implements UpdatePurchaseOrderDto {
  const factory UpdatePurchaseOrderDtoCancel({required final String status}) =
      _$UpdatePurchaseOrderDtoCancelImpl;

  factory UpdatePurchaseOrderDtoCancel.fromJson(Map<String, dynamic> json) =
      _$UpdatePurchaseOrderDtoCancelImpl.fromJson;

  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePurchaseOrderDtoCancelImplCopyWith<
          _$UpdatePurchaseOrderDtoCancelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
