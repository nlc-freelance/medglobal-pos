// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/order/order_cubit.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/sale_remote/sale_remote_cubit.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/widgets/order_bill/order_bill.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/widgets/order_items/order_item_list.dart';
// import 'package:medglobal_shared/medglobal_shared.dart';

// class CartOpen extends StatelessWidget {
//   const CartOpen({super.key, this.isReadOnly = false});

//   final bool isReadOnly;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<OrderCubit, OrderState>(
//       buildWhen: (previous, current) => previous.order.items?.length != current.order.items?.length,
//       builder: (context, state) {
//         final orderItems = state.order.items ?? [];

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 UIText.heading5('Order ${isReadOnly ? 'Summary' : 'Details'}'),
//                 const UIHorizontalSpace(8),
//                 UIText.bodyRegular('(${orderItems.length} items)', color: UIColors.textMuted),
//               ],
//             ),
//             if (orderItems.isNotEmpty == true) ...[
//               const UIVerticalSpace(24),
//               Expanded(child: OrderItemList(orderItems, isReadOnly: isReadOnly)),
//               const UIVerticalSpace(46),
//             ] else ...[
//               const Spacer(),
//               Center(
//                 child: Column(
//                   children: [
//                     Assets.icons.cube.svg(),
//                     const UIVerticalSpace(12),
//                     UIText.labelMedium('No items added'),
//                   ],
//                 ),
//               ),
//               const Spacer(),
//             ],
//             BlocConsumer<OrderCubit, OrderState>(
//               listenWhen: (previous, current) => previous.order.hasChangedAnyItem(current.order),
//               listener: (context, state) => context.read<OrderCubit>().computeOrderBill(),
//               builder: (context, state) => OrderBill(order: state.order, isReadOnly: isReadOnly),
//             ),
//             if (orderItems.isNotEmpty == true && !isReadOnly) ...[
//               const UIVerticalSpace(16),
//               Row(
//                 children: [
//                   Expanded(
//                     child: UIButton.filled(
//                       'Cancel Order',
//                       onClick: () => context.read<OrderCubit>().reset(),
//                       style: UIStyleButton.filled.style?.copyWith(
//                         minimumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
//                         backgroundColor: UIStyleUtil.setColor(UIColors.whiteBg),
//                         overlayColor: UIStyleUtil.setColor(UIColors.cancelled),
//                         textStyle: UIStyleUtil.setTextStyle(UIStyleText.heading6),
//                         foregroundColor: UIStyleUtil.setForegroundColorOnHover(UIColors.background),
//                       ),
//                     ),
//                   ),
//                   const UIHorizontalSpace(8),
//                   Expanded(
//                     flex: 2,
//                     child: UIButton.filled(
//                       'Place Order',
//                       onClick: () {
//                         AppRouter.router.goNamed('Billing');
//                         context.read<SaleRemoteCubit>().reset();
//                       },
//                       style: UIStyleButton.filled.style?.copyWith(
//                         minimumSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
//                         textStyle: UIStyleUtil.setTextStyle(UIStyleText.heading6.copyWith(color: UIColors.textRegular)),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ],
//         );
//       },
//     );
//   }
// }
