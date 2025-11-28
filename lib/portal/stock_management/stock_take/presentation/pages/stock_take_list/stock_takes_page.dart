import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/bloc/stock_take_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/new_stock_take/new_stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/pages/stock_take_list/stock_take_paginated_data_grid.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/pages/stock_take_list/widgets/new_stock_take_dialog.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/pages/stock_take_list/widgets/stock_take_toolbar.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class StockTakeListPage extends StatefulWidget {
  const StockTakeListPage({super.key});

  @override
  State<StockTakeListPage> createState() => _StockTakesPageState();
}

class _StockTakesPageState extends State<StockTakeListPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    /// TODO: The list does not update when using the back button or side menu to navigate back to this page
    /// Side menu which uses goNamed does not trigger initState if the path is in the same shell branch
    // context.read<StockTakeListRemoteCubit>().getStockTakes();

    context.read<StockTakeListFilterCubit>().reset();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onChangeTab(int index) {
    final size = context.read<StockTakeListFilterCubit>().state.size!;
    final startDate = context.read<StockTakeListFilterCubit>().state.startDate;
    final endDate = context.read<StockTakeListFilterCubit>().state.endDate;

    if (index == 0) {
      context.read<StockTakeListRemoteCubit>().getStockTakes(
            size: size,
            startDate: startDate,
            endDate: endDate,
          );
      context.read<StockTakeListFilterCubit>().setStatus(null);
    }
    if (index == 1) {
      context.read<StockTakeListRemoteCubit>().getStockTakes(
            status: StockOrderStatus.IN_PROGRESS,
            size: size,
            startDate: startDate,
            endDate: endDate,
          );
      context.read<StockTakeListFilterCubit>().setStatus(StockOrderStatus.IN_PROGRESS);
    }
    if (index == 2) {
      context.read<StockTakeListRemoteCubit>().getStockTakes(
            status: StockOrderStatus.COMPLETED,
            size: size,
            startDate: startDate,
            endDate: endDate,
          );
      context.read<StockTakeListFilterCubit>().setStatus(StockOrderStatus.COMPLETED);
    }
    if (index == 3) {
      context.read<StockTakeListRemoteCubit>().getStockTakes(
            status: StockOrderStatus.CANCELLED,
            size: size,
            startDate: startDate,
            endDate: endDate,
          );
      context.read<StockTakeListFilterCubit>().setStatus(StockOrderStatus.CANCELLED);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          title: 'Stock Takes',
          subtitle: 'View all stock take operations to keep track of QoH audits in your inventory.',
          actions: [
            UIButton.filled(
              'New Stock Take',
              icon: Assets.icons.add.setSize(12.0),
              onClick: () => showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: context.read<NewStockTakeCubit>()),
                    BlocProvider.value(value: context.read<StockTakeBloc>()),
                  ],
                  child: const NewStockTakeDialog(),
                ),
              ),
            ),
          ],
        ),
        TabBar(
          controller: _tabController,
          onTap: onChangeTab,
          tabs: [
            'All Takes',
            StockOrderStatus.IN_PROGRESS.label,
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
        const StockTakeToolbar(),
        const UIVerticalSpace(20),
        const Expanded(child: StockTakePaginatedDataGrid()),
      ],
    );
  }
}
