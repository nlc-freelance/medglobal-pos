import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_form_cubit/purchase_order_form_cubit.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PurchaseOrderGeneralInfo extends StatelessWidget {
  const PurchaseOrderGeneralInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseOrderFormCubit, PurchaseOrderFormState>(
      builder: (context, state) {
        final po = state.purchaseOrder;

        return Wrap(
          spacing: 120,
          runSpacing: 30,
          children: [
            LabelValue.text(
              label: 'Purchase Order ID',
              value: po.id.toString(),
            ),
            LabelValue.text(
              label: 'Created Date',
              value: po.createdAt != null ? po.createdAt!.toFormattedShortDate() : Strings.noValue,
            ),
            if (po.status == StockOrderStatus.COMPLETED)
              LabelValue.text(
                label: 'Received Date',
                value: po.updatedAt != null ? po.updatedAt!.toFormattedShortDate() : Strings.noValue,
              ),
            LabelValue.text(
              label: 'Supplier',
              value: po.supplier?.name,
            ),
            LabelValue.text(
              label: 'Target Branch',
              value: po.branch?.name,
            ),
            if (po.status == StockOrderStatus.NEW)
              LabelValue.button(
                label: 'Estimated Date of Arrival',
                button: DatePickerPopup(
                  isInput: true,
                  selectionMode: DateRangePickerSelectionMode.single,
                  selectedDate: po.estimatedDateOfArrival,
                  onSelect: (date) => context.read<PurchaseOrderFormCubit>().setEstimatedDateOfArrival(date),
                ),
              )
            else
              LabelValue.text(
                label: 'Estimated Date of Arrival',
                value: po.estimatedDateOfArrival != null
                    ? po.estimatedDateOfArrival!.toFormattedShortDate()
                    : Strings.noValue,
              ),
          ],
        );
      },
    );
  }
}
