import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/features/stock_management/purchase_orders/presentation/pages/purchase_order_list/purchase_order_data_grid.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrdersPage extends StatefulWidget {
  const PurchaseOrdersPage({super.key});

  @override
  State<PurchaseOrdersPage> createState() => _PurchaseOrdersPageState();
}

class _PurchaseOrdersPageState extends State<PurchaseOrdersPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    // Get ALL purchase orders
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onChangeTab(int index) {
    if (index == 0) {
      // Get ALL purchase orders
    }
    if (index == 1) {
      // Get all NEW purchase orders
    }
    if (index == 2) {
      // Get all FOR RECEIVING purchase orders
    }
    if (index == 3) {
      // Get all COMPLETED purchase orders
    }
    if (index == 4) {
      // Get all CANCELLED purchase orders
    }
  }

  @override
  Widget build(BuildContext context) {
    final columns = DataGridUtil.getColumns(DataGridColumn.PURCHASE_ORDERS);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Purchase Orders',
          subtitle: Strings.subtitlePlaceholder,
          actions: [
            UIButton.filled(
              'New Purchase Order',
              icon: Assets.icons.add.setSize(12.0),
              onClick: () => AppRouter.router.goNamed(SideMenuTreeItem.NEW_PURCHASE_ORDER.name),
            ),
          ],
        ),
        TabBar(
          controller: _tabController,
          onTap: onChangeTab,
          tabs: [
            const Tab(text: 'All Orders'),
            Tab(text: StockActionStatus.NEW.label),
            Tab(text: StockActionStatus.FOR_RECEIVING.label),
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
          searchPlaceholder: 'Search purchase order ID',
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
        Expanded(child: PurchaseOrderDataGrid(purchaseOrderMock)),

        // PurchaseOrderDataGrid(),
        // BlocBuilder<PurchaseOrderListCubit, PurchaseOrderListState>(
        //   builder: (context, state) {
        //     if (state is PurchaseOrderListError) {
        //       return Text(state.message);
        //     }
        //     if (state is PurchaseOrderListLoaded) {
        // return const Expanded(
        //   child: PurchaseOrderDataGrid(),
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

final purchaseOrderMock = [
  PurchaseOrder(
    id: 1,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    totalAmount: 100,
    status: StockActionStatus.NEW,
    estimatedDateOfArrival: DateTime.now(),
    createdAt: DateTime.now(),
  ),
  PurchaseOrder(
    id: 2,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    totalAmount: 100,
    status: StockActionStatus.FOR_RECEIVING,
    estimatedDateOfArrival: DateTime.now(),
    createdAt: DateTime.now(),
  ),
  PurchaseOrder(
    id: 3,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    totalAmount: 100,
    status: StockActionStatus.COMPLETED,
    estimatedDateOfArrival: DateTime.now(),
    createdAt: DateTime.now(),
  ),
  PurchaseOrder(
    id: 4,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    totalAmount: 100,
    status: StockActionStatus.CANCELLED,
    estimatedDateOfArrival: DateTime.now(),
    createdAt: DateTime.now(),
  ),
  PurchaseOrder(
    id: 4,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    totalAmount: 100,
    status: StockActionStatus.SHIPPED,
    estimatedDateOfArrival: DateTime.now(),
    createdAt: DateTime.now(),
  ),
  PurchaseOrder(
    id: 4,
    branch: Branch(id: 1, name: 'Manila Branch'),
    supplier: Supplier(id: 1, name: 'UNILAB'),
    totalAmount: 100,
    status: StockActionStatus.IN_PROGRESS,
    estimatedDateOfArrival: DateTime.now(),
    createdAt: DateTime.now(),
  ),
];
