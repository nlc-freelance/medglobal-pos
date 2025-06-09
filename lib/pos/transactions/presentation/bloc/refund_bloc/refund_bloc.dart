import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/refund_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

part 'refund_event.dart';
part 'refund_state.dart';
part 'refund_bloc.freezed.dart';

class RefundBloc extends Bloc<RefundEvent, RefundState> {
  final RefundRepository _repository;

  RefundBloc(this._repository) : super(const RefundState.initial()) {
    on<RefundEvent>(_onCreateRefund);
  }

  Future<void> _onCreateRefund(event, emit) async {
    emit(const RefundState.processing());

    try {
      final result = await _repository.createRefund(
        registerId: event.registerId,
        saleId: event.saleId,
        items: event.items,
        reasonForRefund: event.reasonForRefund,
      );
      result.fold(
        (error) => emit(RefundState.failure(error.message)),
        (refund) => emit(RefundState.success(refund)),
      );
    } catch (e) {
      emit(RefundState.failure(e.toString()));
    }
  }

  void reset(event, emit) => emit(RefundState.initial());
}
