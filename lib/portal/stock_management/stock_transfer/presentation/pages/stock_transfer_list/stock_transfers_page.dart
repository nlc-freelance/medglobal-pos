import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer/stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_list_remote/stock_transfer_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_remote/stock_transfer_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/pages/stock_transfer_list/stock_transfer_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockTransfersPage extends StatefulWidget {
  const StockTransfersPage({super.key});

  @override
  State<StockTransfersPage> createState() => _StockTransfersPageState();
}

class _StockTransfersPageState extends State<StockTransfersPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    context.read<StockTransferListRemoteCubit>().getStockTransfers();

    /// TODO: This does not reset when used the back btn or side menu to navigate back to StockTransfersPage
    /// tho cubit should be reset to initial but since navigation uses pushNamed, it does not reset
    /// might have to refactor side menu
    context.read<StockTransferRemoteCubit>().reset();
    context.read<StockTransferCubit>().reset();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onChangeTab(int index) {
    if (index == 0) {
      context.read<StockTransferListRemoteCubit>().getStockTransfers();
    }
    if (index == 1) {
      context.read<StockTransferListRemoteCubit>().getStockTransfers(status: StockOrderStatus.NEW);
    }
    if (index == 2) {
      context.read<StockTransferListRemoteCubit>().getStockTransfers(status: StockOrderStatus.SHIPPED);
    }
    if (index == 3) {
      context.read<StockTransferListRemoteCubit>().getStockTransfers(status: StockOrderStatus.COMPLETED);
    }
    if (index == 4) {
      context.read<StockTransferListRemoteCubit>().getStockTransfers(status: StockOrderStatus.CANCELLED);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Stock Transfers',
          subtitle: Strings.subtitlePlaceholder,
          actions: [
            UIButton.filled(
              'New Stock Transfer',
              icon: Assets.icons.add.setSize(12.0),
              onClick: () => AppRouter.router.goNamed(SideMenuTreeItem.NEW_STOCK_TRANSFER.name),
            ),
          ],
        ),
        TabBar(
          controller: _tabController,
          onTap: onChangeTab,
          tabs: [
            const Tab(text: 'All Transfers'),
            Tab(text: StockOrderStatus.NEW.label),
            Tab(text: StockOrderStatus.SHIPPED.label),
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
        BlocBuilder<StockTransferListRemoteCubit, StockTransferListRemoteState>(
          builder: (context, state) {
            if (state is StockTransferListError) {
              return Text(state.message);
            }
            if (state is StockTransferListLoaded) {
              return Expanded(
                child: StockTransferDataGrid(state.stockTransfers),
              );
            }
            return DataGridLoading(
              columns: DataGridUtil.getColumns(DataGridColumn.STOCK_TRANSFERS, showId: true),
              source: StockTransferDataSource([]),
            );
          },
        ),
      ],
    );
  }
}
