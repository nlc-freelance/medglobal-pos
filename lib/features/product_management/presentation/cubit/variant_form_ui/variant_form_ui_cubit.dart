import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'variant_form_ui_state.dart';

class VariantFormUiCubit extends Cubit<bool> {
  VariantFormUiCubit() : super(false);

  void showVariantFormUi() => emit(true);

  void hideVariantFormUi() => emit(false);
}
