// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medglobal_admin_portal/core/core.dart';
// import 'package:medglobal_admin_portal/pos/register/presentation/cubit/order/order_cubit.dart';
// import 'package:medglobal_shared/medglobal_shared.dart';
//
// class OrderDiscount extends StatefulWidget {
//   const OrderDiscount({super.key, this.isOrderPlaced = false});
//
//   final bool isOrderPlaced;
//
//   @override
//   State<OrderDiscount> createState() => _OrderDiscountState();
// }
//
// class _OrderDiscountState extends State<OrderDiscount> {
//   late TextEditingController _discountController;
//
//   @override
//   void initState() {
//     super.initState();
//     final order = context.read<OrderCubit>().state.order;
//
//     _discountController = TextEditingController(text: (order.discount ?? '').toString())
//       ..addListener(
//         () => context.read<OrderCubit>().setDiscount(
//             discount: double.tryParse(_discountController.text), type: order.discountType ?? DiscountType.PERCENT),
//       );
//   }
//
//   @override
//   void dispose() {
//     _discountController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<OrderCubit, OrderState>(
//       listenWhen: (previous, current) => previous.order.hasChangedInSubtotalDiscountOrType(current.order),
//       listener: (context, state) {
//         context.read<OrderCubit>().computeDiscountInPeso();
//         context.read<OrderCubit>().computeTotal();
//       },
//       buildWhen: (previous, current) => previous.order.hasChangedInSubtotalDiscountOrType(current.order),
//       builder: (context, state) => Theme(
//         data: Theme.of(context).copyWith(
//           dividerColor: UIColors.transparent,
//           highlightColor: UIColors.transparent,
//           hoverColor: UIColors.whiteBg,
//         ),
//         child: ListTileTheme(
//           contentPadding: EdgeInsets.zero,
//           dense: true,
//           horizontalTitleGap: 0.0,
//           minLeadingWidth: 0,
//           child: ExpansionTile(
//             enabled: widget.isOrderPlaced != true && state.order.items?.isNotEmpty == true,
//             controlAffinity: ListTileControlAffinity.leading,
//             leading: const SizedBox(),
//             visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 UIText.bodyRegular('Discount', color: UIColors.textLight),
//                 const UIHorizontalSpace(8),
//                 if (!widget.isOrderPlaced && state.order.items?.isNotEmpty == true) ...[
//                   Assets.icons.edit2.svg(width: 12, colorFilter: UIColors.textLight.toColorFilter),
//                   const UIHorizontalSpace(8),
//                 ],
//                 const Spacer(),
//                 if (state.order.discount != null && state.order.discount != 0) ...[
//                   Container(
//                     margin: const EdgeInsets.only(top: 0),
//                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color: UIColors.cancelledBg.withOpacity(0.4),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Assets.icons.tag.svg(colorFilter: UIColors.buttonDanger.toColorFilter, width: 12),
//                         const UIHorizontalSpace(8),
//                         Text(
//                           state.order.discountType == DiscountType.PESO
//                               ? '₱${state.order.discount} off'
//                               : '${state.order.discount}% off',
//                           style: UIStyleText.hint.copyWith(color: UIColors.buttonDanger, fontSize: 11),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const UIHorizontalSpace(8),
//                 ],
//                 UIText.bodyRegular('₱${(state.order.discountInPeso ?? 0).toStringAsFixed(2)}'),
//               ],
//             ),
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: UITextField.noLabel(
//                       controller: _discountController,
//                       hint: state.order.discountType == DiscountType.PERCENT ? '0%' : 'PHP 0',
//                     ),
//                   ),
//                   const UIHorizontalSpace(4),
//                   Container(
//                     height: 38,
//                     decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(10)),
//                       border: Border.all(color: UIColors.borderRegular),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             context.read<OrderCubit>().setDiscountType(DiscountType.PESO);
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: state.order.discountType == DiscountType.PESO
//                                   ? UIColors.buttonSecondaryHover
//                                   : UIColors.background,
//                               borderRadius: const BorderRadiusDirectional.only(
//                                 topStart: Radius.circular(8),
//                                 bottomStart: Radius.circular(8),
//                               ),
//                             ),
//                             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                             child: UIText.labelSemiBold(
//                               'PHP',
//                               color:
//                                   state.order.discountType == DiscountType.PESO ? UIColors.primary : UIColors.textLight,
//                             ),
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             context.read<OrderCubit>().setDiscountType(DiscountType.PERCENT);
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: state.order.discountType == DiscountType.PERCENT
//                                   ? UIColors.buttonSecondaryHover
//                                   : UIColors.background,
//                               borderRadius: const BorderRadiusDirectional.only(
//                                 topEnd: Radius.circular(8),
//                                 bottomEnd: Radius.circular(8),
//                               ),
//                             ),
//                             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                             child: UIText.labelSemiBold(
//                               '%',
//                               color: state.order.discountType == DiscountType.PERCENT
//                                   ? UIColors.primary
//                                   : UIColors.textLight,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
