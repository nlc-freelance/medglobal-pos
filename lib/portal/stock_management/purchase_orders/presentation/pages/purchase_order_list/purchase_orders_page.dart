import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/reports_enum.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_filter/purchase_order_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_remote/purchase_order_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_list/purchase_order_paginated_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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

    /// TODO: The list does not update when using the back button or side menu to navigate back to this page
    /// Side menu which uses goNamed does not trigger initState if the path is in the same shell branch
    /// Ex. /stock-management/purchase-orders/id=1 to /stock-management/purchase-orders/
    // context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders();

    /// Reset last selected purchase order
    // context.read<PurchaseOrderCubit>().reset();
    // context.read<PurchaseOrderListFilterCubit>().reset();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onChangeTab(int index) {
    final branchId = context.read<PurchaseOrderListFilterCubit>().state.branchId;
    final size = context.read<PurchaseOrderListFilterCubit>().state.size!;
    final startDate = context.read<PurchaseOrderListFilterCubit>().state.startDate;
    final endDate = context.read<PurchaseOrderListFilterCubit>().state.endDate;

    if (index == 0) {
      context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
            branchId: branchId,
            size: size,
            startDate: startDate,
            endDate: endDate,
          );
      context.read<PurchaseOrderListFilterCubit>().setStatus(null);
    }
    if (index == 1) {
      context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
            status: StockOrderStatus.NEW,
            branchId: branchId,
            size: size,
            startDate: startDate,
            endDate: endDate,
          );
      context.read<PurchaseOrderListFilterCubit>().setStatus(StockOrderStatus.NEW);
    }
    if (index == 2) {
      context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
            status: StockOrderStatus.FOR_RECEIVING,
            branchId: branchId,
            size: size,
            startDate: startDate,
            endDate: endDate,
          );
      context.read<PurchaseOrderListFilterCubit>().setStatus(StockOrderStatus.FOR_RECEIVING);
    }
    if (index == 3) {
      context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
            status: StockOrderStatus.COMPLETED,
            branchId: branchId,
            size: size,
            startDate: startDate,
            endDate: endDate,
          );
      context.read<PurchaseOrderListFilterCubit>().setStatus(StockOrderStatus.COMPLETED);
    }
    if (index == 4) {
      context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
            status: StockOrderStatus.CANCELLED,
            branchId: branchId,
            size: size,
            startDate: startDate,
            endDate: endDate,
          );
      context.read<PurchaseOrderListFilterCubit>().setStatus(StockOrderStatus.CANCELLED);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Purchase Orders',
          subtitle: 'View all purchase order operations to keep track of all items added to your inventory.',
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
            'All Orders',
            StockOrderStatus.NEW.label,
            StockOrderStatus.FOR_RECEIVING.label,
            StockOrderStatus.COMPLETED.label,
            StockOrderStatus.CANCELLED.label,
          ]
              .map((status) => Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.only(right: 16),
                    child: Tab(text: status),
                  ))
              .toList(),
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelPadding: const EdgeInsets.only(left: 0, right: 0),
          dividerColor: UIColors.borderMuted,
          dividerHeight: 0.8,
          labelColor: UIColors.primary,
          labelStyle: UIStyleText.labelSemiBold,
          unselectedLabelColor: UIColors.textMuted,
          unselectedLabelStyle: UIStyleText.labelMedium.copyWith(color: UIColors.textLight),
          indicatorPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 2.3,
              color: UIColors.primary,
            ),
            insets: EdgeInsets.only(left: 0, right: 26, bottom: 0),
          ),
          overlayColor: WidgetStateColor.resolveWith((state) {
            if (state.contains(WidgetState.pressed)) return UIColors.transparent;
            if (state.contains(WidgetState.hovered)) return UIColors.transparent;
            return UIColors.transparent;
          }),
        ),
        const UIVerticalSpace(20),
        BlocSelector<PurchaseOrderListFilterCubit, PurchaseOrderListFilterState, PurchaseOrderListFilterState>(
          selector: (state) => state,
          builder: (context, filters) {
            return DataGridToolbar(
              reportType: ReportType.purchaseOrder,
              reportFilters: {
                'status': filters.status?.label.toLowerCase(),
                'branch': filters.branchId,
                'startDate': filters.startDate,
                'endDate': filters.endDate,
              },
              filters: [
                DatePickerPopup(
                  onRemoveSelected: () {
                    final size = context.read<PurchaseOrderListFilterCubit>().state.size;
                    final status = context.read<PurchaseOrderListFilterCubit>().state.status;
                    final branchId = context.read<PurchaseOrderListFilterCubit>().state.branchId;

                    context
                        .read<PurchaseOrderListRemoteCubit>()
                        .getPurchaseOrders(size: size!, status: status, branchId: branchId);

                    context.read<PurchaseOrderListFilterCubit>().setStartDate(null);
                    context.read<PurchaseOrderListFilterCubit>().setEndDate(null);
                  },
                  onSelectRange: (dates) {
                    final size = context.read<PurchaseOrderListFilterCubit>().state.size;
                    final status = context.read<PurchaseOrderListFilterCubit>().state.status;
                    final branch = context.read<PurchaseOrderListFilterCubit>().state.branchId;

                    String? endDate;
                    final startDate = DateFormat('MM-dd-yyyy').format(dates[0]!);
                    if (dates.length == 2) endDate = DateFormat('MM-dd-yyyy').format(dates[1]!);

                    context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
                        size: size!, status: status, branchId: branch, startDate: startDate, endDate: endDate);

                    context.read<PurchaseOrderListFilterCubit>().setStartDate(startDate);
                    context.read<PurchaseOrderListFilterCubit>().setEndDate(endDate);
                  },
                  selectionMode: DateRangePickerSelectionMode.range,
                ),
                const UIHorizontalSpace(8),
                BranchDropdown.select(
                  onRemoveSelectedItem: () {
                    final size = context.read<PurchaseOrderListFilterCubit>().state.size;
                    final status = context.read<PurchaseOrderListFilterCubit>().state.status;
                    final startDate = context.read<PurchaseOrderListFilterCubit>().state.startDate;
                    final endDate = context.read<PurchaseOrderListFilterCubit>().state.endDate;

                    context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
                          size: size!,
                          status: status,
                          startDate: startDate,
                          endDate: endDate,
                        );
                    context.read<PurchaseOrderListFilterCubit>().setBranch(null);
                  },
                  onSelectItem: (branch) {
                    final size = context.read<PurchaseOrderListFilterCubit>().state.size;
                    final status = context.read<PurchaseOrderListFilterCubit>().state.status;
                    final startDate = context.read<PurchaseOrderListFilterCubit>().state.startDate;
                    final endDate = context.read<PurchaseOrderListFilterCubit>().state.endDate;

                    context.read<PurchaseOrderListRemoteCubit>().getPurchaseOrders(
                          size: size!,
                          status: status,
                          branchId: branch.id,
                          startDate: startDate,
                          endDate: endDate,
                        );
                    context.read<PurchaseOrderListFilterCubit>().setBranch(branch.id);
                  },
                ),
              ],
            );
          },
        ),
        const Expanded(child: PurchaseOrderPaginatedDataGrid()),
      ],
    );
  }
}
