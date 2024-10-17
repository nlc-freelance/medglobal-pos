import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return/stock_return_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_list_filter/stock_return_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return_list_remote/stock_return_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_list/stock_return_paginated_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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

    /// TODO: The list does not update when using the back button or side menu to navigate back to this page
    /// Side menu which uses goNamed does not trigger initState if the path is in the same shell branch
    context.read<StockReturnListRemoteCubit>().getStockReturns();

    /// Reset last selected stock return
    context.read<StockReturnCubit>().reset();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onChangeTab(int index) {
    final branchId = context.read<StockReturnListFilterCubit>().state.branchId;
    final size = context.read<StockReturnListFilterCubit>().state.size!;

    if (index == 0) {
      context.read<StockReturnListRemoteCubit>().getStockReturns(branchId: branchId, size: size);
      context.read<StockReturnListFilterCubit>().setStatus(null);
    }
    if (index == 1) {
      context.read<StockReturnListRemoteCubit>().getStockReturns(
            status: StockOrderStatus.NEW,
            branchId: branchId,
            size: size,
          );
      context.read<StockReturnListFilterCubit>().setStatus(StockOrderStatus.NEW);
    }
    if (index == 2) {
      context.read<StockReturnListRemoteCubit>().getStockReturns(
            status: StockOrderStatus.COMPLETED,
            branchId: branchId,
            size: size,
          );
      context.read<StockReturnListFilterCubit>().setStatus(StockOrderStatus.COMPLETED);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Stock Returns',
          subtitle: 'View all stock return operations to keep track of returned stocks in your inventory.',
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
            'All Returns',
            StockOrderStatus.NEW.label,
            StockOrderStatus.COMPLETED.label,
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
        DataGridToolbar(
          isDownloadable: true,
          filters: [
            DatePickerPopup(
              onSelectRange: (dates) {},
              selectionMode: DateRangePickerSelectionMode.range,
            ),
            const UIHorizontalSpace(8),
            BranchDropdown.select(
              onRemoveSelectedItem: () {
                final size = context.read<StockReturnListFilterCubit>().state.size;
                final status = context.read<StockReturnListFilterCubit>().state.status;

                context.read<StockReturnListRemoteCubit>().getStockReturns(size: size!, status: status);
                context.read<StockReturnListFilterCubit>().setBranch(null);
              },
              onSelectItem: (branch) {
                final size = context.read<StockReturnListFilterCubit>().state.size;
                final status = context.read<StockReturnListFilterCubit>().state.status;

                context.read<StockReturnListRemoteCubit>().getStockReturns(
                      size: size!,
                      status: status,
                      branchId: branch.id,
                    );
                context.read<StockReturnListFilterCubit>().setBranch(branch.id);
              },
            ),
          ],
        ),
        const Expanded(child: StockReturnPaginatedDataGrid()),
      ],
    );
  }
}
