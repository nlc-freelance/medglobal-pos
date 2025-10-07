import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/entities/sales_per_category.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/repositories/sales_per_category_repository.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_category/domain/usecases/get_sales_per_category_usecase.dart';

part 'sales_per_category_state.dart';

class SalesPerCategoryCubit extends Cubit<SalesPerCategoryState> {
  final GetSalesPerCategoryUseCase _getSalesPerCategoryUseCase;

  SalesPerCategoryCubit(this._getSalesPerCategoryUseCase) : super(SalesPerCategoryInitial());

  Future<void> getSalesPerCategory(SalesPerCategoryPayload payload) async {
    emit(SalesPerCategoryLoading());

    try {
      final result = await _getSalesPerCategoryUseCase.call(GetSalesPerCategoryParams(payload: payload));
      result.when(
        success: (data) => emit(SalesPerCategoryLoaded(data: data)),
        failure: (error) => emit(SalesPerCategoryError(message: error.message)),
      );
    } catch (e) {
      emit(SalesPerCategoryError(message: e.toString()));
    }
  }
}
