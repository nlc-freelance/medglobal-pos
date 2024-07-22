import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take_item.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/cubit/stock_take/stock_take_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/cubit/stock_take_remote/stock_take_remote_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/pages/stock_take_details/widgets/completed_stock_take_data_grid.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/pages/stock_take_details/widgets/counted_items_data_grid.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/pages/stock_take_details/widgets/uncounted_items_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockTakeDetailsPage extends StatefulWidget {
  const StockTakeDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<StockTakeDetailsPage> createState() => _StockTakeDetailsPageState();
}

class _StockTakeDetailsPageState extends State<StockTakeDetailsPage> {
  late StockTake _stockTake;
  late TextEditingController _descriptionController;
  List<StockTakeItem>? _items;

  @override
  void initState() {
    super.initState();
    context.read<StockTakeRemoteCubit>().getStockTakeById(int.parse(widget.id));
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockTakeRemoteCubit, StockTakeRemoteState>(
      listener: (context, state) {
        if (state is StockTakeByIdSuccess) {
          _stockTake = state.stockTake;
          context.read<StockTakeCubit>().setStockTake(state.stockTake);
          _descriptionController = TextEditingController(text: _stockTake.description)
            ..addListener(() => context.read<StockTakeCubit>().setDescription(_descriptionController.text));
        }
        if (state is StockTakeSuccess) {
          AppRouter.router.pushReplacementNamed(SideMenuTreeItem.STOCK_TAKES.name);
          ToastNotification.success(context, state.message);
        }
        if (state is StockTakeError) {
          ToastNotification.error(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is StockTakeByIdError) {
          return Text(state.message);
        }
        if (state is StockTakeByIdLoading) {
          return const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: _stockTake.status == StockOrderStatus.IN_PROGRESS ? 'Edit Stock Take' : 'Stock Take Details',
              subtitle: Strings.subtitlePlaceholder,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
                          label: 'Start Time',
                          value: _stockTake.createdAt != null
                              ? DateFormat('MM/dd/yyyy HH:mm').format(_stockTake.createdAt!.toLocal())
                              : Strings.empty,
                        ),
                        if (_stockTake.status == StockOrderStatus.COMPLETED)
                          LabelValue.text(
                            label: 'Completed Time',
                            value: _stockTake.updatedAt != null
                                ? DateFormat('MM/dd/yyyy HH:mm').format(_stockTake.updatedAt!.toLocal())
                                : Strings.empty,
                          ),
                        LabelValue.text(
                          label: 'Target Branch',
                          value: _stockTake.branch?.name,
                        ),
                        LabelValue.text(
                          label: 'Target Supplier',
                          value: _stockTake.isAllSupplier == true ? 'All Suppliers' : _stockTake.supplier?.name,
                        ),
                        LabelValue.status(
                          label: 'Status',
                          status: _stockTake.status!,
                        ),
                        if (_stockTake.status == StockOrderStatus.COMPLETED) ...[
                          LabelValue.chip(
                            label: 'Total Quantity Difference',
                            chip: _stockTake.totalQtyDifference?.toDouble() ?? 0,
                          ),
                          LabelValue.chip(
                            label: 'Total Cost Difference',
                            chip: _stockTake.totalCostDifference ?? 0,
                          ),
                        ],
                      ],
                    ),
                    const UIVerticalSpace(30),
                    const PageSectionTitle(title: 'Description'),
                    _stockTake.status == StockOrderStatus.COMPLETED || _stockTake.status == StockOrderStatus.CANCELLED
                        ? UIText.bodyRegular(_stockTake.description ?? Strings.empty)
                        : UITextField.noLabel(
                            hint: 'Enter description here',
                            controller: _descriptionController,
                          ),
                    const UIVerticalSpace(48),
                    if (_stockTake.status != StockOrderStatus.COMPLETED) ...[
                      const UncountedItemsDataGrid(),
                      const UIVerticalSpace(60),
                      const CountedItemsDataGrid(),
                      const UIVerticalSpace(30),
                    ] else
                      const CompletedStockTakeDataGrid(),
                  ],
                ),
              ),
            ),
            const UIVerticalSpace(60),
            if (_stockTake.status == StockOrderStatus.IN_PROGRESS)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UIButton.filled(
                    'Cancel Stock Take',
                    style: UIStyleButton.danger,
                    isLoading: state is StockTakeCancelLoading,
                    onClick: () => context.read<StockTakeRemoteCubit>().update(
                          StockOrderUpdate.CANCEL,
                          id: _stockTake.id!,
                          stockTake: _stockTake,
                        ),
                  ),
                  const Spacer(),
                  UIButton.filled(
                    'Save',
                    isLoading: state is StockTakeSaveLoading,
                    onClick: () => context.read<StockTakeRemoteCubit>().update(
                          StockOrderUpdate.SAVE,
                          id: _stockTake.id!,
                          stockTake: context.read<StockTakeCubit>().state.stockTake,
                        ),
                  ),
                  const UIHorizontalSpace(12),
                  UIButton.filled(
                    'Mark as Completed',
                    onClick: () => showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => BlocConsumer<StockTakeRemoteCubit, StockTakeRemoteState>(
                        listener: (context, state) {
                          if (state is StockTakeMarkAsCompletedSuccess) {
                            Navigator.pop(context);
                            AppRouter.router.pushReplacementNamed(SideMenuTreeItem.STOCK_TAKES.name);
                            ToastNotification.success(context, state.message);
                          }
                          if (state is StockTakeMarkAsCompletedError) {
                            Navigator.pop(context);
                            ToastNotification.error(context, state.message);
                          }
                        },
                        builder: (_, state) => Dialog(
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.35,
                            color: UIColors.background,
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UIText.heading6('Please select an action for uncounted items'),
                                const Divider(color: UIColors.borderMuted),
                                const UIVerticalSpace(16),
                                UIRadioGroup<StockTakeItemAction>(
                                  direction: Axis.vertical,
                                  items: StockTakeItemAction.values,
                                  onSelect: (value) {
                                    final currentItems =
                                        context.read<StockTakeCubit>().state.stockTake.items?.toList() ?? [];

                                    if (value == StockTakeItemAction.SET_QTY_TO_ZERO) {
                                      _items = currentItems.map((item) {
                                        return item.copyWith(
                                            qtyCounted: item.qtyCounted ?? 0, difference: item.qtyExpected);
                                      }).toList();
                                    }
                                    if (value == StockTakeItemAction.DO_NOTHING) {
                                      _items = currentItems;
                                    }
                                  },
                                  itemAsString: (item) => item.label,
                                ),
                                const UIVerticalSpace(30),
                                CancelActionButton(
                                  actionLabel: 'Continue',
                                  isLoading: state is StockTakeMarkAsCompletedLoading,
                                  onCancel: () => Navigator.pop(context),
                                  onAction: () => context.read<StockTakeRemoteCubit>().update(
                                        StockOrderUpdate.MARK_AS_COMPLETE,
                                        id: _stockTake.id!,
                                        stockTake: context.read<StockTakeCubit>().state.stockTake.copyWith(
                                              items: _items,
                                            ),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
