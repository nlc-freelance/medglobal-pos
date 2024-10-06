import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/supplier_dropdown.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/entities/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/bloc/stock_take_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/presentation/cubit/new_stock_take/new_stock_take_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class NewStockTakeDialog extends StatefulWidget {
  const NewStockTakeDialog({super.key});

  @override
  State<NewStockTakeDialog> createState() => _NewStockTakeDialogState();
}

class _NewStockTakeDialogState extends State<NewStockTakeDialog> {
  bool _isInitialRebuild = false;

  @override
  void initState() {
    super.initState();
    setState(() => _isInitialRebuild = true);

    /// Reset NewStockTakeCubit
    context.read<NewStockTakeCubit>().reset();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<StockTakeBloc, StockTakeBlocRemoteState>(
        listener: (context, state) {
          if (state is StockTakeCreateSuccess) {
            final id = state.stockTake.id;
            AppRouter.router.goNamed(
              SideMenuTreeItem.STOCK_TAKE_DETAILS.name,
              pathParameters: {'id': id.toString()},
            );
            Navigator.pop(context);
          }
          if (state is StockTakeError) setState(() => _isInitialRebuild = false);
        },
        builder: (context, state) {
          return Portal(
            child: Dialog(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.35,
                color: UIColors.background,
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.heading6('New Stock Take'),
                    const Divider(color: UIColors.borderMuted),
                    const UIVerticalSpace(16),
                    BranchDropdown.input_left(
                      label: 'Target Branch',
                      hint: 'Select branch',
                      required: true,
                      onSelectItem: (Branch value) => context.read<NewStockTakeCubit>().setBranchId(value.id!),
                    ),
                    const UIVerticalSpace(16),
                    SupplierDropdown.input_left(
                      label: 'Target Supplier',
                      hint: 'Select supplier',
                      required: true,
                      onSelectItem: (Supplier value) => context.read<NewStockTakeCubit>().setSupplierId(value.id!),
                    ),
                    const UIVerticalSpace(16),
                    UICheckboxListTile(
                      'Set target branch as All Suppliers',
                      subtitle: 'Selecting All Suppliers will override the selected supplier from the dropdown above',
                      onToggle: (value) => context.read<NewStockTakeCubit>().setIsAllSupplier(value),
                    ),
                    const UIVerticalSpace(30),
                    if (state is StockTakeError && !_isInitialRebuild)
                      UIText.labelSemiBold(state.message, color: UIColors.buttonDanger),
                    CancelActionButton(
                      actionLabel: 'Start',
                      isLoading: state is StockTakeCreateLoading,
                      onCancel: () => Navigator.pop(context),
                      onAction: () => context
                          .read<StockTakeBloc>()
                          .add(CreateStockTakeEvent(context.read<NewStockTakeCubit>().state.payload)),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
