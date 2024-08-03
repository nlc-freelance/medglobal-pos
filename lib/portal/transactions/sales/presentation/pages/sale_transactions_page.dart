import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/filter_popup.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/pages/sale_transactions_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SaleTransactionsPage extends StatelessWidget {
  const SaleTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'Sales',
          subtitle: Strings.subtitlePlaceholder,
        ),
        const UIVerticalSpace(20),
        DataGridToolbar(
          isDownloadable: true,
          search: UISearchField(
            fieldWidth: 500.0,
            hint: 'Search receipt number',
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
        SaleTransactionDataGrid([
          Transaction(
            id: 1,
            receiptNumber: 00123242432,
            date: DateTime.now(),
            branch: Branch(id: 2, name: 'Manila Branch'),
            registerId: 1,
            subtotal: 200,
            total: 200,
          )
        ]),
        // BlocBuilder<TransactionListRemoteCubit, TransactionListRemoteState>(
        //   builder: (context, state) {
        //     if (state is TransactionListError) {
        //       return Text(state.message);
        //     }
        //     if (state is TransactionListLoaded) {
        //       return Expanded(
        //         child: TransactionDataGrid(state.transactions),
        //       );
        //     }
        //     return DataGridLoading(
        //       columns: DataGridUtil.getColumns(DataGridColumn.PURCHASE_ORDERS, showId: true),
        //       source: TransactionDataSource([]),
        //     );
        //   },
        // ),
      ],
    );
  }
}
