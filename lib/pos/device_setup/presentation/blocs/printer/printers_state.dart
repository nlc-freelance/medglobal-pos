part of 'printer_cubit.dart';

@freezed
class PrinterState with _$PrinterState {
  const factory PrinterState.initial() = _Initial;
  const factory PrinterState.loading() = _Loading;
  const factory PrinterState.loaded(List<Printer> printers) = _Loaded;
  const factory PrinterState.failure(String message) = _Failure;
  const factory PrinterState.printerSavedLocally() = _PrinterSavedLocally;
  const factory PrinterState.printerSavedLocalFailure(String message) = _PrinterSavedLocalFailure;
}
