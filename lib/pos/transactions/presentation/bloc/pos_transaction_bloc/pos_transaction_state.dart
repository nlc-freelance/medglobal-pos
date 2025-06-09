part of 'pos_transaction_bloc.dart';

@freezed
class PosTransactionState with _$PosTransactionState {
  const factory PosTransactionState.initial() = _Initial;
  const factory PosTransactionState.loading() = _Loading;
  const factory PosTransactionState.loaded(Transaction transaction) = _Loaded;
  const factory PosTransactionState.failure(String message) = _Failure;
}
