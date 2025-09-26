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
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/cubit/product_performance_form_cubit/params.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';

part 'product_performance_form_state.dart';
part 'product_performance_form_cubit.freezed.dart';

class ProductPerformanceFormCubit extends Cubit<ProductPerformanceFormState> {
  ProductPerformanceFormCubit() : super(ProductPerformanceFormState.initial());

  void setType(ProductPerformanceType? type) => emit(state.copyWith(
        type: type,
        reportParams: type == ProductPerformanceType.pnl
            ? const ProductPNLParams()
            : type == ProductPerformanceType.abc
                ? const ProductABCParams()
                : null,
      ));

  // Product Profit & Loss Statement
  void toggleCategory(Category category) {
    final params = state.reportParams;
    if (params is! ProductPNLParams) return;

    final exists = (params.categories ?? []).any((c) => c.id == category.id);

    if (exists) {
      removeCategory(category);
      return;
    }

    final updatedCategories = [...?params.categories, category];
    emit(state.copyWith(reportParams: params.copyWith(categories: updatedCategories)));
  }

  void removeCategory(Category category) {
    final params = state.reportParams;
    if (params is! ProductPNLParams) return;

    final updatedCategories = (params.categories ?? []).where((c) => c.id != category.id).toList();
    emit(state.copyWith(reportParams: params.copyWith(categories: updatedCategories)));
  }

  bool isCategorySelected(Category category) {
    final params = state.reportParams;
    if (params is! ProductPNLParams) return false;

    return (params.categories ?? []).where((c) => c.id == category.id).isNotEmpty;
  }

  void setTopN(int? topN) {
    final params = state.reportParams;
    if (params is ProductPNLParams) {
      emit(state.copyWith(reportParams: params.copyWith(topN: topN)));
    }
  }

  void setBranch(Branch? branch) {
    final params = state.reportParams;
    if (params is ProductABCParams) {
      emit(state.copyWith(reportParams: params.copyWith(branch: branch)));
    }
    if (params is ProductPNLParams) {
      emit(state.copyWith(reportParams: params.copyWith(branch: branch)));
    }
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
