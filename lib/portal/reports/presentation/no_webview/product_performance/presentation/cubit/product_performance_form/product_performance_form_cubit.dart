import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/reports_enum.dart';
import 'package:medglobal_admin_portal/core/utils/date_util.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/reports/data/dto/request/report_payload.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/data/dto/create_product_abc_dto.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/data/dto/create_product_pnl_dto.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';

part 'product_performance_form_state.dart';
part 'product_performance_form_cubit.freezed.dart';

class ProductPerformanceFormCubit extends Cubit<ProductPerformanceFormState> {
  ProductPerformanceFormCubit() : super(ProductPerformanceFormState.initial());

  void setType(ProductPerformanceType? type) => emit(state.copyWith(type: type));

  void toggleCategory(Category category) {
    final categories = state.categories;

    final exists = (categories ?? []).any((c) => c.id == category.id);

    if (exists) {
      removeCategory(category);
      return;
    }

    final updatedCategories = [...?categories, category];
    emit(state.copyWith(categories: updatedCategories));
  }

  void removeCategory(Category category) {
    final categories = state.categories;

    final updatedCategories = (categories ?? []).where((c) => c.id != category.id).toList();
    emit(state.copyWith(categories: updatedCategories));
  }

  void removeAllCategory() {
    emit(state.copyWith(categories: null));
  }

  bool isCategorySelected(Category category) {
    final categories = state.categories;

    return (categories ?? []).where((c) => c.id == category.id).isNotEmpty;
  }

  void setTopN(int? topN) {
    emit(state.copyWith(topN: topN));
  }

  void setBranch(Branch? branch) {
    emit(state.copyWith(branch: branch));
  }

  void setRankingCriteria(RankingCriteria? rankingCriteria) {
    emit(state.copyWith(rankingCriteria: rankingCriteria));
  }

  void setPeriod(Period? period) => emit(state.copyWith(
        period: period,
        year: null,
        month: null,
        quarter: null,
        halfYear: null,
      ));

  void setYear(int? year) => emit(state.copyWith(year: year));

  void setMonth(String? month) => emit(state.copyWith(month: month));

  void setQuarter(Quarter? quarter) => emit(state.copyWith(quarter: quarter));

  void setHalfYear(HalfYear? halfYear) => emit(state.copyWith(halfYear: halfYear));

  void setCustomStartDate(DateTime? customStartDate) {
    emit(state.copyWith(customStartDate: customStartDate));
  }

  void setCustomEndDate(DateTime? customEndDate) {
    return emit(state.copyWith(customEndDate: customEndDate));
  }

  void validate() => emit(state.copyWith(isFormValid: state.hasAllRequiredFields));

  void validateType() => emit(state.copyWith(isTypeSelected: state.type != null));

  void reset() => emit(ProductPerformanceFormState.initial());
}
