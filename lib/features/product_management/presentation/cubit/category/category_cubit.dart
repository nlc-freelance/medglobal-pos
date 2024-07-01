import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/category.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/usecases/category/add_category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final AddCategoryUseCase _addCategoryUseCase;

  CategoryCubit(this._addCategoryUseCase) : super(CategoryInitial());

  Future<void> addCategory(String name) async {
    emit(CategoryLoading());

    try {
      final result = await _addCategoryUseCase.call(AddCategoryParams(name));
      result.fold(
        (error) => emit(CategoryError(message: error.message)),
        (data) => emit(CategorySuccess(category: data)),
      );
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
