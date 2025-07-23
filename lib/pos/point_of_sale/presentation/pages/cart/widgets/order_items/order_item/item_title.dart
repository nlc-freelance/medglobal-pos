// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/order/order_cubit.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/pages/cart/widgets/order_items/order_item/item_details.dart';
// import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';
// import 'package:medglobal_shared/medglobal_shared.dart';

// class ItemTitle extends StatefulWidget {
//   const ItemTitle(this.item, {super.key, this.isReadOnly = false});

//   final TransactionItem item;
//   final bool isReadOnly;

//   @override
//   State<ItemTitle> createState() => _ItemTitleState();
// }

// class _ItemTitleState extends State<ItemTitle> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (!widget.isReadOnly) ...[
//           Padding(
//             padding: const EdgeInsets.only(left: 12, top: 4.8),
//             child: Assets.icons.arrowRight.svg(width: 12, colorFilter: UIColors.textMuted.toColorFilter),
//           ),
//           HoverBuilder(
//             builder: (isHover) => Padding(
//               padding: const EdgeInsets.only(top: 3.5, left: 12),
//               child: InkWell(
//                 onTap: () => context.read<OrderCubit>().removeItem(widget.item.id!),
//                 child: Assets.icons.minusSquare.svg(
//                   width: 16,
//                   colorFilter: isHover ? UIColors.buttonDanger.toColorFilter : UIColors.textMuted.toColorFilter,
//                 ),
//               ),
//             ),
//           ),
//           const UIHorizontalSpace(18),
//         ] else
//           const UIHorizontalSpace(4),
//         widget.isReadOnly
//             ? ItemDetails(item: widget.item)
//             : BlocBuilder<OrderCubit, OrderState>(
//                 /// Rebuild details of an order item when there's changes in quantity or discount
//                 buildWhen: (previous, current) {
//                   if (previous.order.items?.length == current.order.items?.length) {
//                     final prevItems = previous.order.items ?? [];
//                     final currItems = current.order.items ?? [];

//                     for (var prevItem in prevItems) {
//                       final currItem = currItems.firstWhere((item) => item.id == prevItem.id);
//                       if (prevItem.hasChangedInQtyDiscountOrTypePerItem(currItem)) {
//                         return true;
//                       }
//                     }

//                     return false;
//                   }
//                   return false;
//                 },
//                 builder: (context, state) {
//                   final item = (state.order.items ?? []).singleWhere((item) => item.id == widget.item.id);

//                   return ItemDetails(item: item);
//                 },
//               ),
//       ],
//     );
//   }
// }
