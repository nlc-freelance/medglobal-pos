import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/transactions/sale/presentation/cubit/sale_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sale/presentation/cubit/sale_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sale/presentation/pages/sale_transaction_list/sale_transaction_list_toolbar.dart';
import 'package:medglobal_admin_portal/portal/transactions/sale/presentation/pages/sale_transaction_list/sale_transaction_paginated_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SaleTransactionListPage extends StatefulWidget {
  const SaleTransactionListPage({super.key});

  @override
  State<SaleTransactionListPage> createState() => _SaleTransactionsPageState();
}

class _SaleTransactionsPageState extends State<SaleTransactionListPage> {
  @override
  void initState() {
    super.initState();
    context.read<SaleTransactionListFilterCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Sales',
          subtitle: 'View all sale transactions to analyze sales performance.',
        ),
        UIVerticalSpace(20),
        SaleTransactionListToolbar(),
        UIVerticalSpace(20),
        Expanded(child: SaleTransactionPaginatedDataGrid()),
      ],
    );
  }
}
