// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) fetch,
    required TResult Function(Transaction transaction) insertNewTransaction,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetch,
    TResult? Function(Transaction transaction)? insertNewTransaction,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetch,
    TResult Function(Transaction transaction)? insertNewTransaction,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_InsertNewTransaction value) insertNewTransaction,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_InsertNewTransaction value)? insertNewTransaction,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_InsertNewTransaction value)? insertNewTransaction,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionListEventCopyWith<$Res> {
  factory $TransactionListEventCopyWith(TransactionListEvent value,
          $Res Function(TransactionListEvent) then) =
      _$TransactionListEventCopyWithImpl<$Res, TransactionListEvent>;
}

/// @nodoc
class _$TransactionListEventCopyWithImpl<$Res,
        $Val extends TransactionListEvent>
    implements $TransactionListEventCopyWith<$Res> {
  _$TransactionListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? search});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$TransactionListEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = freezed,
  }) {
    return _then(_$FetchImpl(
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({this.search});

  @override
  final String? search;

  @override
  String toString() {
    return 'TransactionListEvent.fetch(search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) fetch,
    required TResult Function(Transaction transaction) insertNewTransaction,
    required TResult Function() reset,
  }) {
    return fetch(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetch,
    TResult? Function(Transaction transaction)? insertNewTransaction,
    TResult? Function()? reset,
  }) {
    return fetch?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetch,
    TResult Function(Transaction transaction)? insertNewTransaction,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_InsertNewTransaction value) insertNewTransaction,
    required TResult Function(_Reset value) reset,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_InsertNewTransaction value)? insertNewTransaction,
    TResult? Function(_Reset value)? reset,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_InsertNewTransaction value)? insertNewTransaction,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements TransactionListEvent {
  const factory _Fetch({final String? search}) = _$FetchImpl;

  String? get search;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InsertNewTransactionImplCopyWith<$Res> {
  factory _$$InsertNewTransactionImplCopyWith(_$InsertNewTransactionImpl value,
          $Res Function(_$InsertNewTransactionImpl) then) =
      __$$InsertNewTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Transaction transaction});

  $TransactionCopyWith<$Res> get transaction;
}

/// @nodoc
class __$$InsertNewTransactionImplCopyWithImpl<$Res>
    extends _$TransactionListEventCopyWithImpl<$Res, _$InsertNewTransactionImpl>
    implements _$$InsertNewTransactionImplCopyWith<$Res> {
  __$$InsertNewTransactionImplCopyWithImpl(_$InsertNewTransactionImpl _value,
      $Res Function(_$InsertNewTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$InsertNewTransactionImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Transaction,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionCopyWith<$Res> get transaction {
    return $TransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }
}

/// @nodoc

class _$InsertNewTransactionImpl implements _InsertNewTransaction {
  const _$InsertNewTransactionImpl(this.transaction);

  @override
  final Transaction transaction;

  @override
  String toString() {
    return 'TransactionListEvent.insertNewTransaction(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsertNewTransactionImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsertNewTransactionImplCopyWith<_$InsertNewTransactionImpl>
      get copyWith =>
          __$$InsertNewTransactionImplCopyWithImpl<_$InsertNewTransactionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) fetch,
    required TResult Function(Transaction transaction) insertNewTransaction,
    required TResult Function() reset,
  }) {
    return insertNewTransaction(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetch,
    TResult? Function(Transaction transaction)? insertNewTransaction,
    TResult? Function()? reset,
  }) {
    return insertNewTransaction?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetch,
    TResult Function(Transaction transaction)? insertNewTransaction,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (insertNewTransaction != null) {
      return insertNewTransaction(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_InsertNewTransaction value) insertNewTransaction,
    required TResult Function(_Reset value) reset,
  }) {
    return insertNewTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_InsertNewTransaction value)? insertNewTransaction,
    TResult? Function(_Reset value)? reset,
  }) {
    return insertNewTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_InsertNewTransaction value)? insertNewTransaction,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (insertNewTransaction != null) {
      return insertNewTransaction(this);
    }
    return orElse();
  }
}

abstract class _InsertNewTransaction implements TransactionListEvent {
  const factory _InsertNewTransaction(final Transaction transaction) =
      _$InsertNewTransactionImpl;

