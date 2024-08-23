import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/print_util.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

part 'print_receipt_state.dart';

class PrintReceiptCubit extends Cubit<PrintReceiptState> {
  PrintReceiptCubit() : super(PrintReceiptInitial());

  Future<void> generateAndPrintReceipt(Transaction transaction, double cash, double change) async {
    emit(PrintReceiptLoading());

    try {
      await PrintUtil.generateAndPrintReceipt(transaction, cash, change);
      emit(PrintReceiptSuccess());
    } catch (e) {
      emit(PrintReceiptError(e.toString()));
    }
  }
}
