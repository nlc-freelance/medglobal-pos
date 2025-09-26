import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/pos/register/domain/usecases/print_receipt_usecase.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

part 'print_receipt_state.dart';

class PrintReceiptCubit extends Cubit<PrintReceiptState> {
  final PrintReceiptUseCase _printReceiptUseCase;

  PrintReceiptCubit({required PrintReceiptUseCase printReceiptUseCase})
      : _printReceiptUseCase = printReceiptUseCase,
        super(PrintReceiptInitial());

  Future<void> generateAndPrintReceipt(Transaction transaction) async {
    emit(PrintReceiptLoading());

    try {
      final printer = await GetIt.I<AppDatabase>().settingsDao.getPrinter();

      if (printer == null) {
        emit(PrinterNotSetup());
        return;
      }

      final result = await _printReceiptUseCase.call(transaction);

      result.fold(
        (failure) => emit(PrintReceiptError(failure.message)),
        (_) => emit(PrintReceiptSuccess()),
      );
    } catch (e) {
      emit(PrintReceiptError(e.toString()));
    }
  }
}
