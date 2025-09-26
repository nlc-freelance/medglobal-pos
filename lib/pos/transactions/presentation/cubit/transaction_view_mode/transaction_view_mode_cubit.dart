import 'package:bloc/bloc.dart';

enum TransactionViewMode { sale, refund, issueRefund }

class TransactionViewModeCubit extends Cubit<TransactionViewMode> {
  TransactionViewModeCubit() : super(TransactionViewMode.sale);

  void view(TransactionViewMode mode) => emit(mode);
}
