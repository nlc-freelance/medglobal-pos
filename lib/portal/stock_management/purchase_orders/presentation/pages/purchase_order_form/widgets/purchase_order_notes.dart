import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_form_cubit/purchase_order_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PurchaseOrderNotes extends StatefulWidget {
  const PurchaseOrderNotes({super.key});

  @override
  State<PurchaseOrderNotes> createState() => _PurchaseOrderNotesState();
}

class _PurchaseOrderNotesState extends State<PurchaseOrderNotes> {
  late TextEditingController _notesController;
  late final PurchaseOrderFormCubit _formCubit;

  @override
  void initState() {
    super.initState();
    _formCubit = context.read<PurchaseOrderFormCubit>();

    final po = _formCubit.state.purchaseOrder;
    _notesController = TextEditingController(text: po.notes)
      ..addListener(() => _formCubit.setNotes(_notesController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageSectionTitle(title: 'Notes'),
        BlocBuilder<PurchaseOrderFormCubit, PurchaseOrderFormState>(
          builder: (context, state) {
            final po = state.purchaseOrder;
            return po.status == StockOrderStatus.COMPLETED || po.status == StockOrderStatus.CANCELLED
                ? UIText.bodyRegular(po.notes ?? Strings.empty)
                : UITextField.noLabel(
                    controller: _notesController,
                    hint: 'Enter notes here',
                  );
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }
}
