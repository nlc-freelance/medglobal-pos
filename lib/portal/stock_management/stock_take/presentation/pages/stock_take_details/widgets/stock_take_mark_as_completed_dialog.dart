import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/bloc/stock_take_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/stock_take_items/counted_items_list/counted_items_list_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockTakeMarkAsCompletedDialog extends StatefulWidget {
  const StockTakeMarkAsCompletedDialog(this.stockTake, {super.key});

  final StockTake stockTake;

  @override
  State<StockTakeMarkAsCompletedDialog> createState() => _StockTakeMarkAsCompletedDialogState();
}

class _StockTakeMarkAsCompletedDialogState extends State<StockTakeMarkAsCompletedDialog> {
  bool _isInitialRebuild = false;

  @override
  void initState() {
    super.initState();
    setState(() => _isInitialRebuild = true);
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<StockTakeBloc, StockTakeBlocRemoteState>(
        listener: (context, state) {
          if (state is StockTakeMarkAsCompletedSuccess) {
            if (state.stockTake.status == StockOrderStatus.PENDING) {
              context.read<StockTakeBloc>().add(
                    StartStockTakePollingEvent(
                      widget.stockTake.id!,
                      targetStatus: StockOrderStatus.COMPLETED,
                    ),
                  );
            } else {
              context.read<CountedItemsListCubit>().getItems(id: state.stockTake.id!);
            }
            Navigator.pop(context);
          }
          if (state is StockTakeMarkAsCompletedError) setState(() => _isInitialRebuild = false);
        },
        builder: (_, state) {
          StockTakeItemAction? action;

          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Dialog(
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
                        itemAsString: (item) => item.label,
                        onSelect: (value) {
                          setState(() => action = value);
                          // if (value == StockTakeItemAction.SET_QTY_TO_ZERO) setState(() => action = value);
                          // if (value == StockTakeItemAction.DO_NOTHING) setState(() => uncountedItemsValue = null);
                        },
                      ),
                      const UIVerticalSpace(30),
                      if (state is StockTakeMarkAsCompletedError && !_isInitialRebuild)
                        UIText.labelSemiBold(state.message, color: UIColors.buttonDanger),
                      CancelActionButton(
                        actionLabel: 'Continue',
                        isLoading: state is StockTakeMarkAsCompletedLoading,
                        onCancel: () => Navigator.pop(context),
                        onAction: () => context.read<StockTakeBloc>().add(
                              UpdateStockTakeEvent(
                                StockOrderUpdate.MARK_AS_COMPLETE,
                                id: widget.stockTake.id!,
                                stockTake: widget.stockTake,
                                action: action,
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
}
