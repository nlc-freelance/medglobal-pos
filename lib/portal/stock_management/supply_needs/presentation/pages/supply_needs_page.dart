import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/new_purchase_order/new_purchase_order_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/presentation/cubit/new_stock_transfer/new_stock_transfer_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/presentation/cubit/supply_need/supply_need_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/presentation/cubit/supply_needs/supply_needs_cubit.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/presentation/pages/supply_needs_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SupplyNeedsPage extends StatefulWidget {
  const SupplyNeedsPage({super.key});

  @override
  State<SupplyNeedsPage> createState() => _SupplyNeedsPageState();
}

class _SupplyNeedsPageState extends State<SupplyNeedsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SupplyNeedsCubit>().getSupplyNeeds();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          title: 'Supply Needs',
          subtitle: Strings.subtitlePlaceholder,
        ),
        DataGridToolbar(
          searchPlaceholder: 'Search branch name',
          filters: [
            UIButton.outlined(
              'All Branches',
              iconAlign: IconAlignment.end,
              iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
              onClick: () {},
            ),
          ],
        ),
        BlocBuilder<SupplyNeedsCubit, SupplyNeedsState>(
          builder: (context, state) {
            if (state is SupplyNeedsError) {
              return Text(state.message);
            }
            if (state is SupplyNeedsLoaded) {
              return Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: state.supplyNeeds
                        .map((supplyNeed) => Theme(
                              data: Theme.of(context).copyWith(dividerColor: UIColors.transparent),
                              child: Container(
                                decoration: UIStyleContainer.topBorder,
                                child: ExpansionTile(
                                  trailing: Assets.icons.arrowDown.setSize(12),
                                  title: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '${supplyNeed.branch?.name} (${supplyNeed.items?.length})',
                                        style: UIStyleText.labelSemiBold.copyWith(
                                          color: UIColors.textDark,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      const UIHorizontalSpace(12),
                                      UIPopupMenuButton<SupplyNeedsAction>.icon(
                                        icon: Assets.icons.more.svg(),
                                        menu: SupplyNeedsAction.values,
                                        menuAsString: (option) => option.label,
                                        onSelect: (action) {
                                          if (action == SupplyNeedsAction.NEW_PURCHASE_ORDER) {
                                            AppRouter.router.goNamed(SideMenuTreeItem.NEW_PURCHASE_ORDER.name);
                                            // branch should be autopopulated in step 1
                                            context
                                                .read<SupplyNeedCubit>()
                                                .setPurchaseOrderTargetBranch(supplyNeed.branch!);

                                            /// set the value
                                            context.read<NewPurchaseOrderCubit>().setBranchId(supplyNeed.branch!.id!);
                                          }
                                          if (action == SupplyNeedsAction.NEW_STOCK_TRANSFER) {
                                            AppRouter.router.goNamed(SideMenuTreeItem.NEW_STOCK_TRANSFER.name);
                                            // source branch should be autopopulated in step 1
                                            context
                                                .read<SupplyNeedCubit>()
                                                .setStockTransferSourceBranch(supplyNeed.branch!);

                                            /// set the value
                                            context
                                                .read<NewStockTransferCubit>()
                                                .setSourceBranchId(supplyNeed.branch!.id!);
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                  children: [
                                    SupplyNeedsDataGrid(supplyNeed.items ?? []),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2));
          },
        ),
      ],
    );
  }
}
