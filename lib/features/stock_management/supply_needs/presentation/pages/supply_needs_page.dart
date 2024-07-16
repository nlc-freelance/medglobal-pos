import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/presentation/pages/supply_needs_data_grid.dart';

class SupplyNeedsPage extends StatefulWidget {
  const SupplyNeedsPage({super.key});

  @override
  State<SupplyNeedsPage> createState() => _SupplyNeedsPageState();
}

class _SupplyNeedsPageState extends State<SupplyNeedsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final columns = DataGridUtil.getColumns(DataGridColumn.SUPPLY_NEEDS);

    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Supply Needs',
          subtitle: Strings.subtitlePlaceholder,
        ),
        DataGridToolbar(searchPlaceholder: 'Search branch name'),
        SupplyNeedsDataGrid(),
        // BlocBuilder<SupplyNeedListCubit, SupplyNeedListState>(
        //   builder: (context, state) {
        //     if (state is SupplyNeedListError) {
        //       return Text(state.message);
        //     }
        //     if (state is SupplyNeedListLoaded) {
        // return const Expanded(
        //   child: SupplyNeedsDataGrid(),
        //   );
        // }
        // return DataGridLoading(
        //   columns: columns,
        //   source: VariantDataSource([]),
        // );
        // },
        // ),
      ],
    );
  }
}
