// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_transaction_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PosTransactionListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) fetch,
    required TResult Function(Transaction transaction) addTransactionToList,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetch,
    TResult? Function(Transaction transaction)? addTransactionToList,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetch,
    TResult Function(Transaction transaction)? addTransactionToList,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddTransactionToList value) addTransactionToList,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddTransactionToList value)? addTransactionToList,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddTransactionToList value)? addTransactionToList,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosTransactionListEventCopyWith<$Res> {
  factory $PosTransactionListEventCopyWith(PosTransactionListEvent value,
          $Res Function(PosTransactionListEvent) then) =
      _$PosTransactionListEventCopyWithImpl<$Res, PosTransactionListEvent>;
}

/// @nodoc
class _$PosTransactionListEventCopyWithImpl<$Res,
        $Val extends PosTransactionListEvent>
    implements $PosTransactionListEventCopyWith<$Res> {
  _$PosTransactionListEventCopyWithImpl(this._value, this._then);

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
    extends _$PosTransactionListEventCopyWithImpl<$Res, _$FetchImpl>
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
    return 'PosTransactionListEvent.fetch(search: $search)';
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
    required TResult Function(Transaction transaction) addTransactionToList,
    required TResult Function() reset,
  }) {
    return fetch(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetch,
    TResult? Function(Transaction transaction)? addTransactionToList,
    TResult? Function()? reset,
  }) {
    return fetch?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetch,
    TResult Function(Transaction transaction)? addTransactionToList,
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
    required TResult Function(_AddTransactionToList value) addTransactionToList,
    required TResult Function(_Reset value) reset,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddTransactionToList value)? addTransactionToList,
    TResult? Function(_Reset value)? reset,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddTransactionToList value)? addTransactionToList,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PosTransactionListEvent {
  const factory _Fetch({final String? search}) = _$FetchImpl;

  String? get search;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddTransactionToListImplCopyWith<$Res> {
  factory _$$AddTransactionToListImplCopyWith(_$AddTransactionToListImpl value,
          $Res Function(_$AddTransactionToListImpl) then) =
      __$$AddTransactionToListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Transaction transaction});

  $TransactionCopyWith<$Res> get transaction;
}

/// @nodoc
class __$$AddTransactionToListImplCopyWithImpl<$Res>
    extends _$PosTransactionListEventCopyWithImpl<$Res,
        _$AddTransactionToListImpl>
    implements _$$AddTransactionToListImplCopyWith<$Res> {
  __$$AddTransactionToListImplCopyWithImpl(_$AddTransactionToListImpl _value,
      $Res Function(_$AddTransactionToListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$AddTransactionToListImpl(
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

class _$AddTransactionToListImpl implements _AddTransactionToList {
  const _$AddTransactionToListImpl(this.transaction);

  @override
  final Transaction transaction;

  @override
  String toString() {
    return 'PosTransactionListEvent.addTransactionToList(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTransactionToListImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTransactionToListImplCopyWith<_$AddTransactionToListImpl>
      get copyWith =>
          __$$AddTransactionToListImplCopyWithImpl<_$AddTransactionToListImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? search) fetch,
    required TResult Function(Transaction transaction) addTransactionToList,
    required TResult Function() reset,
  }) {
    return addTransactionToList(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetch,
    TResult? Function(Transaction transaction)? addTransactionToList,
    TResult? Function()? reset,
  }) {
    return addTransactionToList?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetch,
    TResult Function(Transaction transaction)? addTransactionToList,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (addTransactionToList != null) {
      return addTransactionToList(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_AddTransactionToList value) addTransactionToList,
    required TResult Function(_Reset value) reset,
  }) {
    return addTransactionToList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddTransactionToList value)? addTransactionToList,
    TResult? Function(_Reset value)? reset,
  }) {
    return addTransactionToList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddTransactionToList value)? addTransactionToList,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (addTransactionToList != null) {
      return addTransactionToList(this);
    }
    return orElse();
  }
}

abstract class _AddTransactionToList implements PosTransactionListEvent {
  const factory _AddTransactionToList(final Transaction transaction) =
      _$AddTransactionToListImpl;

