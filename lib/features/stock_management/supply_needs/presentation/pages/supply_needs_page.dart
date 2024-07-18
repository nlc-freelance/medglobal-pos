import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/presentation/cubit/supply_needs/supply_needs_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/supply_needs/presentation/pages/supply_needs_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SupplyNeedsPage extends StatefulWidget {
  const SupplyNeedsPage({super.key});

  @override
  State<SupplyNeedsPage> createState() => _SupplyNeedsPageState();
}

class _SupplyNeedsPageState extends State<SupplyNeedsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SupplyNeedsCubit>().getSupplyNeeds();
  }

  @override
  Widget build(BuildContext context) {
    final columns = DataGridUtil.getColumns(DataGridColumn.SUPPLY_NEEDS);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'Supply Needs',
          subtitle: Strings.subtitlePlaceholder,
        ),
        DataGridToolbar(
          searchPlaceholder: 'Search branch name',
          filters: [
            UIButton.outlined(
              'All Branches',
              iconAlign: IconAlignment.end,
              iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
              onClick: () {},
            ),
          ],
        ),
        BlocBuilder<SupplyNeedsCubit, SupplyNeedsState>(
          builder: (context, state) {
            if (state is SupplyNeedsError) {
              return Text(state.message);
            }
            if (state is SupplyNeedsLoaded) {
              return Expanded(
                child: SupplyNeedsDataGrid(state.supplyNeeds),
              );
            }
            return DataGridLoading(
              columns: columns,
              source: SupplyNeedsDataSource([]),
            );
          },
        ),
      ],
    );
  }
}
