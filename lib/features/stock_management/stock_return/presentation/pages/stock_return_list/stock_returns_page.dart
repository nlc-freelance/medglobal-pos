import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/data_grid_util.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/pages/purchase_order_list/purchase_order_data_grid.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/presentation/pages/stock_return_list/stock_return_data_grid.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
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
    // Get ALL stock returns
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onChangeTab(int index) {
    if (index == 0) {
      // Get ALL stock returns
    }
    if (index == 1) {
      // Get all NEW stock returns
    }
    if (index == 2) {
      // Get all COMPLETED stock returns
    }
  }

  @override
  Widget build(BuildContext context) {
    final columns = DataGridUtil.getColumns(DataGridColumn.PURCHASE_ORDERS);

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
            Tab(text: StockActionStatus.NEW.label),
            Tab(text: StockActionStatus.COMPLETED.label),
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
        Expanded(child: StockReturnDataGrid(stockReturnMock)),

        // StockReturnDataGrid(),
        // BlocBuilder<StockReturnListCubit, StockReturnListState>(
        //   builder: (context, state) {
        //     if (state is StockReturnListError) {
        //       return Text(state.message);
        //     }
        //     if (state is StockReturnListLoaded) {
        // return const Expanded(
        //   child: StockReturnDataGrid(),
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

final stockReturnMock = [
  StockReturn(
    id: 1,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    totalAmount: 100,
    status: StockActionStatus.NEW,
    createdAt: DateTime.now(),
  ),
  StockReturn(
    id: 2,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    totalAmount: 100,
    status: StockActionStatus.FOR_RECEIVING,
    createdAt: DateTime.now(),
  ),
  StockReturn(
    id: 3,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    totalAmount: 100,
    status: StockActionStatus.COMPLETED,
    createdAt: DateTime.now(),
  ),
  StockReturn(
    id: 4,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    totalAmount: 100,
    status: StockActionStatus.CANCELLED,
    createdAt: DateTime.now(),
  ),
  StockReturn(
    id: 4,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    totalAmount: 100,
    status: StockActionStatus.SHIPPED,
    createdAt: DateTime.now(),
  ),
  StockReturn(
    id: 4,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    totalAmount: 100,
    status: StockActionStatus.IN_PROGRESS,
    createdAt: DateTime.now(),
  ),
];
