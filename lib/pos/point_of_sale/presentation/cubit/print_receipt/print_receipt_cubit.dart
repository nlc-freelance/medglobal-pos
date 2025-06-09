import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/utils/print_util.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/receipt_config.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

part 'print_receipt_state.dart';

class PrintReceiptCubit extends Cubit<PrintReceiptState> {
  PrintReceiptCubit() : super(PrintReceiptInitial());

  Future<void> generateAndPrintReceipt({required Transaction transaction, required ReceiptConfig receiptConfig}) async {
    emit(PrintReceiptLoading());

    try {
      await PrintUtil.generateAndPrintReceipt(transaction: transaction, config: receiptConfig);
      emit(PrintReceiptSuccess());
    } catch (e) {
      emit(PrintReceiptError(e.toString()));
    }
  }
}
