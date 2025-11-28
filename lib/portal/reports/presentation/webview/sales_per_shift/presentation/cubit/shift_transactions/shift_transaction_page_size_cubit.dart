import 'package:bloc/bloc.dart';

class ShiftTransactionPageSizeCubit extends Cubit<int> {
  ShiftTransactionPageSizeCubit() : super(20);

  void setSize(int value) => emit(value);
}
