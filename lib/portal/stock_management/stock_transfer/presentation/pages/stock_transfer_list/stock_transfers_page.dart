import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer/stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_list_filter/stock_transfer_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/stock_transfer_list_remote/stock_transfer_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/pages/stock_transfer_list/stock_transfer_paginated_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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

    /// TODO: The list does not update when using the back button or side menu to navigate back to this page
    /// Side menu which uses goNamed does not trigger initState if the path is in the same shell branch
    // context.read<StockTransferListRemoteCubit>().getStockTransfers();

    /// Reset last selected stock transfer
    context.read<StockTransferCubit>().reset();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onChangeTab(int index) {
    final sourceBranchId = context.read<StockTransferListFilterCubit>().state.sourceBranch?.id;
    final destinationBranchId = context.read<StockTransferListFilterCubit>().state.destinationBranch?.id;
    final size = context.read<StockTransferListFilterCubit>().state.size!;

    if (index == 0) {
      context.read<StockTransferListRemoteCubit>().getStockTransfers(
            sourceBranchId: sourceBranchId,
            destinationBranchId: destinationBranchId,
            size: size,
          );
      context.read<StockTransferListFilterCubit>().setStatus(null);
    }
    if (index == 1) {
      context.read<StockTransferListRemoteCubit>().getStockTransfers(
            status: StockOrderStatus.NEW,
            sourceBranchId: sourceBranchId,
            destinationBranchId: destinationBranchId,
            size: size,
          );
      context.read<StockTransferListFilterCubit>().setStatus(StockOrderStatus.NEW);
    }
    if (index == 2) {
      context.read<StockTransferListRemoteCubit>().getStockTransfers(
            status: StockOrderStatus.SHIPPED,
            sourceBranchId: sourceBranchId,
            destinationBranchId: destinationBranchId,
            size: size,
          );
      context.read<StockTransferListFilterCubit>().setStatus(StockOrderStatus.SHIPPED);
    }
    if (index == 3) {
      context.read<StockTransferListRemoteCubit>().getStockTransfers(
            status: StockOrderStatus.COMPLETED,
            sourceBranchId: sourceBranchId,
            destinationBranchId: destinationBranchId,
            size: size,
          );
      context.read<StockTransferListFilterCubit>().setStatus(StockOrderStatus.COMPLETED);
    }
    if (index == 4) {
      context.read<StockTransferListRemoteCubit>().getStockTransfers(
            status: StockOrderStatus.CANCELLED,
            sourceBranchId: sourceBranchId,
            destinationBranchId: destinationBranchId,
            size: size,
          );
      context.read<StockTransferListFilterCubit>().setStatus(StockOrderStatus.CANCELLED);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Stock Transfers',
          subtitle: 'View all stock transfer operations to keep track of stock movements in your inventory.',
          actions: [
            const UIHorizontalSpace(8),
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
            'All Transfers',
            StockOrderStatus.NEW.label,
            StockOrderStatus.SHIPPED.label,
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
        const UIVerticalSpace(24),
        DataGridToolbar(
          isDownloadable: true,
          filters: [
            DatePickerPopup(
              onSelectRange: (dates) {},
              selectionMode: DateRangePickerSelectionMode.range,
            ),
            const UIHorizontalSpace(16),
            BranchDropdown.select(
              hint: 'Source',
              isInlineHint: true,
              onRemoveSelectedItem: () {
                final size = context.read<StockTransferListFilterCubit>().state.size;
                final status = context.read<StockTransferListFilterCubit>().state.status;
                final destinationBranchId = context.read<StockTransferListFilterCubit>().state.destinationBranch?.id;

                context.read<StockTransferListRemoteCubit>().getStockTransfers(
                      size: size!,
                      status: status,
                      sourceBranchId: null,
                      destinationBranchId: destinationBranchId,
                    );
                context.read<StockTransferListFilterCubit>().setSourceBranch(null);
              },
              onSelectItem: (branch) {
                final size = context.read<StockTransferListFilterCubit>().state.size;
                final status = context.read<StockTransferListFilterCubit>().state.status;
                final destinationBranchId = context.read<StockTransferListFilterCubit>().state.destinationBranch?.id;
                {
                  context.read<StockTransferListRemoteCubit>().getStockTransfers(
                        size: size!,
                        status: status,
                        sourceBranchId: branch.id,
                        destinationBranchId: destinationBranchId,
                      );
                  context.read<StockTransferListFilterCubit>().setSourceBranch(branch);
                }
              },
            ),
            const UIHorizontalSpace(16),
            BranchDropdown.select(
              hint: 'Destination',
              isInlineHint: true,
              onRemoveSelectedItem: () {
                final size = context.read<StockTransferListFilterCubit>().state.size;
                final status = context.read<StockTransferListFilterCubit>().state.status;
                final sourceBranchId = context.read<StockTransferListFilterCubit>().state.sourceBranch?.id;

                context.read<StockTransferListRemoteCubit>().getStockTransfers(
                      size: size!,
                      status: status,
                      sourceBranchId: sourceBranchId,
                      destinationBranchId: null,
                    );
                context.read<StockTransferListFilterCubit>().setDestinationBranch(null);
              },
              onSelectItem: (branch) {
                final size = context.read<StockTransferListFilterCubit>().state.size;
                final status = context.read<StockTransferListFilterCubit>().state.status;
                final sourceBranchId = context.read<StockTransferListFilterCubit>().state.sourceBranch?.id;

                context.read<StockTransferListRemoteCubit>().getStockTransfers(
                      size: size!,
                      status: status,
                      sourceBranchId: sourceBranchId,
                      destinationBranchId: branch.id,
                    );
                context.read<StockTransferListFilterCubit>().setDestinationBranch(branch);
              },
            ),
          ],
        ),
        const Expanded(child: StockTransferPaginatedDataGrid()),
      ],
    );
  }
}
