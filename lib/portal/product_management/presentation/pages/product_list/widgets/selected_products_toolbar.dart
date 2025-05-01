import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/widgets/bulk_action_popup_menu.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SelectedProductsToolbar extends StatelessWidget {
  const SelectedProductsToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSelectionCubit, ProductSelectionState>(
      builder: (context, state) {
        if (state.selectedProductIds.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                UIText.labelMedium('${state.selectedProductIds.length} item(s) selected', color: UIColors.textLight),
                const UIHorizontalSpace(16.0),
                const BulkActionPopupMenu(),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