  Transaction get transaction;
  @JsonKey(ignore: true)
  _$$AddTransactionToListImplCopyWith<_$AddTransactionToListImpl>
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
    extends _$PosTransactionListEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'PosTransactionListEvent.reset()';
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
    required TResult Function(Transaction transaction) addTransactionToList,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? search)? fetch,
    TResult? Function(Transaction transaction)? addTransactionToList,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? search)? fetch,
    TResult Function(Transaction transaction)? addTransactionToList,
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
    required TResult Function(_AddTransactionToList value) addTransactionToList,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_AddTransactionToList value)? addTransactionToList,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_AddTransactionToList value)? addTransactionToList,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements PosTransactionListEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$PosTransactionListState {
  List<Transaction> get transactions => throw _privateConstructorUsedError;
  bool get hasReachedMax => throw _privateConstructorUsedError;
  bool get hasNoData => throw _privateConstructorUsedError;
  bool get isLoadingInitial => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PosTransactionListStateCopyWith<PosTransactionListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosTransactionListStateCopyWith<$Res> {
  factory $PosTransactionListStateCopyWith(PosTransactionListState value,
          $Res Function(PosTransactionListState) then) =
      _$PosTransactionListStateCopyWithImpl<$Res, PosTransactionListState>;
  @useResult
  $Res call(
      {List<Transaction> transactions,
      bool hasReachedMax,
      bool hasNoData,
      bool isLoadingInitial,
      bool isLoadingMore,
      String? error});
}

/// @nodoc
class _$PosTransactionListStateCopyWithImpl<$Res,
        $Val extends PosTransactionListState>
    implements $PosTransactionListStateCopyWith<$Res> {
  _$PosTransactionListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? hasReachedMax = null,
    Object? hasNoData = null,
    Object? isLoadingInitial = null,
    Object? isLoadingMore = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNoData: null == hasNoData
          ? _value.hasNoData
          : hasNoData // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingInitial: null == isLoadingInitial
          ? _value.isLoadingInitial
          : isLoadingInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosTransactionListStateImplCopyWith<$Res>
    implements $PosTransactionListStateCopyWith<$Res> {
  factory _$$PosTransactionListStateImplCopyWith(
          _$PosTransactionListStateImpl value,
          $Res Function(_$PosTransactionListStateImpl) then) =
      __$$PosTransactionListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Transaction> transactions,
      bool hasReachedMax,
      bool hasNoData,
      bool isLoadingInitial,
      bool isLoadingMore,
      String? error});
}

/// @nodoc
class __$$PosTransactionListStateImplCopyWithImpl<$Res>
    extends _$PosTransactionListStateCopyWithImpl<$Res,
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
    Object? hasReachedMax = null,
    Object? hasNoData = null,
    Object? isLoadingInitial = null,
    Object? isLoadingMore = null,
    Object? error = freezed,
  }) {
    return _then(_$PosTransactionListStateImpl(
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNoData: null == hasNoData
          ? _value.hasNoData
          : hasNoData // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingInitial: null == isLoadingInitial
          ? _value.isLoadingInitial
          : isLoadingInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
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
      required this.hasReachedMax,
      required this.hasNoData,
      required this.isLoadingInitial,
      required this.isLoadingMore,
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
  final bool hasReachedMax;
  @override
  final bool hasNoData;
  @override
  final bool isLoadingInitial;
  @override
  final bool isLoadingMore;
  @override
  final String? error;

  @override
  String toString() {
    return 'PosTransactionListState(transactions: $transactions, hasReachedMax: $hasReachedMax, hasNoData: $hasNoData, isLoadingInitial: $isLoadingInitial, isLoadingMore: $isLoadingMore, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosTransactionListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.hasNoData, hasNoData) ||
                other.hasNoData == hasNoData) &&
            (identical(other.isLoadingInitial, isLoadingInitial) ||
                other.isLoadingInitial == isLoadingInitial) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactions),
      hasReachedMax,
      hasNoData,
      isLoadingInitial,
      isLoadingMore,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PosTransactionListStateImplCopyWith<_$PosTransactionListStateImpl>
      get copyWith => __$$PosTransactionListStateImplCopyWithImpl<
          _$PosTransactionListStateImpl>(this, _$identity);
}

abstract class _PosTransactionListState implements PosTransactionListState {
  const factory _PosTransactionListState(
      {required final List<Transaction> transactions,
      required final bool hasReachedMax,
      required final bool hasNoData,
      required final bool isLoadingInitial,
      required final bool isLoadingMore,
      final String? error}) = _$PosTransactionListStateImpl;

  @override
  List<Transaction> get transactions;
  @override
  bool get hasReachedMax;
  @override
  bool get hasNoData;
  @override
  bool get isLoadingInitial;
  @override
  bool get isLoadingMore;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$PosTransactionListStateImplCopyWith<_$PosTransactionListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
