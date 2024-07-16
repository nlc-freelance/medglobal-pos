import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/pages/stock_transfer_list/stock_transfer_data_grid.dart';
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
    // Get ALL stock transfers
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onChangeTab(int index) {
    if (index == 0) {
      // Get ALL stock transfers
    }
    if (index == 1) {
      // Get all NEW stock transfers
    }
    if (index == 2) {
      // Get all SHIPPED stock transfers
    }
    if (index == 3) {
      // Get all COMPLETED stock transfers
    }
    if (index == 4) {
      // Get all CANCELLED stock transfers
    }
  }

  @override
  Widget build(BuildContext context) {
    final columns = DataGridUtil.getColumns(DataGridColumn.STOCK_TAKES);

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
            Tab(text: StockActionStatus.NEW.label),
            Tab(text: StockActionStatus.SHIPPED.label),
            Tab(text: StockActionStatus.COMPLETED.label),
            Tab(text: StockActionStatus.CANCELLED.label),
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
          searchPlaceholder: 'Search stock transfer ID',
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
        Expanded(child: StockTransferDataGrid(stockTransfersMock)),

        // StockTransferDataGrid(),
        // BlocBuilder<StockTransferListCubit, StockTransferListState>(
        //   builder: (context, state) {
        //     if (state is StockTransferListError) {
        //       return Text(state.message);
        //     }
        //     if (state is StockTransferListLoaded) {
        // return const Expanded(
        //   child: StockTransferDataGrid(),
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

final stockTransfersMock = [
  StockTransfer(
    id: 1,
    sourceBranch: Branch(id: 1, name: 'Manila Branch'),
    destinationBranch: Branch(id: 2, name: 'Pasig Branch'),
    status: StockActionStatus.NEW,
    createdAt: DateTime.now(),
    completedAt: DateTime.now(),
  ),
  StockTransfer(
    id: 2,
    sourceBranch: Branch(id: 1, name: 'Manila Branch'),
    destinationBranch: Branch(id: 2, name: 'Pasig Branch'),
    status: StockActionStatus.FOR_RECEIVING,
    createdAt: DateTime.now(),
    completedAt: DateTime.now(),
  ),
  StockTransfer(
    id: 3,
    sourceBranch: Branch(id: 1, name: 'Manila Branch'),
    destinationBranch: Branch(id: 2, name: 'Pasig Branch'),
    status: StockActionStatus.COMPLETED,
    createdAt: DateTime.now(),
    completedAt: DateTime.now(),
  ),
  StockTransfer(
    id: 4,
    sourceBranch: Branch(id: 1, name: 'Manila Branch'),
    destinationBranch: Branch(id: 2, name: 'Pasig Branch'),
    status: StockActionStatus.CANCELLED,
    createdAt: DateTime.now(),
    completedAt: DateTime.now(),
  ),
  StockTransfer(
    id: 4,
    sourceBranch: Branch(id: 1, name: 'Manila Branch'),
    destinationBranch: Branch(id: 2, name: 'Pasig Branch'),
    status: StockActionStatus.SHIPPED,
    createdAt: DateTime.now(),
    completedAt: DateTime.now(),
  ),
  StockTransfer(
    id: 4,
    sourceBranch: Branch(id: 1, name: 'Manila Branch'),
    destinationBranch: Branch(id: 2, name: 'Pasig Branch'),
    status: StockActionStatus.IN_PROGRESS,
    createdAt: DateTime.now(),
    completedAt: DateTime.now(),
  ),
];
