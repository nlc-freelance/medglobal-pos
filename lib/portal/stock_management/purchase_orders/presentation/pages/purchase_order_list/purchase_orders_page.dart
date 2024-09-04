import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/filter_popup.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_remote/purchase_order_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_remote/purchase_order_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_list/purchase_order_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrdersPage extends StatefulWidget {
  static String route = SideMenuTreeItem.PURCHASE_ORDERS.route;

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
    context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders();

    /// TODO: This does not reset when used the back btn or side menu to navigate back to StockTransfersPage
    /// tho cubit should be reset to initial but since navigation uses pushNamed, it does not reset
    /// might have to refactor side menu
    context.read<PurchaseOrderRemoteCubit>().reset();
    context.read<PurchaseOrderCubit>().reset();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onChangeTab(int index) {
    if (index == 0) {
      context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders();
    }
    if (index == 1) {
      context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(status: StockOrderStatus.NEW);
    }
    if (index == 2) {
      context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(status: StockOrderStatus.FOR_RECEIVING);
    }
    if (index == 3) {
      context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(status: StockOrderStatus.COMPLETED);
    }
    if (index == 4) {
      context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(status: StockOrderStatus.CANCELLED);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            Tab(text: StockOrderStatus.NEW.label),
            Tab(text: StockOrderStatus.FOR_RECEIVING.label),
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
        BlocBuilder<PurchaseOrderListRemoteCubit, PurchaseOrderListRemoteState>(
          builder: (context, state) {
            if (state is PurchaseOrderListError) {
              return Text(state.message);
            }
            if (state is PurchaseOrderListLoaded) {
              return Expanded(
                child: PurchaseOrderDataGrid(state.purchaseOrders),
              );
            }
            return DataGridLoading(
              columns: DataGridUtil.getColumns(DataGridColumn.PURCHASE_ORDERS, showId: true),
              source: PurchaseOrderDataSource([]),
            );
          },
        ),
      ],
    );
  }
}