  Transaction get transaction;
  @JsonKey(ignore: true)
  _$$InsertNewTransactionImplCopyWith<_$InsertNewTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$TransactionListEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'TransactionListEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) fetch,
    required TResult Function(Transaction transaction) insertNewTransaction,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetch,
    TResult? Function(Transaction transaction)? insertNewTransaction,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetch,
    TResult Function(Transaction transaction)? insertNewTransaction,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_InsertNewTransaction value) insertNewTransaction,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_InsertNewTransaction value)? insertNewTransaction,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_InsertNewTransaction value)? insertNewTransaction,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements TransactionListEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$TransactionListState {
  List<Transaction> get transactions => throw _privateConstructorUsedError;
  bool get hasReachedEnd => throw _privateConstructorUsedError;
  bool get isLoadingInitial => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  dynamic get newTransactionAdded => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionListStateCopyWith<TransactionListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionListStateCopyWith<$Res> {
  factory $TransactionListStateCopyWith(TransactionListState value,
          $Res Function(TransactionListState) then) =
      _$TransactionListStateCopyWithImpl<$Res, TransactionListState>;
  @useResult
  $Res call(
      {List<Transaction> transactions,
      bool hasReachedEnd,
      bool isLoadingInitial,
      bool isLoadingMore,
      dynamic newTransactionAdded,
      String? error});
}

/// @nodoc
class _$TransactionListStateCopyWithImpl<$Res,
        $Val extends TransactionListState>
    implements $TransactionListStateCopyWith<$Res> {
  _$TransactionListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? hasReachedEnd = null,
    Object? isLoadingInitial = null,
    Object? isLoadingMore = null,
    Object? newTransactionAdded = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingInitial: null == isLoadingInitial
          ? _value.isLoadingInitial
          : isLoadingInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      newTransactionAdded: freezed == newTransactionAdded
          ? _value.newTransactionAdded
          : newTransactionAdded // ignore: cast_nullable_to_non_nullable
              as dynamic,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosTransactionListStateImplCopyWith<$Res>
    implements $TransactionListStateCopyWith<$Res> {
  factory _$$PosTransactionListStateImplCopyWith(
          _$PosTransactionListStateImpl value,
          $Res Function(_$PosTransactionListStateImpl) then) =
      __$$PosTransactionListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Transaction> transactions,
      bool hasReachedEnd,
      bool isLoadingInitial,
      bool isLoadingMore,
      dynamic newTransactionAdded,
      String? error});
}

/// @nodoc
class __$$PosTransactionListStateImplCopyWithImpl<$Res>
    extends _$TransactionListStateCopyWithImpl<$Res,
        _$PosTransactionListStateImpl>
    implements _$$PosTransactionListStateImplCopyWith<$Res> {
  __$$PosTransactionListStateImplCopyWithImpl(
      _$PosTransactionListStateImpl _value,
      $Res Function(_$PosTransactionListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? hasReachedEnd = null,
    Object? isLoadingInitial = null,
    Object? isLoadingMore = null,
    Object? newTransactionAdded = freezed,
    Object? error = freezed,
  }) {
    return _then(_$PosTransactionListStateImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingInitial: null == isLoadingInitial
          ? _value.isLoadingInitial
          : isLoadingInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      newTransactionAdded: freezed == newTransactionAdded
          ? _value.newTransactionAdded!
          : newTransactionAdded,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PosTransactionListStateImpl implements _PosTransactionListState {
  const _$PosTransactionListStateImpl(
      {required final List<Transaction> transactions,
      required this.hasReachedEnd,
      required this.isLoadingInitial,
      required this.isLoadingMore,
      this.newTransactionAdded = false,
      this.error})
      : _transactions = transactions;

  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final bool hasReachedEnd;
  @override
  final bool isLoadingInitial;
  @override
  final bool isLoadingMore;
  @override
  @JsonKey()
  final dynamic newTransactionAdded;
  @override
  final String? error;

  @override
  String toString() {
    return 'TransactionListState(transactions: $transactions, hasReachedEnd: $hasReachedEnd, isLoadingInitial: $isLoadingInitial, isLoadingMore: $isLoadingMore, newTransactionAdded: $newTransactionAdded, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosTransactionListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.hasReachedEnd, hasReachedEnd) ||
                other.hasReachedEnd == hasReachedEnd) &&
            (identical(other.isLoadingInitial, isLoadingInitial) ||
                other.isLoadingInitial == isLoadingInitial) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            const DeepCollectionEquality()
                .equals(other.newTransactionAdded, newTransactionAdded) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactions),
      hasReachedEnd,
      isLoadingInitial,
      isLoadingMore,
      const DeepCollectionEquality().hash(newTransactionAdded),
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PosTransactionListStateImplCopyWith<_$PosTransactionListStateImpl>
      get copyWith => __$$PosTransactionListStateImplCopyWithImpl<
          _$PosTransactionListStateImpl>(this, _$identity);
}

abstract class _PosTransactionListState implements TransactionListState {
  const factory _PosTransactionListState(
      {required final List<Transaction> transactions,
      required final bool hasReachedEnd,
      required final bool isLoadingInitial,
      required final bool isLoadingMore,
      final dynamic newTransactionAdded,
      final String? error}) = _$PosTransactionListStateImpl;

  @override
  List<Transaction> get transactions;
  @override
  bool get hasReachedEnd;
  @override
  bool get isLoadingInitial;
  @override
  bool get isLoadingMore;
  @override
  dynamic get newTransactionAdded;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$PosTransactionListStateImplCopyWith<_$PosTransactionListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
