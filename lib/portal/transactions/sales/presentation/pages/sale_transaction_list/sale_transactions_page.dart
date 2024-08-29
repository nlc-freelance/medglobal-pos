import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold_layout/pos/lazy_load_dropdown.dart';
import 'package:medglobal_admin_portal/portal/branches/data/branch_api.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/pages/sale_transaction_list/sale_transaction_paginated_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SaleTransactionsPage extends StatefulWidget {
  const SaleTransactionsPage({super.key});

  @override
  State<SaleTransactionsPage> createState() => _SaleTransactionsPageState();
}

class _SaleTransactionsPageState extends State<SaleTransactionsPage> {
  late List<Branch> _branches = [];

  @override
  void initState() {
    super.initState();
    // _getBranches();
  }

  /// TODO: Refactor to use custom dropdown implementation
  Future<void> _getBranches() async {
    try {
      final branches = await DataFetcher<Branch>((page) => GetIt.I<BranchApi>().getBranches()).fetchItems(1);
      setState(() => _branches = branches);
    } catch (e) {
      // Handle the error here
      print('Error fetching items: $e');
    }
  }

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
            // const UIHorizontalSpace(8),
            // UIPopupMenuButton.textIcon(
            //   title: 'All Branches',
            //   iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
            //   onSelect: (branch) {
            //     context.read<SaleTransactionListCubit>().getTransactions(
            //           branchId: branch.id,
            //         );
            //   },
            //   menu: _branches,
            //   menuAsString: (menu) => menu.name,
            // ),
            // SizedBox(
            //   width: 120,
            //   child: FilterPopup(onSelect: (date) {}),
            // ),
          ],
        ),
        const Expanded(child: SaleTransactionPaginatedDataGrid()),
      ],
    );
  }
}
