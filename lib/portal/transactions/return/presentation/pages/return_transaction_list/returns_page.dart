import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/pages/return_transaction_list/return_transaction_paginated_data_grid.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/pages/return_transaction_list/returns_toolbar.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ReturnTransactionListPage extends StatelessWidget {
  const ReturnTransactionListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Returns',
          subtitle: 'View all return transactions and manage returned stocks.',
        ),
        UIVerticalSpace(20),
        ReturnsToolbar(),
        UIVerticalSpace(20),
        Expanded(child: ReturnTransactionPaginatedDataGrid()),
      ],
    );
  }
}
