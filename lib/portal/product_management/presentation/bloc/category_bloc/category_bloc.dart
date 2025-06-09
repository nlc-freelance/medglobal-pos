import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/category_repository.dart';

part 'category_bloc_event.dart';
part 'category_bloc_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _repository;

  CategoryBloc(this._repository) : super(const CategoryState.initial()) {
    on<_CreateCategory>(_onCreateCategory);
  }

  Future<void> _onCreateCategory(event, emit) async {
    emit(const CategoryState.processing());

    try {
      final result = await _repository.addCategory(event.name);
      result.fold(
        (error) => emit(CategoryState.failure(error.message)),
        (category) => emit(CategoryState.success(category)),
      );
    } catch (e) {
      emit(CategoryState.failure(e.toString()));
    }
  }
}
