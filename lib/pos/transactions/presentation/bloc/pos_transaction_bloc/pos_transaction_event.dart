part of 'pos_transaction_bloc.dart';

@freezed
class PosTransactionEvent with _$PosTransactionEvent {
  const factory PosTransactionEvent.getTransactionById(int id) = _GetTransactionById;
}
