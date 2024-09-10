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
        BlocBuilder<SupplyNeedsCubit, SupplyNeedsState>(
          builder: (context, state) {
            if (state is SupplyNeedsError) {
              return Text(state.message);
            }
            if (state is SupplyNeedsLoaded) {
              return state.supplyNeeds.isNotEmpty
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: state.supplyNeeds
                                    .map((supplyNeed) => Theme(
                                          data: Theme.of(context).copyWith(dividerColor: UIColors.transparent),
                                          child: Container(
                                            decoration: UIStyleContainer.topBorder,
                                            child: ExpansionTile(
                                              initiallyExpanded: true,
                                              leading: Assets.icons.arrowDown.setSize(12),
                                              trailing: UIPopupMenuButton<SupplyNeedsAction>.icon(
                                                icon: Assets.icons.more.setSize(20),
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
                                                    context
                                                        .read<NewPurchaseOrderCubit>()
                                                        .setBranchId(supplyNeed.branch!.id!);
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
                                              ),
                                              title: Text(
                                                '${supplyNeed.branch?.name} (${supplyNeed.items?.length})',
                                                style: UIStyleText.heading6.copyWith(
                                                  color: UIColors.textRegular,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13,
                                                  decoration: TextDecoration.none,
                                                ),
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
                          ),
                        ],
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: UIColors.secondary,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UIText.labelMedium('No product is found below or equal to its warning stock level.'),
                          const UIVerticalSpace(16),
                          UIText.labelMedium(
                            'Please ensure that you have configured the warning stock levels of your products correctly.',
                            color: UIColors.textMuted,
                          ),
                        ],
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
