import 'package:bloc/bloc.dart';

class VariantFormUiCubit extends Cubit<bool> {
  VariantFormUiCubit() : super(false);

  void showVariantFormUi() => emit(true);

  void hideVariantFormUi() => emit(false);
}
