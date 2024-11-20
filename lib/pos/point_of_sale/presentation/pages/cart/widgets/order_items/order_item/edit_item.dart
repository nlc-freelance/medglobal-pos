import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/order/order_cubit.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class EditItem extends StatefulWidget {
  const EditItem(this.item, {super.key});

  final TransactionItem item;

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  late TextEditingController _qtyController;
  late TextEditingController _discountController;

  @override
  void initState() {
    super.initState();

    final item = (context.read<OrderCubit>().state.order.items ?? []).singleWhere((item) => item.id == widget.item.id);

    _qtyController = TextEditingController(text: item.qty.toString());
    _discountController = TextEditingController(text: (item.discount ?? '').toString());
  }

  @override
  void dispose() {
    _qtyController.dispose();
    _discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        final item = (state.order.items ?? []).singleWhere((item) => item.id == widget.item.id);
        // final discountType = item.discountType ?? DiscountType.PERCENT;

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
                      controller: _qtyController,
                      onChanged: (value) => context.read<OrderCubit>().setQtyPerItem(
                            id: item.id!,
                            qty: int.tryParse(_qtyController.text),
                          ),
                    ),
                  ),
                ),
                const UIHorizontalSpace(10),
                Expanded(
                  flex: 2,
                  child: UIDropdownButton<DiscountCategory>.topLabel(
                    hint: 'Add Discount',
                    label: 'Discount',
                    suffixIcon: item.discountCategory != null
                        ? InkWell(
                            onTap: () => context.read<OrderCubit>().removeDiscountPerItem(item.id!),
                            child: Assets.icons.xCircle.svg(),
                          )
                        : Assets.icons.arrowDown.svg(),
                    items: DiscountCategory.values,
                    itemBuilder: (discount) => discount.label,
                    value: item.discountCategory,
                    onSelect: (category) {
                      context.read<OrderCubit>().setDiscountPerItem(
                            id: item.id!,
                            discount: category.value,
                            discountCategory: category,
                          );
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
      },
    );
  }
}
