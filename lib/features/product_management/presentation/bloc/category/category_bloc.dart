import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/usecases/category/add_category.dart';
import '../../../domain/usecases/category/get_all_categories.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final AddCategoryUseCase _addCategoryUseCase;

  CategoryBloc(
    this._getCategoriesUseCase,
    this._addCategoryUseCase,
  ) : super(const CategoryListInitial()) {
    on<GetCategories>(_getCategories);
    on<AddCategory>(_addCategory);
  }

  List<Category> _categories = [];
  int _currentPage = 1;
  int? _totalPages;

  Future<void> _getCategories(GetCategories event, emit) async {
    if (event.isLoadMore && _currentPage > _totalPages!) return;

    emit(const CategoryListLoading());

    try {
      _currentPage = event.isLoadMore ? _currentPage + 1 : _currentPage;

      final result = await _getCategoriesUseCase.call(GetCategoriesParams(_currentPage));

      result.fold(
        (error) => emit(CategoryListError(message: error.message)),
        (data) {
          _totalPages = data.totalPages!;
          _categories = _categories..addAll(data.categories!);

          emit(CategoryListLoaded(categories: _categories.toSet().toList()));
        },
      );
    } catch (e) {
      emit(CategoryListError(message: e.toString()));
    }
  }

  Future<void> _addCategory(AddCategory event, emit) async {
    emit(const CategoryActionLoading());

    try {
      final result = await _addCategoryUseCase.call(AddCategoryParams(event.name));
      result.fold(
        (error) => emit(CategoryActionError(message: error.message)),
        (data) {
          emit(CategoryActionSuccess(category: data));
        },
      );
    } catch (e) {
      emit(CategoryActionError(message: e.toString()));
    }
  }
}
