part of 'register_transaction_bloc.dart';

@freezed
class RegisterTransactionEvent with _$RegisterTransactionEvent {
  const factory RegisterTransactionEvent.getById(int id) = _GetTransactionById;
  // const factory RegisterTransactionEvent.reset() = _Reset;
}
