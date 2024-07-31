import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_items/register_item.dart';
import 'package:medglobal_admin_portal/pos/register/domain/usecases/register_items/get_register_items_usecase.dart';

part 'register_item_list_remote_state.dart';

class RegisterItemListRemoteCubit extends Cubit<RegisterItemListRemoteState> {
  final GetRegisterItemsUseCase _getRegisterItemsUseCase;

  RegisterItemListRemoteCubit(this._getRegisterItemsUseCase) : super(RegisterItemListInitial());

  Future<void> getRegisterItems({String? search, String? category}) async {
    emit(RegisterItemListLoading());

    try {
      final result = await _getRegisterItemsUseCase.call(GetRegisterItemsParams(search: search, category: category));
      result.fold(
        (error) => emit(RegisterItemListError(message: error.message)),
        (data) => emit(RegisterItemListLoaded(items: data.items!)),
      );
    } catch (e) {
      emit(RegisterItemListError(message: e.toString()));
    }
  }

  void reset() => emit(RegisterItemListInitial());
}
