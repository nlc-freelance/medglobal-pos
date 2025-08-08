import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/entities/order_item.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order_item.dart';
import 'package:medglobal_admin_portal/pos/sales/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CartItemActions extends StatefulWidget {
  const CartItemActions({required this.itemId, super.key});

  final int itemId;

  @override
  State<CartItemActions> createState() => _CartItemActionsState();
}

class _CartItemActionsState extends State<CartItemActions> {
  late OrderItem? item;
  late TextEditingController _quantityController;
  late TextEditingController _discountController;

  @override
  void initState() {
    super.initState();

    setState(
      () => item = context.read<CartBloc>().state.order.items.firstWhereOrNull((item) => item.id == widget.itemId),
    );

    _quantityController = TextEditingController(text: item?.quantity.toString());
    _discountController = TextEditingController(text: item?.discount.toString());
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemId = item?.id;
    final itemDiscount = item?.discount;

    if (itemId == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  inputDecorationTheme: UIStyleInput.input.copyWith(
                    isDense: false,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.5, horizontal: 10.0),
                  ),
                ),
                child: UITextField.topLabel(
                  height: 33,
                  label: 'Quantity',
                  controller: _quantityController,
                  formatter: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => context
                      .read<CartBloc>()
                      .add(CartEvent.updateItemQuantity(itemId, _quantityController.text.toInt())),
                ),
              ),
            ),
            const UIHorizontalSpace(10),
            Expanded(
              flex: 2,
              child: UIDropdownButton<DiscountCategory>.topLabel(
                hint: 'Add Discount',
                label: 'Discount',
                suffixIcon: itemDiscount != null
                    // suffixIcon: item.discountCategory != null
                    ? InkWell(
                        onTap: () => context.read<CartBloc>().add(CartEvent.removeItemDiscount(itemId)),
                        child: Assets.icons.xCircle.svg(),
                      )
                    : Assets.icons.arrowDown.svg(),
                items: DiscountCategory.values,
                itemBuilder: (discount) => discount.label,
                value: itemDiscount,
                onSelect: (category) {
                  context.read<CartBloc>().add(CartEvent.setItemDiscount(itemId, category));
                },
              ),
            ),
            // Expanded(
            //   child: UITextField.topLabel(
            //     label: 'Discount',
            //     hint: discountType == DiscountType.PERCENT ? '0%' : 'PHP 0',
            //     controller: _discountController,
            //     onChanged: (value) {
            //       context.read<OrderCubit>().setDiscountPerItem(
            //             id: widget.item.id!,
            //             discount: double.tryParse(_discountController.text),
            //             type: discountType,
            //           );
            //     },
            //   ),
            // ),
            // const UIHorizontalSpace(4),
            // Container(
            //   margin: const EdgeInsets.only(top: 18),
            //   height: 38,
            //   decoration: BoxDecoration(
            //     borderRadius: const BorderRadius.all(Radius.circular(10)),
            //     border: Border.all(color: UIColors.borderRegular),
            //   ),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       InkWell(
            //         onTap: () => context
            //             .read<OrderCubit>()
            //             .setDiscountTypePerItem(id: widget.item.id!, type: DiscountType.PESO),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color:
            //                 discountType == DiscountType.PESO ? UIColors.buttonSecondaryHover : UIColors.background,
            //             borderRadius: const BorderRadiusDirectional.only(
            //               topStart: Radius.circular(8),
            //               bottomStart: Radius.circular(8),
            //             ),
            //           ),
            //           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            //           child: UIText.labelSemiBold(
            //             'PHP',
            //             color: discountType == DiscountType.PESO ? UIColors.primary : UIColors.textLight,
            //           ),
            //         ),
            //       ),
            //       InkWell(
            //         onTap: () => context
            //             .read<OrderCubit>()
            //             .setDiscountTypePerItem(id: widget.item.id!, type: DiscountType.PERCENT),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: discountType == DiscountType.PERCENT
            //                 ? UIColors.buttonSecondaryHover
            //                 : UIColors.background,
            //             borderRadius: const BorderRadiusDirectional.only(
            //               topEnd: Radius.circular(8),
            //               bottomEnd: Radius.circular(8),
            //             ),
            //           ),
            //           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            //           child: UIText.labelSemiBold(
            //             '%',
            //             color: discountType == DiscountType.PERCENT ? UIColors.primary : UIColors.textLight,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
        // if (_discountType == DiscountType.PERCENT) ...[
        //   const UIVerticalSpace(12),
        //   SizedBox(
        //     height: 38,
        //     child: ListView.separated(
        //       shrinkWrap: true,
        //       scrollDirection: Axis.horizontal,
        //       separatorBuilder: (context, index) => const UIHorizontalSpace(8),
        //       itemCount: _discounts.length,
        //       itemBuilder: (context, index) => InkWell(
        //         onTap: () {
        //           /// Add discount
        //           _discountController.text = _discounts[index];
        //           setState(() => _discountIdx = index);
        //         },
        //         child: Container(
        //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        //           decoration: BoxDecoration(
        //             color: index == _discountIdx ? UIColors.buttonSecondaryHover : UIColors.background,
        //             borderRadius: const BorderRadius.all(Radius.circular(10)),
        //             border: Border.all(color: UIColors.borderRegular),
        //           ),
        //           child: UIText.bodyRegular(_discounts[index]),
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
      ],
    );
  }
}
