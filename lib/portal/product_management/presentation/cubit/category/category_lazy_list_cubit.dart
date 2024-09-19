import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/category/get_categories_usecase.dart';

part 'category_lazy_list_state.dart';

class CategoryLazyListCubit extends Cubit<CategoryLazyListState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  CategoryLazyListCubit(this._getCategoriesUseCase) : super(CategoryLazyListState.initial());

  int _currentPage = 1;
  int _totalCount = -1;
  Set<Category> _categories = {};

  void reset() {
    _categories = {};
    _currentPage = 1;
    emit(CategoryLazyListState.initial());
  }

  Future<void> getCategories({String? search, bool isInitialSearch = false}) async {
    if (_categories.length != _totalCount) {
      if (isInitialSearch) {
        _categories = {};
        _currentPage = 1;
      }

      if (_currentPage == 1) {
        emit(state.copyWith(isInitLoading: true));
      } else {
        emit(state.copyWith(isLoadingMore: true));
      }

      try {
        final result = await _getCategoriesUseCase.call(GetCategoriesParams(page: _currentPage));
        result.fold(
          (error) => emit(state.copyWith(isInitLoading: false, isLoadingMore: false, error: error.message)),
          (data) {
            _currentPage++;
            _categories = {..._categories, ...?data.categories};
            _totalCount = data.totalCount!;
            emit(state.copyWith(
              isInitLoading: false,
              isLoadingMore: false,
              categories: _categories.toList(),
              hasNoData: data.totalCount == 0 && data.categories?.isEmpty == true,
              hasReachedMax: data.currentPage == data.totalPages,
            ));
          },
        );
      } catch (e) {
        emit(state.copyWith(isInitLoading: false, isLoadingMore: false, error: e.toString()));
      }
    }
  }
}
