part of 'register_transaction_bloc.dart';

@freezed
class RegisterTransactionState with _$RegisterTransactionState {
  const factory RegisterTransactionState.initial() = _Initial;
  const factory RegisterTransactionState.loading() = _Loading;
  const factory RegisterTransactionState.loaded(Transaction transaction) = _Loaded;
  const factory RegisterTransactionState.failure(String message) = _Failure;
}
