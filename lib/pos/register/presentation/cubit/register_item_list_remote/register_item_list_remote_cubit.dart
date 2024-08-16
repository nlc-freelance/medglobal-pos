import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/register_items/register_item.dart';
import 'package:medglobal_admin_portal/pos/register/domain/usecases/register_items/get_register_items_usecase.dart';

part 'register_item_list_remote_state.dart';

class RegisterItemListRemoteCubit extends Cubit<RegisterItemListRemoteState> {
  final GetRegisterItemsUseCase _getRegisterItemsUseCase;

  RegisterItemListRemoteCubit(this._getRegisterItemsUseCase) : super(RegisterItemListInitial());

  int _currentPage = 1;
  Set<RegisterItem> _products = {};

  Future<void> getRegisterItems({String? search, bool isInitialSearch = false}) async {
    if (isInitialSearch) {
      _products = {};
      _currentPage = 1;
    }

    if (_currentPage == 1) emit(RegisterItemListLoading());

    try {
      final result = await _getRegisterItemsUseCase.call(GetRegisterItemsParams(page: _currentPage, search: search));
      result.fold(
        (error) => emit(RegisterItemListError(message: error.message)),
        (products) {
          _currentPage++;
          _products = {..._products, ...?products.data};

          emit(RegisterItemListLoaded(
            products: _products.toList(),
            hasReachedMax: products.currentPage == products.totalPages,
          ));
        },
      );
    } catch (e) {
      emit(RegisterItemListError(message: e.toString()));
    }
  }

  void reset() => emit(RegisterItemListInitial());
}
