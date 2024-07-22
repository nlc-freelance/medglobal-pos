import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/stock_take_item.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/cubit/stock_take/stock_take_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/cubit/stock_take_remote/stock_take_remote_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockTakeMarkAsCompletedDialog extends StatefulWidget {
  const StockTakeMarkAsCompletedDialog({super.key, required this.items});
  final List<StockTakeItem> items;

  @override
  State<StockTakeMarkAsCompletedDialog> createState() => _StockTakeMarkAsCompletedDialogState();
}

class _StockTakeMarkAsCompletedDialogState extends State<StockTakeMarkAsCompletedDialog> {
  List<StockTakeItem>? _items;
  bool _isInitialRebuild = false;

  @override
  void initState() {
    super.initState();
    _items = widget.items;
    setState(() => _isInitialRebuild = true);
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<StockTakeRemoteCubit, StockTakeRemoteState>(
        listener: (context, state) {
          if (state is StockTakeMarkAsCompletedSuccess) {
            Navigator.pop(context);
            AppRouter.router.pushReplacementNamed(SideMenuTreeItem.STOCK_TAKES.name);
            ToastNotification.success(context, state.message);
          }
          if (state is StockTakeMarkAsCompletedError) setState(() => _isInitialRebuild = false);
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
                  itemAsString: (item) => item.label,
                  onSelect: (value) {
                    final currentItems = context.read<StockTakeCubit>().state.stockTake.items?.toList() ?? [];

                    if (value == StockTakeItemAction.SET_QTY_TO_ZERO) {
                      _items = currentItems.map((item) {
                        return item.copyWith(qtyCounted: item.qtyCounted ?? 0, difference: item.qtyExpected);
                      }).toList();
                    }
                    if (value == StockTakeItemAction.DO_NOTHING) {
                      _items = currentItems;
                    }
                  },
                ),
                const UIVerticalSpace(30),
                if (state is StockTakeMarkAsCompletedError && !_isInitialRebuild)
                  UIText.labelSemiBold(state.message, color: UIColors.buttonDanger),
                CancelActionButton(
                  actionLabel: 'Continue',
                  isLoading: state is StockTakeMarkAsCompletedLoading,
                  onCancel: () => Navigator.pop(context),
                  onAction: () => context.read<StockTakeRemoteCubit>().update(
                        StockOrderUpdate.MARK_AS_COMPLETE,
                        id: context.read<StockTakeCubit>().state.stockTake.id!,
                        stockTake: context.read<StockTakeCubit>().state.stockTake.copyWith(items: _items),
                      ),
                ),
              ],
            ),
          ),
        ),
      );
}
