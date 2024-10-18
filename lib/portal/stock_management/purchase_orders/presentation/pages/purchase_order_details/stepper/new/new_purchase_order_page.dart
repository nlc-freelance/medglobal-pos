import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/new_purchase_order/new_purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order/purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_remote/purchase_order_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/purchase_order_stepper.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class NewPurchaseOrderPage extends StatefulWidget {
  const NewPurchaseOrderPage({super.key});

  @override
  State<NewPurchaseOrderPage> createState() => _NewPurchaseOrderPageState();
}

class _NewPurchaseOrderPageState extends State<NewPurchaseOrderPage> {
  @override
  void initState() {
    super.initState();
    context.read<PurchaseOrderRemoteCubit>().reset();
    context.read<NewPurchaseOrderCubit>().reset();

    /// TODO: Can be removed if the initState is always triggered when navigating to [PurchaseOrdersPage]
    context.read<PurchaseOrderCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'New Purchase Order',
          subtitle: Strings.subtitlePlaceholder,
        ),
        UIText.heading5('Step 1 of 4 - Creation'),
        const UIVerticalSpace(12),
        const PurchaseOrderStepper(),
      ],
    );
  }
}
