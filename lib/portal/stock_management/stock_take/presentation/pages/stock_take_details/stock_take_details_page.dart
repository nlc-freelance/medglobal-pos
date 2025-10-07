import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/bloc/stock_take_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take/stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/counted_items_list/counted_items_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/uncounted_items_list/uncounted_items_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_list_remote/stock_take_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/pages/stock_take_details/widgets/completed_stock_take_data_grid.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/pages/stock_take_details/widgets/counted_items_data_grid.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/pages/stock_take_details/widgets/stock_take_mark_as_completed_dialog.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/pages/stock_take_details/widgets/uncounted_items_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockTakeDetailsPage extends StatefulWidget {
  const StockTakeDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<StockTakeDetailsPage> createState() => _StockTakeDetailsPageState();
}

class _StockTakeDetailsPageState extends State<StockTakeDetailsPage> with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  int? _uncountedTotal;
  int? _countedTotal;

  late TabController _tabController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    context.read<StockTakeBloc>().add(GetStockTakeByIdEvent(int.parse(widget.id)));
    _descriptionController = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockTakeBloc, StockTakeBlocRemoteState>(
      listener: (context, state) {
        if (state is StockTakeByIdSuccess) {
          context.read<StockTakeCubit>().setStockTake(state.stockTake);

          /// If status is NEW, the stock take items are still being generated in the backend
          /// Therefore we need to do polling, which fetches the stock take until it changes to a status IN PROGRESS
          if (state.stockTake.status == StockOrderStatus.NEW) {
            context.read<StockTakeBloc>().add(
                  StartStockTakePollingEvent(
                    int.parse(widget.id),
                    targetStatus: StockOrderStatus.IN_PROGRESS,
                  ),
                );
          } else {
            if (state.stockTake.status == StockOrderStatus.IN_PROGRESS) {
              context.read<UncountedItemsListCubit>().getItems(id: state.stockTake.id!);
            }
            context.read<CountedItemsListCubit>().getItems(id: state.stockTake.id!);
          }
          _descriptionController.text = state.stockTake.description ?? '';
        }
        if (state is StockTakeSuccess) {
          context.read<StockTakeCubit>().setStockTake(state.stockTake);
          SnackbarUtil.success(context, 'Stock Take updated successfully.');

          // Reload list
          context.read<StockTakeListRemoteCubit>().getStockTakes();
        }
        if (state is StockTakeMarkAsCompletedSuccess) {
          context.read<StockTakeCubit>().setStockTake(state.stockTake);

          // Reload list
          context.read<StockTakeListRemoteCubit>().getStockTakes();
        }
        if (state is StockTakeError) {
          SnackbarUtil.error(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is StockTakeByIdError) {
          return Text(state.message);
        }
        if (state is StockTakeByIdLoading) {
          return const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2));
        }
        return BlocSelector<StockTakeCubit, StockTakeState, StockTake>(
          selector: (state) => state.stockTake,
          builder: (context, stockTake) {
            return stockTake == const StockTake()
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PageHeader(
                        title:
                            stockTake.status == StockOrderStatus.IN_PROGRESS ? 'Edit Stock Take' : 'Stock Take Details',
                        titleTrailings: [
                          if (state is StockTakePolling)
                            Container(
                              margin: const EdgeInsets.only(left: 12, right: 12, top: 4),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 12,
                                    height: 12,
                                    child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
                                  ),
                                  const UIHorizontalSpace(16),
                                  Text(
                                    '${state.status == StockOrderStatus.IN_PROGRESS ? 'Generating' : 'Completing'} stock take, please wait a moment..',
                                    style: UIStyleText.labelMedium.copyWith(color: UIColors.textGray),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      const UIVerticalSpace(20),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const PageSectionTitle(title: 'General Information'),
                              GridView(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 16,
                                  mainAxisExtent: 60,
                                ),
                                shrinkWrap: true,
                                children: [
                                  LabelValue.text(
                                    label: 'Stock Take ID',
                                    value: stockTake.id.toString(),
                                  ),
                                  LabelValue.text(
                                    label: 'Start Time',
                                    value: stockTake.createdAt != null
                                        ? DateFormat('MM/dd/yyyy HH:mm').format(stockTake.createdAt!)
                                        : Strings.empty,
                                  ),
                                  if (stockTake.status == StockOrderStatus.COMPLETED)
                                    LabelValue.text(
                                      label: 'Completed Time',
                                      value: stockTake.updatedAt != null
                                          ? DateFormat('MM/dd/yyyy HH:mm').format(stockTake.updatedAt!)
                                          : Strings.empty,
                                    ),
                                  LabelValue.text(
                                    label: 'Target Branch',
                                    value: stockTake.branch?.name,
                                  ),
                                  LabelValue.text(
                                    label: 'Target Supplier',
                                    value: stockTake.isAllSupplier == true ? 'All Suppliers' : stockTake.supplier?.name,
                                  ),
                                  LabelValue.status(
                                    label: 'Status',
                                    status: stockTake.status!,
                                  ),
                                  if (stockTake.status == StockOrderStatus.COMPLETED) ...[
                                    LabelValue.text(
                                      label: 'Total Quantity Difference',
                                      value: stockTake.totalQtyDifference?.toDouble().toString() ?? Strings.empty,
                                    ),
                                    LabelValue.chip(
                                      label: 'Total Cost Difference',
                                      chip: stockTake.totalCostDifference ?? 0,
                                    ),
                                  ],
                                ],
                              ),
                              const UIVerticalSpace(30),
                              if (stockTake.status == StockOrderStatus.IN_PROGRESS ||
                                  stockTake.status == StockOrderStatus.NEW) ...[
                                UIText.heading5('Items'),
                                const Divider(color: UIColors.borderMuted),
                                MultiBlocListener(
                                  listeners: [
                                    BlocListener<UncountedItemsListCubit, UncountedItemsListState>(
                                      listener: (context, state) {
                                        if (state is UncountedItemsListLoaded) {
                                          /// No need to update the count displayed in the Tab when data displayed is from a search result
                                          if (state.search == null) {
                                            setState(() => _uncountedTotal = state.data.totalCount);
                                          }
                                        }
                                      },
                                    ),
                                    BlocListener<CountedItemsListCubit, CountedItemsListState>(
                                      listener: (context, state) {
                                        if (state is CountedItemsListLoaded) {
                                          /// No need to update the count displayed in the Tab when data displayed is from a search result
                                          if (state.search == null) {
                                            setState(() => _countedTotal = state.data.totalCount);
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                  child: TabBar(
                                    controller: _tabController,
                                    onTap: (index) => setState(() => _tabIndex = index),
                                    tabs: [
                                      'Uncounted  ${_uncountedTotal != null ? '(${_uncountedTotal!})' : Strings.empty}',
                                      'Counted  ${_countedTotal != null ? '(${_countedTotal!})' : Strings.empty}',
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
                                      insets: EdgeInsets.only(left: 0, right: 30, bottom: 0),
                                    ),
                                    overlayColor: WidgetStateColor.resolveWith(
                                      (state) {
                                        if (state.contains(WidgetState.pressed)) return UIColors.transparent;
                                        if (state.contains(WidgetState.hovered)) return UIColors.transparent;
                                        return UIColors.transparent;
                                      },
                                    ),
                                  ),
                                ),
                                IndexedStack(
                                  index: _tabIndex,
                                  children: [
                                    LayoutBuilder(
                                      builder: (context, constraints) => Container(
                                        constraints: BoxConstraints(minHeight: constraints.minHeight, maxHeight: 400),
                                        child: const UncountedItemsDataGrid(),
                                      ),
                                    ),
                                    LayoutBuilder(
                                      builder: (context, constraints) => Container(
                                        constraints: BoxConstraints(minHeight: constraints.minHeight, maxHeight: 400),
                                        child: const CountedItemsDataGrid(),
                                      ),
                                    ),
                                  ],
                                ),
                              ] else
                                LayoutBuilder(
                                  builder: (context, constraints) => Container(
                                    constraints: BoxConstraints(minHeight: constraints.minHeight, maxHeight: 400),
                                    child: const CompletedStockTakeDataGrid(),
                                  ),
                                ),
                              const UIVerticalSpace(30),
                              const PageSectionTitle(title: 'Description'),
                              stockTake.status == StockOrderStatus.COMPLETED ||
                                      stockTake.status == StockOrderStatus.CANCELLED
                                  ? UIText.bodyRegular(stockTake.description ?? Strings.empty)
                                  : UITextField.noLabel(
                                      hint: 'Enter description here',
                                      controller: _descriptionController,
                                      onChanged: (value) => context.read<StockTakeCubit>().setDescription(value),
                                    ),
                              const UIVerticalSpace(48),
                            ],
                          ),
                        ),
                      ),
                      const UIVerticalSpace(40),
                      if (state is StockTakeError) ...[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Assets.icons.infoCircle.svg(),
                            const UIHorizontalSpace(8),
                            UIText.labelSemiBold('Something went wrong. ${state.message}',
                                color: UIColors.buttonDanger),
                          ],
                        ),
                        const UIVerticalSpace(20),
                      ],
                      // if (stockTake.status == StockOrderStatus.IN_PROGRESS)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          UIButton.filled(
                            'Cancel Stock Take',
                            style: UIStyleButton.danger,
                            isLoading: state is StockTakeCancelLoading,
                            onClick: () => context.read<StockTakeBloc>().add(
                                  UpdateStockTakeEvent(
                                    StockOrderUpdate.CANCEL,
                                    id: stockTake.id!,
                                    stockTake: stockTake,
                                  ),
                                ),
                          ),
                          const Spacer(),
                          UIButton.filled(
                            'Save',
                            isLoading: state is StockTakeSaveLoading,
                            onClick: () => context.read<StockTakeBloc>().add(
                                  UpdateStockTakeEvent(
                                    StockOrderUpdate.SAVE,
                                    id: stockTake.id!,
                                    stockTake: stockTake,
                                  ),
                                ),
                          ),
                          const UIHorizontalSpace(8),
                          UIButton.filled(
                            'Mark as Completed',
                            onClick: () => showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => StockTakeMarkAsCompletedDialog(stockTake),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
          },
        );
      },
    );
  }
}
