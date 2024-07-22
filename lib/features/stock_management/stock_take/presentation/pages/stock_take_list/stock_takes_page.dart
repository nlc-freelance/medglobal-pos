import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/cubit/new_stock_take/new_stock_take_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/pages/stock_take_list/widgets/new_stock_take_dialog.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/pages/stock_take_list/widgets/stock_take_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockTakesPage extends StatefulWidget {
  const StockTakesPage({super.key});

  @override
  State<StockTakesPage> createState() => _StockTakesPageState();
}

class _StockTakesPageState extends State<StockTakesPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    context.read<StockTakeListRemoteCubit>().getStockTakes();

    /// Reset NewStockTakeCubit
    context.read<NewStockTakeCubit>().reset();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onChangeTab(int index) {
    if (index == 0) {
      context.read<StockTakeListRemoteCubit>().getStockTakes();
    }
    if (index == 1) {
      context.read<StockTakeListRemoteCubit>().getStockTakes(status: StockOrderStatus.IN_PROGRESS);
    }
    if (index == 2) {
      context.read<StockTakeListRemoteCubit>().getStockTakes(status: StockOrderStatus.COMPLETED);
    }
    if (index == 3) {
      context.read<StockTakeListRemoteCubit>().getStockTakes(status: StockOrderStatus.CANCELLED);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Stock Takes',
          subtitle: Strings.subtitlePlaceholder,
          actions: [
            UIButton.filled(
              'New Stock Take',
              icon: Assets.icons.add.setSize(12.0),
              onClick: () => showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const NewStockTakeDialog(),
              ),
            ),
          ],
        ),
        TabBar(
          controller: _tabController,
          onTap: onChangeTab,
          tabs: [
            const Tab(text: 'All Takes'),
            Tab(text: StockOrderStatus.IN_PROGRESS.label),
            Tab(text: StockOrderStatus.COMPLETED.label),
            Tab(text: StockOrderStatus.CANCELLED.label),
          ],
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          dividerColor: UIColors.borderMuted,
          labelColor: UIColors.primary,
          labelStyle: UIStyleText.labelMedium,
          unselectedLabelColor: UIColors.textMuted,
          indicatorPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: UIColors.primary, width: 2.0),
            ),
          ),
          overlayColor: WidgetStateColor.resolveWith((state) {
            if (state.contains(WidgetState.pressed)) return UIColors.transparent;
            if (state.contains(WidgetState.hovered)) return UIColors.whiteBg;
            return UIColors.transparent;
          }),
        ),
        const UIVerticalSpace(20),
        DataGridToolbar(
          searchPlaceholder: 'Search branch name',
          filters: [
            UIButton.outlined(
              'Date',
              iconAlign: IconAlignment.end,
              iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
              onClick: () {},
            ),
            const UIHorizontalSpace(8),
            UIButton.outlined(
              'Filter',
              iconAlign: IconAlignment.end,
              iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
              onClick: () {},
            ),
          ],
        ),
        BlocBuilder<StockTakeListRemoteCubit, StockTakeListRemoteState>(
          builder: (context, state) {
            if (state is StockTakeListError) {
              return Text(state.message);
            }
            if (state is StockTakeListLoaded) {
              return Expanded(
                child: StockTakeDataGrid(state.stockTakes),
              );
            }
            return DataGridLoading(
              columns: DataGridUtil.getColumns(DataGridColumn.STOCK_TAKES),
              source: StockTakeDataSource([]),
            );
          },
        ),
      ],
    );
  }
}
