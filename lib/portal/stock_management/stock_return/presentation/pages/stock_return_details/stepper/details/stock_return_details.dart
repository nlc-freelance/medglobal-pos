import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/cubit/stock_return/stock_return_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_details/stepper/details/stock_items_returned_data_grid.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/presentation/pages/stock_return_details/stepper/details/stock_items_to_return_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockReturnDetails extends StatefulWidget {
  const StockReturnDetails({super.key});

  @override
  State<StockReturnDetails> createState() => _StockReturnDetailsState();
}

class _StockReturnDetailsState extends State<StockReturnDetails> {
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    final stockReturn = context.read<StockReturnCubit>().state.stockReturn;

    _notesController = TextEditingController(text: stockReturn.notes)
      ..addListener(() => context.read<StockReturnCubit>().setNotes(_notesController.text));
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<StockReturnCubit, StockReturnState, StockReturn>(
      selector: (state) => state.stockReturn,
      builder: (context, stockReturn) {
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
                  label: 'Stock Return ID',
                  value: stockReturn.id.toString(),
                ),
                LabelValue.text(
                  label: 'Created Date',
                  value:
                      stockReturn.createdAt != null ? DateFormat.yMd().format(stockReturn.createdAt!) : Strings.noValue,
                ),
                LabelValue.text(
                  label: 'Supplier',
                  value: stockReturn.supplier?.name,
                ),
                LabelValue.text(
                  label: 'Return from',
                  value: stockReturn.branch?.name,
                ),
              ],
            ),
            const UIVerticalSpace(40),
            stockReturn.status == StockOrderStatus.COMPLETED
                ? const StockItemsReturnedDataGrid()
                : const StockItemsToReturnDataGrid(),
            const UIVerticalSpace(60),
            const PageSectionTitle(title: 'Notes'),
            stockReturn.status == StockOrderStatus.COMPLETED
                ? UIText.bodyRegular(stockReturn.notes ?? Strings.empty)
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
