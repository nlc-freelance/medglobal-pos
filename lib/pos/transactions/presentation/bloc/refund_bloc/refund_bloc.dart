import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/usecases/issue_refund_usecase.dart';

part 'refund_event.dart';
part 'refund_state.dart';
part 'refund_bloc.freezed.dart';

class RefundBloc extends Bloc<RefundEvent, RefundState> {
  final IssueRefundUseCase _issueRefundUseCase;

  RefundBloc({required IssueRefundUseCase issueRefundUseCase})
      : _issueRefundUseCase = issueRefundUseCase,
        super(const RefundState.initial()) {
    on<_CreateRefund>(_onCreateRefund);
    on<_Reset>(_onReset);
  }

  Future<void> _onCreateRefund(_CreateRefund event, Emitter<RefundState> emit) async {
    emit(const RefundState.processing());

    try {
      final result = await _issueRefundUseCase.call(
        saleTransaction: event.saleTransaction,
        items: event.items,
        reasonForRefund: event.reasonForRefund,
      );
      result.when(
        success: (refund) => emit(RefundState.success(refund)),
        failure: (error) => emit(RefundState.failure(error.message)),
      );
    } catch (e) {
      emit(RefundState.failure(e.toString()));
    }
  }

  void _onReset(_Reset event, Emitter<RefundState> emit) => emit(const RefundState.initial());
}
