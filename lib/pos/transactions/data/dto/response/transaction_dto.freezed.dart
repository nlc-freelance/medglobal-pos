// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionDto _$TransactionDtoFromJson(Map<String, dynamic> json) {
  return _TransactionDto.fromJson(json);
}

/// @nodoc
mixin _$TransactionDto {
  int get id => throw _privateConstructorUsedError;
  String get transactionId => throw _privateConstructorUsedError;
  int? get saleTransactionId => throw _privateConstructorUsedError;
  String? get saleTransactionReceiptId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  RegisterDto get register => throw _privateConstructorUsedError;
  BranchDto get store => throw _privateConstructorUsedError;
  EmployeeDto get user => throw _privateConstructorUsedError;
  List<TransactionItemDto> get items => throw _privateConstructorUsedError;
  double? get subTotal => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  String? get discountType => throw _privateConstructorUsedError;
  double? get discountInPeso => throw _privateConstructorUsedError;
  double? get tax => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  double? get totalDiscountInPeso => throw _privateConstructorUsedError;
  double? get amountPaid => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionDtoCopyWith<TransactionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDtoCopyWith<$Res> {
  factory $TransactionDtoCopyWith(
          TransactionDto value, $Res Function(TransactionDto) then) =
      _$TransactionDtoCopyWithImpl<$Res, TransactionDto>;
  @useResult
  $Res call(
      {int id,
      String transactionId,
      int? saleTransactionId,
      String? saleTransactionReceiptId,
      String type,
      String? status,
      RegisterDto register,
      BranchDto store,
      EmployeeDto user,
      List<TransactionItemDto> items,
      double? subTotal,
      double? discount,
      String? discountType,
      double? discountInPeso,
      double? tax,
      double? total,
      double? totalDiscountInPeso,
      double? amountPaid,
      String? notes,
      @DateTimeConverter() DateTime createdAt});

  $RegisterDtoCopyWith<$Res> get register;
  $BranchDtoCopyWith<$Res> get store;
  $EmployeeDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$TransactionDtoCopyWithImpl<$Res, $Val extends TransactionDto>
    implements $TransactionDtoCopyWith<$Res> {
  _$TransactionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transactionId = null,
    Object? saleTransactionId = freezed,
    Object? saleTransactionReceiptId = freezed,
    Object? type = null,
    Object? status = freezed,
    Object? register = null,
    Object? store = null,
    Object? user = null,
    Object? items = null,
    Object? subTotal = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? discountInPeso = freezed,
    Object? tax = freezed,
    Object? total = freezed,
    Object? totalDiscountInPeso = freezed,
    Object? amountPaid = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      saleTransactionId: freezed == saleTransactionId
          ? _value.saleTransactionId
          : saleTransactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleTransactionReceiptId: freezed == saleTransactionReceiptId
          ? _value.saleTransactionReceiptId
          : saleTransactionReceiptId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      register: null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as RegisterDto,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as BranchDto,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as EmployeeDto,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TransactionItemDto>,
      subTotal: freezed == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      discountInPeso: freezed == discountInPeso
          ? _value.discountInPeso
          : discountInPeso // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDiscountInPeso: freezed == totalDiscountInPeso
          ? _value.totalDiscountInPeso
          : totalDiscountInPeso // ignore: cast_nullable_to_non_nullable
              as double?,
      amountPaid: freezed == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RegisterDtoCopyWith<$Res> get register {
    return $RegisterDtoCopyWith<$Res>(_value.register, (value) {
      return _then(_value.copyWith(register: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchDtoCopyWith<$Res> get store {
    return $BranchDtoCopyWith<$Res>(_value.store, (value) {
      return _then(_value.copyWith(store: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EmployeeDtoCopyWith<$Res> get user {
    return $EmployeeDtoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionDtoImplCopyWith<$Res>
    implements $TransactionDtoCopyWith<$Res> {
  factory _$$TransactionDtoImplCopyWith(_$TransactionDtoImpl value,
          $Res Function(_$TransactionDtoImpl) then) =
      __$$TransactionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String transactionId,
      int? saleTransactionId,
      String? saleTransactionReceiptId,
      String type,
      String? status,
      RegisterDto register,
      BranchDto store,
      EmployeeDto user,
      List<TransactionItemDto> items,
      double? subTotal,
      double? discount,
      String? discountType,
      double? discountInPeso,
      double? tax,
      double? total,
      double? totalDiscountInPeso,
      double? amountPaid,
      String? notes,
      @DateTimeConverter() DateTime createdAt});

  @override
  $RegisterDtoCopyWith<$Res> get register;
  @override
  $BranchDtoCopyWith<$Res> get store;
  @override
  $EmployeeDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$$TransactionDtoImplCopyWithImpl<$Res>
    extends _$TransactionDtoCopyWithImpl<$Res, _$TransactionDtoImpl>
    implements _$$TransactionDtoImplCopyWith<$Res> {
  __$$TransactionDtoImplCopyWithImpl(
      _$TransactionDtoImpl _value, $Res Function(_$TransactionDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transactionId = null,
    Object? saleTransactionId = freezed,
    Object? saleTransactionReceiptId = freezed,
    Object? type = null,
    Object? status = freezed,
    Object? register = null,
    Object? store = null,
    Object? user = null,
    Object? items = null,
    Object? subTotal = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? discountInPeso = freezed,
    Object? tax = freezed,
    Object? total = freezed,
    Object? totalDiscountInPeso = freezed,
    Object? amountPaid = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$TransactionDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      saleTransactionId: freezed == saleTransactionId
          ? _value.saleTransactionId
          : saleTransactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      saleTransactionReceiptId: freezed == saleTransactionReceiptId
          ? _value.saleTransactionReceiptId
          : saleTransactionReceiptId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      register: null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as RegisterDto,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as BranchDto,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as EmployeeDto,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TransactionItemDto>,
      subTotal: freezed == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      discountInPeso: freezed == discountInPeso
          ? _value.discountInPeso
          : discountInPeso // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDiscountInPeso: freezed == totalDiscountInPeso
          ? _value.totalDiscountInPeso
          : totalDiscountInPeso // ignore: cast_nullable_to_non_nullable
              as double?,
      amountPaid: freezed == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionDtoImpl implements _TransactionDto {
  const _$TransactionDtoImpl(
      {required this.id,
      required this.transactionId,
      this.saleTransactionId,
      this.saleTransactionReceiptId,
      required this.type,
      this.status,
      required this.register,
      required this.store,
      required this.user,
      required final List<TransactionItemDto> items,
      this.subTotal,
      this.discount,
      this.discountType,
      this.discountInPeso,
      this.tax,
      this.total,
      this.totalDiscountInPeso,
      this.amountPaid,
      this.notes,
      @DateTimeConverter() required this.createdAt})
      : _items = items;

  factory _$TransactionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionDtoImplFromJson(json);

  @override
  final int id;
  @override
  final String transactionId;
  @override
  final int? saleTransactionId;
  @override
  final String? saleTransactionReceiptId;
  @override
  final String type;
  @override
  final String? status;
  @override
  final RegisterDto register;
  @override
  final BranchDto store;
  @override
  final EmployeeDto user;
  final List<TransactionItemDto> _items;
  @override
  List<TransactionItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final double? subTotal;
  @override
  final double? discount;
  @override
  final String? discountType;
  @override
  final double? discountInPeso;
  @override
  final double? tax;
  @override
  final double? total;
  @override
  final double? totalDiscountInPeso;
  @override
  final double? amountPaid;
  @override
  final String? notes;
  @override
  @DateTimeConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'TransactionDto(id: $id, transactionId: $transactionId, saleTransactionId: $saleTransactionId, saleTransactionReceiptId: $saleTransactionReceiptId, type: $type, status: $status, register: $register, store: $store, user: $user, items: $items, subTotal: $subTotal, discount: $discount, discountType: $discountType, discountInPeso: $discountInPeso, tax: $tax, total: $total, totalDiscountInPeso: $totalDiscountInPeso, amountPaid: $amountPaid, notes: $notes, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.saleTransactionId, saleTransactionId) ||
                other.saleTransactionId == saleTransactionId) &&
            (identical(
                    other.saleTransactionReceiptId, saleTransactionReceiptId) ||
                other.saleTransactionReceiptId == saleTransactionReceiptId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.register, register) ||
                other.register == register) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountInPeso, discountInPeso) ||
                other.discountInPeso == discountInPeso) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalDiscountInPeso, totalDiscountInPeso) ||
                other.totalDiscountInPeso == totalDiscountInPeso) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        transactionId,
        saleTransactionId,
        saleTransactionReceiptId,
        type,
        status,
        register,
        store,
        user,
        const DeepCollectionEquality().hash(_items),
        subTotal,
        discount,
        discountType,
        discountInPeso,
        tax,
        total,
        totalDiscountInPeso,
        amountPaid,
        notes,
        createdAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionDtoImplCopyWith<_$TransactionDtoImpl> get copyWith =>
      __$$TransactionDtoImplCopyWithImpl<_$TransactionDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionDtoImplToJson(
      this,
    );
  }
}

abstract class _TransactionDto implements TransactionDto {
  const factory _TransactionDto(
          {required final int id,
          required final String transactionId,
          final int? saleTransactionId,
          final String? saleTransactionReceiptId,
          required final String type,
          final String? status,
          required final RegisterDto register,
          required final BranchDto store,
          required final EmployeeDto user,
          required final List<TransactionItemDto> items,
          final double? subTotal,
          final double? discount,
          final String? discountType,
          final double? discountInPeso,
          final double? tax,
          final double? total,
          final double? totalDiscountInPeso,
          final double? amountPaid,
          final String? notes,
          @DateTimeConverter() required final DateTime createdAt}) =
      _$TransactionDtoImpl;

  factory _TransactionDto.fromJson(Map<String, dynamic> json) =
      _$TransactionDtoImpl.fromJson;

  @override
  int get id;
  @override
  String get transactionId;
  @override
  int? get saleTransactionId;
  @override
  String? get saleTransactionReceiptId;
  @override
  String get type;
  @override
  String? get status;
  @override
  RegisterDto get register;
  @override
  BranchDto get store;
  @override
  EmployeeDto get user;
  @override
  List<TransactionItemDto> get items;
  @override
  double? get subTotal;
  @override
  double? get discount;
  @override
  String? get discountType;
  @override
  double? get discountInPeso;
  @override
  double? get tax;
  @override
  double? get total;
  @override
  double? get totalDiscountInPeso;
  @override
  double? get amountPaid;
  @override
  String? get notes;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$TransactionDtoImplCopyWith<_$TransactionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
