part of 'product_performance_form_cubit.dart';

@freezed
class ProductPerformanceFormState with _$ProductPerformanceFormState {
  const factory ProductPerformanceFormState({
    ProductPerformanceType? type,
    ProductPerformanceParams? reportParams,
    RankingCriteria? rankingCriteria,
    Period? period,
    int? year,
    String? month,
    Quarter? quarter,
    HalfYear? halfYear,
    DateTime? customStartDate,
    DateTime? customEndDate,
    @Default(true) bool isFormValid,
    @Default(true) bool isTypeSelected,
  }) = _BranchFormState;

  const ProductPerformanceFormState._();

  factory ProductPerformanceFormState.initial() => const ProductPerformanceFormState();

  ProductPNLParams? get productPNLParams => reportParams is ProductPNLParams ? reportParams as ProductPNLParams : null;

  ProductABCParams? get productABCParams => reportParams is ProductABCParams ? reportParams as ProductABCParams : null;

  bool get _hasPeriod {
    return switch (period) {
      Period.custom => customStartDate != null && customEndDate != null,
      Period.monthly => year != null && month != null,
      Period.quarterly => year != null && quarter != null,
      Period.half => year != null && halfYear != null,
      Period.annual => year != null,
      _ => false,
    };
  }

  bool get hasAllRequiredFields {
    if (type == null) return false;

    switch (type!) {
      case ProductPerformanceType.abc:
        final params = reportParams as ProductABCParams;
        final hasBranch = params.branch != null;
        final hasRankingCriteria = rankingCriteria != null;

        return hasBranch && hasRankingCriteria && _hasPeriod;
      case ProductPerformanceType.pnl:
        final params = reportParams as ProductPNLParams;
        final topN = params.topN;

        final hasCategory = params.categories?.isNotEmpty == true;
        final hasTopN = topN != null && topN > 0;
        final hasRankingCriteria = rankingCriteria != null;

        return hasCategory && hasTopN && hasRankingCriteria && _hasPeriod;
    }
  }

  ReportType? get reportType {
    if (type == null) return null;
    return type!.toReportType;
  }

  String? get _startDateByPeriod {
    if (period == null) return null;

    DateTime? date;

    switch (period) {
      case Period.custom:
        if (customStartDate == null) return null;
        date = customStartDate;
        break;
      case Period.monthly:
        if (month == null || year == null) return null;
        final monthNumber = DateUtil.getMonthNumber(month!);
        date = DateUtil.getMonthStartDate(year!, monthNumber);
        break;
      case Period.quarterly:
        if (quarter == null || year == null) return null;
        date = DateUtil.getStartDateByQuarter(year!, quarter!);
        break;
      case Period.half:
        if (halfYear == null || year == null) return null;
        date = DateUtil.getStartDateByHalfYear(year!, halfYear!);
        break;
      case Period.annual:
        date = DateUtil.getYearStartDate(year!);
        break;
      default:
        return null;
    }

    return DateFormat('yyyy-MM-dd').format(date!);
  }

  String? get _endDateByPeriod {
    if (period == null) return null;

    DateTime? date;
    switch (period) {
      case Period.custom:
        if (customEndDate == null) return null;
        date = customEndDate;
        break;
      case Period.monthly:
        if (month == null || year == null) return null;
        final monthNumber = DateUtil.getMonthNumber(month!);
        date = DateUtil.getMonthEndDate(year!, monthNumber);
        break;
      case Period.quarterly:
        if (quarter == null || year == null) return null;
        date = DateUtil.getEndDateByQuarter(year!, quarter!);
        break;
      case Period.half:
        if (halfYear == null || year == null) return null;
        date = DateUtil.getEndDateByHalfYear(year!, halfYear!);
        break;
      case Period.annual:
        date = DateUtil.getYearEndDate(year!);
        break;
      default:
        return null;
    }

    return DateFormat('yyyy-MM-dd').format(date!);
  }

  ReportPayload? get toPayload {
    if (!isFormValid) return null;

    final payload = switch (type!) {
      ProductPerformanceType.abc => CreateProductABCDto(
          branchId: productABCParams!.branch!.id!,
          rankingCriteria: rankingCriteria!.name,
          startDate: _startDateByPeriod!,
          endDate: _endDateByPeriod!,
        ).toJson(),
      ProductPerformanceType.pnl => CreateProductPNLDto(
          productCategoryIds: productPNLParams!.categories!.map((category) => category.id!).toList(),
          topSize: productPNLParams!.topN!,
          rankingCriteria: rankingCriteria!.name,
          startDate: _startDateByPeriod!,
          endDate: _endDateByPeriod!,
        ).toJson(),
    };

    return ReportPayload(
      type: reportType!.value,
      payload: payload,
    );
  }
}
