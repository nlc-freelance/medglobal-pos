import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_bulk_action/product_bulk_action_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/widgets/category_dropdown.dart';
import 'package:medglobal_shared/extensions.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

enum BulkActionType { SET_CATEGORY, REMOVE_CATEGORY, DELETE }

class BulkActionPopupMenu extends StatefulWidget {
  const BulkActionPopupMenu({super.key});

  @override
  State<BulkActionPopupMenu> createState() => _BulkActionPopupMenuState();
}

class _BulkActionPopupMenuState extends State<BulkActionPopupMenu> {
  Category? _category;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ProductSelectionCubit, ProductSelectionState, List<int>>(
      selector: (state) => state.selectedProductIds,
      builder: (context, ids) {
        return Theme(
          data: Theme.of(context).copyWith(
            dividerTheme: const DividerThemeData(
              color: UIColors.borderMuted,
              thickness: 1,
            ),
          ),
          child: HoverBuilder(
            builder: (isHovered) => PopupMenuButton(
              position: PopupMenuPosition.under,
              offset: const Offset(-3, 8),
              tooltip: Strings.empty,
              elevation: 10,
              constraints: const BoxConstraints(minWidth: 250),
              itemBuilder: (BuildContext _) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    height: 20,
                    enabled: false,
                    child: Text("CATEGORY", style: UIStyleText.subtitle.copyWith(fontWeight: FontWeight.w600)),
                  ),
                  PopupMenuItem(
                    height: 38,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    value: BulkActionType.SET_CATEGORY,
                    onTap: () => _showBulkActionDialog(
                      context,
                      title: 'Set Category',
                      content: CategoryDropdown(onChanged: (value) => setState(() => _category = value)),
                      onAction: () => context.read<ProductBulkActionCubit>().bulkUpdate(ids, _category),
                    ),
                    child: UIText.labelMedium("Set Category"),
                  ),
                  PopupMenuItem(
                    height: 38,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    value: BulkActionType.REMOVE_CATEGORY,
                    onTap: () => _showBulkActionDialog(
                      context,
                      title: 'Remove category',
                      message: 'Are you sure you want to remove category for all selected products?',
                      onAction: () => context.read<ProductBulkActionCubit>().bulkUpdate(ids, null),
                    ),
                    child: UIText.labelMedium("Remove Category"),
                  ),
                  const PopupMenuDivider(height: 8),
                  PopupMenuItem(
                    height: 38,
                    value: BulkActionType.DELETE,
                    onTap: () => _showBulkActionDialog(
                      context,
                      title: 'Delete Products',
                      message:
                          'Are you sure you want to delete all selected products? This action is permanent and cannot be undone.',
                      onAction: () => context.read<ProductBulkActionCubit>().bulkDelete(ids),
                    ),
                    child: Row(
                      children: [
                        Assets.icons.trash.svg(colorFilter: UIColors.buttonDanger.toColorFilter),
                        const UIHorizontalSpace(6),
                        UIText.labelMedium("Delete", color: UIColors.buttonDanger),
                      ],
                    ),
                  )
                ];
              },
              child: Material(
                color: UIColors.background,
                child: Row(
                  children: [
                    Text('Bulk Actions', style: UIStyleText.labelSemiBold.textColor(isHovered)),
                    const UIHorizontalSpace(8.0),
                    Assets.icons.arrowDown.setColorOnHover(isHovered),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showBulkActionDialog(
    BuildContext context, {
    required String title,
    String? subtitle,
    String? message,
    Widget? content,
    required VoidCallback onAction,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => BlocConsumer<ProductBulkActionCubit, ProductBulkActionState>(
          listener: (context, state) {
            if (state is ProductBulkActionSuccess || state is ProductBulkActionError) Navigator.pop(context);
          },
          builder: (context, state) => Portal(
            child: Dialog(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
              backgroundColor: UIColors.background,
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.35,
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.heading6(title),
                    if (subtitle != null) UIText.subtitle(subtitle),
                    const Divider(color: UIColors.borderMuted),
                    const UIVerticalSpace(16),
                    if (message != null) UIText.bodyRegular(message),
                    if (content != null) content,
                    const UIVerticalSpace(30),
                    CancelActionButton(
                      isLoading: state is ProductBulkActionLoading,
                      actionLabel: message != null ? 'Confirm' : 'Apply',
                      actionStyle: message != null ? UIStyleButton.danger : null,
                      onCancel: () => Navigator.pop(context),
                      onAction: onAction,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
