part of 'print_receipt_cubit.dart';

sealed class PrintReceiptState extends Equatable {
  const PrintReceiptState();

  @override
  List<Object> get props => [];
}

final class PrintReceiptInitial extends PrintReceiptState {}

final class PrintReceiptLoading extends PrintReceiptState {}

final class PrintReceiptSuccess extends PrintReceiptState {}

final class PrinterNotSetup extends PrintReceiptState {}

final class PrintReceiptError extends PrintReceiptState {
  const PrintReceiptError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
