import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/app_session_service.dart';
import 'package:printing/printing.dart';

part 'printers_state.dart';
part 'printer_cubit.freezed.dart';

class PrinterCubit extends Cubit<PrinterState> {
  PrinterCubit() : super(const PrinterState.initial());

  Future<void> findPrinters() async {
    await GetIt.I<AppDatabase>().settingsDao.clearPrinterSetting();

    emit(const PrinterState.loading());

    try {
      final printingInfo = await Printing.info();

      if (printingInfo.canListPrinters) {
        final printers = await Printing.listPrinters()
          ..sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
          );
        emit(PrinterState.loaded(printers));
      } else {
        emit(const PrinterState.failure(
            'Unexpected error occurred. Failed to get the list of available printers for this device.'));
      }
    } catch (e) {
      emit(PrinterState.failure(e.toString()));
    }
  }

  Future<void> savePrinterSetting(Printer printer) async {
    try {
      await GetIt.I<AppDatabase>().settingsDao.upsertPrinter(printer.url);
      GetIt.I<AppSessionService>().setPrinter(printer.name);
      emit(const PrinterState.printerSavedLocally());
    } catch (e) {
      emit(const PrinterState.printerSavedLocalFailure(
          'Failed to save selected printer locally. You can assign it later in app settings.'));
    }
  }
}
