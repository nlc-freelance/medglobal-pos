import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/filter_popup.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/pages/return_transaction_list/return_transaction_paginated_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ReturnTransactionsPage extends StatefulWidget {
  const ReturnTransactionsPage({super.key});

  @override
  State<ReturnTransactionsPage> createState() => _ReturnTransactionsPageState();
}

class _ReturnTransactionsPageState extends State<ReturnTransactionsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'Returns',
          subtitle: Strings.subtitlePlaceholder,
        ),
        const UIVerticalSpace(20),
        DataGridToolbar(
          isDownloadable: true,
          search: UISearchField(
            fieldWidth: 500.0,
            hint: 'Search receipt ID',
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Assets.icons.search.svg(),
            ),
            onChanged: (value) {},
          ),
          filters: [
            SizedBox(
              width: 150,
              child: DatePickerPopup(onSelect: (date) {}),
            ),
            const UIHorizontalSpace(8),
            SizedBox(
              width: 120,
              child: FilterPopup(onSelect: (date) {}),
            ),
          ],
        ),
        const Expanded(child: ReturnTransactionPaginatedDataGrid()),
      ],
    );
  }
}
