import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_list_remote/stock_return_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_list/stock_return_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockReturnsPage extends StatefulWidget {
  const StockReturnsPage({super.key});

  @override
  State<StockReturnsPage> createState() => _StockReturnsPageState();
}

class _StockReturnsPageState extends State<StockReturnsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<StockReturnListRemoteCubit>().getStockReturns();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onChangeTab(int index) {
    if (index == 0) {
      context.read<StockReturnListRemoteCubit>().getStockReturns();
    }
    if (index == 1) {
      context.read<StockReturnListRemoteCubit>().getStockReturns(status: StockOrderStatus.NEW);
    }
    if (index == 2) {
      context.read<StockReturnListRemoteCubit>().getStockReturns(status: StockOrderStatus.COMPLETED);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Stock Returns',
          subtitle: Strings.subtitlePlaceholder,
          actions: [
            UIButton.filled(
              'New Stock Return',
              icon: Assets.icons.add.setSize(12.0),
              onClick: () => AppRouter.router.goNamed(SideMenuTreeItem.NEW_STOCK_RETURN.name),
            ),
          ],
        ),
        TabBar(
          controller: _tabController,
          onTap: onChangeTab,
          tabs: [
            const Tab(text: 'All Returns'),
            Tab(text: StockOrderStatus.NEW.label),
            Tab(text: StockOrderStatus.COMPLETED.label),
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
          searchPlaceholder: 'Search stock return ID',
          isDownloadable: true,
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
        BlocBuilder<StockReturnListRemoteCubit, StockReturnListRemoteState>(
          builder: (context, state) {
            if (state is StockReturnListError) {
              return Text(state.message);
            }
            if (state is StockReturnListLoaded) {
              return Expanded(
                child: StockReturnDataGrid(state.stockReturns),
              );
            }
            return DataGridLoading(
              columns: DataGridUtil.getColumns(DataGridColumn.STOCK_RETURNS),
              source: StockReturnDataSource([]),
            );
          },
        ),
      ],
    );
  }
}
