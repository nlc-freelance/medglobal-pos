import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/sales_per_shift_filter/sales_per_shift_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/sales_per_shift_list/sales_per_shift_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/presentation/sales_per_shift_list/sales_per_shift_paginated_data_grid.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/presentation/sales_per_shift_list/sales_per_shift_toolbar.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SalesPerShiftPage extends StatefulWidget {
  const SalesPerShiftPage({super.key});

  @override
  State<SalesPerShiftPage> createState() => _SalesPerShiftPageState();
}

class _SalesPerShiftPageState extends State<SalesPerShiftPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Sales per Shift',
          subtitle:
              'View open and closing details, transactions, and funds generated within a shift to help analyze sales performance during different timeframes of the day.',
        ),
        UIVerticalSpace(20),
        SalesPerShiftToolbar(),
        UIVerticalSpace(20),
        Expanded(child: SalesPerShiftPaginatedDataGrid()),
      ],
    );
  }
}
