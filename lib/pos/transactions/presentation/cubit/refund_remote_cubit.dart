// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:medglobal_admin_portal/pos/transactions/domain/usecases/create_refund_transaction_usecase.dart';
// import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

// part 'refund_remote_state.dart';

// class RefundRemoteCubit extends Cubit<RefundRemoteState> {
//   final CreateRefundTransactionUseCase _createRefundTransactionUseCase;

//   RefundRemoteCubit(this._createRefundTransactionUseCase) : super(RefundInitial());

//   void reset() => emit(RefundInitial());

//   Future<void> createRefund(Transaction refund) async {
//     emit(RefundLoading());

//     try {
//       final result = await _createRefundTransactionUseCase.call(CreateRefundTransactionParams(refund));
//       result.fold(
//         (error) => emit(RefundError(message: error.message)),
//         (refund) => emit(RefundSuccess(refund: refund)),
//       );
//     } catch (e) {
//       emit(RefundError(message: e.toString()));
//     }
//   }
// }
