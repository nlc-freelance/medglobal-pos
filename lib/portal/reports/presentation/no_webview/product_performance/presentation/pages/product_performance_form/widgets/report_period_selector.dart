import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/enums/reports_enum.dart';
import 'package:medglobal_admin_portal/core/utils/date_util.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/form/app_dropdown_form_field.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/no_webview/product_performance/presentation/cubit/product_performance_form_cubit/product_performance_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ReportPeriodSelector extends StatelessWidget {
  const ReportPeriodSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> years = DateUtil.getYears();
    final List<String> months = DateUtil.getMonths();

    return BlocBuilder<ProductPerformanceFormCubit, ProductPerformanceFormState>(
      builder: (context, state) {
        final cubit = context.read<ProductPerformanceFormCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDropdownFormField<Period>.static(
              items: Period.values,
              label: 'Period',
              hint: 'Select period',
              isRequired: true,
              value: state.period,
              getName: (period) => period.label,
              onChanged: (period) => cubit.setPeriod(period),
            ),
            if (state.period != null) ...[
              const UIVerticalSpace(16),
              if (state.period == Period.custom)
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: DatePickerPopup(
                    isInput: true,
                    onRemoveSelected: () {
                      cubit.setCustomStartDate(null);
                      cubit.setCustomEndDate(null);
                    },
                    onSelectRange: (dates) {
                      cubit.setCustomStartDate(dates[0]);
                      cubit.setCustomEndDate(dates[1]);
                    },
                    selectionMode: DateRangePickerSelectionMode.range,
                  ),
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: AppDropdownFormField<int>.static(
                        items: years,
                        label: 'Year',
                        hint: 'Select year',
                        isRequired: true,
                        value: state.year,
                        getName: (year) => year.toString(),
                        onChanged: (year) => cubit.setYear(year),
                      ),
                    ),
                    if (state.period != Period.annual) const UIHorizontalSpace(8),
                    if (state.period == Period.monthly)
                      Expanded(
                        child: AppDropdownFormField<String>.static(
                          items: months,
                          label: 'Month',
                          hint: 'Select month',
                          isRequired: true,
                          value: state.month,
                          getName: (month) => month,
                          onChanged: (month) => cubit.setMonth(month),
                        ),
                      ),
                    if (state.period == Period.quarterly)
                      Expanded(
                        child: AppDropdownFormField<Quarter>.static(
                          items: Quarter.values,
                          label: 'Quarter',
                          hint: 'Select quarter',
                          isRequired: true,
                          value: state.quarter,
                          getName: (quarter) => quarter.label,
                          onChanged: (quarter) => cubit.setQuarter(quarter),
                        ),
                      ),
                    if (state.period == Period.half)
                      Expanded(
                        child: AppDropdownFormField<HalfYear>.static(
                          items: HalfYear.values,
                          label: 'Half-Year',
                          hint: 'Select half-year',
                          isRequired: true,
                          value: state.halfYear,
                          getName: (half) => half.label,
                          onChanged: (half) => cubit.setHalfYear(half),
                        ),
                      ),
                  ],
                ),
            ],
          ],
        );
      },
    );
  }
}
