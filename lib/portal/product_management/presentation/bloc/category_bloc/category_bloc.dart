import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/product_management/data/dto/category/category_payload.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/repositories/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _repository;

  CategoryBloc(this._repository) : super(const CategoryState.initial()) {
    on<_CreateCategory>(_onCreateCategory);
    on<_Reset>(_onReset);
  }

  Future<void> _onCreateCategory(_CreateCategory event, Emitter<CategoryState> emit) async {
    emit(const CategoryState.processing());

    try {
      final payload = CategoryPayload(name: event.name);

      final result = await _repository.createCategory(payload);

      result.when(
        success: (category) => emit(CategoryState.success(category)),
        failure: (failure) => emit(CategoryState.failure(failure.message)),
      );
    } catch (e) {
      emit(CategoryState.failure(e.toString()));
    }
  }

  void _onReset(_, emit) => emit(const CategoryState.initial());
}
