import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/sales_per_shift/sales_per_shift_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/presentation/sales_per_shift_details/widgets/shift_cash_drawer_summary.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/presentation/sales_per_shift_details/widgets/shift_sales_summary.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/presentation/sales_per_shift_details/widgets/shift_transactions_paginated_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SalesPerShiftDetailsPage extends StatefulWidget {
  const SalesPerShiftDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<SalesPerShiftDetailsPage> createState() => _SalesPerShiftDetailsPageState();
}

class _SalesPerShiftDetailsPageState extends State<SalesPerShiftDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SalesPerShiftCubit>().getSalesPerShift(int.parse(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesPerShiftCubit, SalesPerShiftState>(
      builder: (context, state) {
        if (state is SalesPerShiftError) {
          return Text(state.message);
        }
        if (state is SalesPerShiftLoaded) {
          final shift = state.salesPerShift;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PageHeader(title: 'Shift Details'),
                const UIVerticalSpace(20),
                const PageSectionTitle(title: 'General Information'),
                GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 60,
                  ),
                  shrinkWrap: true,
                  children: [
                    LabelValue.text(
                      label: 'Open Time',
                      value: shift.openTime != null
                          ? DateFormat('MM/dd/yyyy HH:mm').format(shift.openTime!)
                          : Strings.noValue,
                    ),
                    LabelValue.text(
                      label: 'Close Time',
                      value: shift.closeTime != null
                          ? DateFormat('MM/dd/yyyy HH:mm').format(shift.closeTime!)
                          : Strings.noValue,
                    ),
                    LabelValue.text(
                      label: 'Branch',
                      value: shift.branch,
                    ),
                    LabelValue.text(
                      label: 'Register',
                      value: shift.register.toString(),
                    ),
                    LabelValue.text(
                      label: 'Opened By',
                      value: shift.openedBy,
                    ),
                    LabelValue.text(
                      label: 'Closed By',
                      value: shift.closedBy,
                    ),
                  ],
                ),
                const UIVerticalSpace(20),
                const PageSectionTitle(title: 'Sales Summary'),
                ShiftSalesSummary(state.salesPerShift),
                const UIVerticalSpace(30),
                const PageSectionTitle(title: 'Cash Drawer Summary'),
                ShiftCashDrawerSummary(state.salesPerShift),
                const UIVerticalSpace(30),
                UIText.heading5('Transactions'),
                const UIVerticalSpace(10),
                ShiftTransactionPaginatedDataGrid(int.parse(widget.id)),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2));
      },
    );
  }
}
