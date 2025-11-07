// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Transaction {
  int get id => throw _privateConstructorUsedError;
  String get receiptId => throw _privateConstructorUsedError;
  int? get saleTransactionId => throw _privateConstructorUsedError;
  String? get saleTransactionReceiptId => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  ReturnStatus? get status => throw _privateConstructorUsedError;
  RegisterPartial get register => throw _privateConstructorUsedError;
  BranchPartial get branch => throw _privateConstructorUsedError;
  EmployeePartial get employee =>
      throw _privateConstructorUsedError; // required Register register,
// required Branch branch,
// required Employee employee,
  List<TransactionItem>? get items => throw _privateConstructorUsedError;
  double? get subtotal => throw _privateConstructorUsedError;
  double? get tax => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  String? get reasonForRefund => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Total discount from all items (sum of all discounts per item)
  double? get totalDiscountAmount => throw _privateConstructorUsedError;

  /// Amount customer gave as payment
  double? get amountPaid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {int id,
      String receiptId,
      int? saleTransactionId,
      String? saleTransactionReceiptId,
      TransactionType type,
      ReturnStatus? status,
      RegisterPartial register,
      BranchPartial branch,
      EmployeePartial employee,
      List<TransactionItem>? items,
      double? subtotal,
      double? tax,
      double? total,
      String? reasonForRefund,
      @DateTimeConverter() DateTime createdAt,
      double? totalDiscountAmount,
      double? amountPaid});

  $RegisterPartialCopyWith<$Res> get register;
  $BranchPartialCopyWith<$Res> get branch;
  $EmployeePartialCopyWith<$Res> get employee;
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receiptId = null,
    Object? saleTransactionId = freezed,
    Object? saleTransactionReceiptId = freezed,
    Object? type = null,
    Object? status = freezed,
    Object? register = null,
    Object? branch = null,
    Object? employee = null,
    Object? items = freezed,
    Object? subtotal = freezed,
    Object? tax = freezed,
    Object? total = freezed,
    Object? reasonForRefund = freezed,
    Object? createdAt = null,
    Object? totalDiscountAmount = freezed,
    Object? amountPaid = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      receiptId: null == receiptId
          ? _value.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
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
              as TransactionType,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReturnStatus?,
      register: null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as RegisterPartial,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as BranchPartial,
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as EmployeePartial,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      reasonForRefund: freezed == reasonForRefund
          ? _value.reasonForRefund
          : reasonForRefund // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalDiscountAmount: freezed == totalDiscountAmount
          ? _value.totalDiscountAmount
          : totalDiscountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      amountPaid: freezed == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RegisterPartialCopyWith<$Res> get register {
    return $RegisterPartialCopyWith<$Res>(_value.register, (value) {
      return _then(_value.copyWith(register: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchPartialCopyWith<$Res> get branch {
    return $BranchPartialCopyWith<$Res>(_value.branch, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EmployeePartialCopyWith<$Res> get employee {
    return $EmployeePartialCopyWith<$Res>(_value.employee, (value) {
      return _then(_value.copyWith(employee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String receiptId,
      int? saleTransactionId,
      String? saleTransactionReceiptId,
      TransactionType type,
      ReturnStatus? status,
      RegisterPartial register,
      BranchPartial branch,
      EmployeePartial employee,
      List<TransactionItem>? items,
      double? subtotal,
      double? tax,
      double? total,
      String? reasonForRefund,
      @DateTimeConverter() DateTime createdAt,
      double? totalDiscountAmount,
      double? amountPaid});

  @override
  $RegisterPartialCopyWith<$Res> get register;
  @override
  $BranchPartialCopyWith<$Res> get branch;
  @override
  $EmployeePartialCopyWith<$Res> get employee;
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receiptId = null,
    Object? saleTransactionId = freezed,
    Object? saleTransactionReceiptId = freezed,
    Object? type = null,
    Object? status = freezed,
    Object? register = null,
    Object? branch = null,
    Object? employee = null,
    Object? items = freezed,
    Object? subtotal = freezed,
    Object? tax = freezed,
    Object? total = freezed,
    Object? reasonForRefund = freezed,
    Object? createdAt = null,
    Object? totalDiscountAmount = freezed,
    Object? amountPaid = freezed,
  }) {
    return _then(_$TransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      receiptId: null == receiptId
          ? _value.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
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
              as TransactionType,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReturnStatus?,
      register: null == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as RegisterPartial,
      branch: null == branch
          ? _value.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as BranchPartial,
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as EmployeePartial,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      reasonForRefund: freezed == reasonForRefund
          ? _value.reasonForRefund
          : reasonForRefund // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalDiscountAmount: freezed == totalDiscountAmount
          ? _value.totalDiscountAmount
          : totalDiscountAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      amountPaid: freezed == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$TransactionImpl extends _Transaction {
  const _$TransactionImpl(
      {required this.id,
      required this.receiptId,
      this.saleTransactionId,
      this.saleTransactionReceiptId,
      required this.type,
      this.status,
      required this.register,
      required this.branch,
      required this.employee,
      final List<TransactionItem>? items,
      this.subtotal,
      this.tax,
      this.total,
      this.reasonForRefund,
      @DateTimeConverter() required this.createdAt,
      this.totalDiscountAmount,
      this.amountPaid})
      : _items = items,
        super._();

  @override
  final int id;
  @override
  final String receiptId;
  @override
  final int? saleTransactionId;
  @override
  final String? saleTransactionReceiptId;
  @override
  final TransactionType type;
  @override
  final ReturnStatus? status;
  @override
  final RegisterPartial register;
  @override
  final BranchPartial branch;
  @override
  final EmployeePartial employee;
// required Register register,
// required Branch branch,
// required Employee employee,
  final List<TransactionItem>? _items;
// required Register register,
// required Branch branch,
// required Employee employee,
  @override
  List<TransactionItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? subtotal;
  @override
  final double? tax;
  @override
  final double? total;
  @override
  final String? reasonForRefund;
  @override
  @DateTimeConverter()
  final DateTime createdAt;

  /// Total discount from all items (sum of all discounts per item)
  @override
  final double? totalDiscountAmount;

  /// Amount customer gave as payment
  @override
  final double? amountPaid;

  @override
  String toString() {
    return 'Transaction(id: $id, receiptId: $receiptId, saleTransactionId: $saleTransactionId, saleTransactionReceiptId: $saleTransactionReceiptId, type: $type, status: $status, register: $register, branch: $branch, employee: $employee, items: $items, subtotal: $subtotal, tax: $tax, total: $total, reasonForRefund: $reasonForRefund, createdAt: $createdAt, totalDiscountAmount: $totalDiscountAmount, amountPaid: $amountPaid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.receiptId, receiptId) ||
                other.receiptId == receiptId) &&
            (identical(other.saleTransactionId, saleTransactionId) ||
                other.saleTransactionId == saleTransactionId) &&
            (identical(
                    other.saleTransactionReceiptId, saleTransactionReceiptId) ||
                other.saleTransactionReceiptId == saleTransactionReceiptId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.register, register) ||
                other.register == register) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.employee, employee) ||
                other.employee == employee) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.reasonForRefund, reasonForRefund) ||
                other.reasonForRefund == reasonForRefund) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.totalDiscountAmount, totalDiscountAmount) ||
                other.totalDiscountAmount == totalDiscountAmount) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      receiptId,
      saleTransactionId,
      saleTransactionReceiptId,
      type,
      status,
      register,
      branch,
      employee,
      const DeepCollectionEquality().hash(_items),
      subtotal,
      tax,
      total,
      reasonForRefund,
      createdAt,
      totalDiscountAmount,
      amountPaid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);
}

abstract class _Transaction extends Transaction {
  const factory _Transaction(
      {required final int id,
      required final String receiptId,
      final int? saleTransactionId,
      final String? saleTransactionReceiptId,
      required final TransactionType type,
      final ReturnStatus? status,
      required final RegisterPartial register,
      required final BranchPartial branch,
      required final EmployeePartial employee,
      final List<TransactionItem>? items,
      final double? subtotal,
      final double? tax,
      final double? total,
      final String? reasonForRefund,
      @DateTimeConverter() required final DateTime createdAt,
      final double? totalDiscountAmount,
      final double? amountPaid}) = _$TransactionImpl;
  const _Transaction._() : super._();

  @override
  int get id;
  @override
  String get receiptId;
  @override
  int? get saleTransactionId;
  @override
  String? get saleTransactionReceiptId;
  @override
  TransactionType get type;
  @override
  ReturnStatus? get status;
  @override
  RegisterPartial get register;
  @override
  BranchPartial get branch;
  @override
  EmployeePartial get employee;
  @override // required Register register,
// required Branch branch,
// required Employee employee,
  List<TransactionItem>? get items;
  @override
  double? get subtotal;
  @override
  double? get tax;
  @override
  double? get total;
  @override
  String? get reasonForRefund;
  @override
  @DateTimeConverter()
  DateTime get createdAt;
  @override

  /// Total discount from all items (sum of all discounts per item)
  double? get totalDiscountAmount;
  @override

  /// Amount customer gave as payment
  double? get amountPaid;
  @override
  @JsonKey(ignore: true)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
