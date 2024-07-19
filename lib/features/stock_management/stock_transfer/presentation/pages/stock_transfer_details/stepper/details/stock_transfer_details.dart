import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/cubit/stock_transfer/stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stepper/details/stock_items_shipped_data_grid.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stepper/details/stock_items_to_transfer_data_grid.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/presentation/pages/stock_transfer_details/stepper/details/stock_items_transferred_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockTransferDetails extends StatefulWidget {
  const StockTransferDetails({super.key});

  @override
  State<StockTransferDetails> createState() => _StockTransferDetailsState();
}

class _StockTransferDetailsState extends State<StockTransferDetails> {
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    final stockTransfer = context.read<StockTransferCubit>().state.stockTransfer;

    _notesController = TextEditingController(text: stockTransfer.notes)
      ..addListener(() => context.read<StockTransferCubit>().setNotes(_notesController.text));
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<StockTransferCubit, StockTransferState, StockTransfer>(
      selector: (state) => state.stockTransfer,
      builder: (context, stockTransfer) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UIVerticalSpace(20),
            const PageSectionTitle(title: 'General Information'),
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 16,
                mainAxisExtent: 60,
              ),
              shrinkWrap: true,
              children: [
                LabelValue.text(
                  label: 'Stock Transfer ID',
                  value: stockTransfer.id.toString(),
                ),
                LabelValue.text(
                  label: 'Created Date',
                  value: stockTransfer.createdAt != null
                      ? DateFormat.yMd().format(stockTransfer.createdAt!)
                      : Strings.empty,
                ),
                LabelValue.text(
                  label: 'Source Branch',
                  value: stockTransfer.sourceBranch?.name,
                ),
                LabelValue.text(
                  label: 'Destination Branch',
                  value: stockTransfer.destinationBranch?.name,
                ),
              ],
            ),
            const UIVerticalSpace(40),
            if (stockTransfer.status == StockOrderStatus.NEW) const StockItemsToTransferDataGrid(),
            if (stockTransfer.status == StockOrderStatus.SHIPPED) const StockItemsShippedDataGrid(),
            if (stockTransfer.status == StockOrderStatus.COMPLETED) const StockItemsTransferredDataGrid(),
            const UIVerticalSpace(60),
            const PageSectionTitle(title: 'Notes'),
            stockTransfer.status == StockOrderStatus.COMPLETED || stockTransfer.status == StockOrderStatus.CANCELLED
                ? UIText.bodyRegular(stockTransfer.notes ?? Strings.empty)
                : UITextField.noLabel(
                    hint: 'Enter notes here',
                    controller: _notesController,
                  ),
            const UIVerticalSpace(60),
          ],
        );
      },
    );
  }
}
