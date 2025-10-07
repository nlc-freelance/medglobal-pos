// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/new_purchase_order_form/new_purchase_order_form_cubit.dart';
// import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/pages/purchase_order_details/stepper/purchase_order_stepper.dart';
// import 'package:medglobal_shared/medglobal_shared.dart';
//
// class NewPurchaseOrderPage extends StatefulWidget {
//   const NewPurchaseOrderPage({super.key});
//
//   @override
//   State<NewPurchaseOrderPage> createState() => _NewPurchaseOrderPageState();
// }
//
// class _NewPurchaseOrderPageState extends State<NewPurchaseOrderPage> {
//   @override
//   void initState() {
//     super.initState();
//     // context.read<PurchaseOrderRemoteCubit>().reset();
//     context.read<NewPurchaseOrderFormCubit>().reset();
//
//     /// TODO: Can be removed if the initState is always triggered when navigating to [PurchaseOrderListPage]
//     // context.read<PurchaseOrderFormCubit>().reset();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const PageHeader(title: 'New Purchase Order'),
//         UIText.heading5('Step 1 of 4 - Creation'),
//         const UIVerticalSpace(12),
//         const PurchaseOrderStepper(),
//       ],
//     );
//   }
// }
