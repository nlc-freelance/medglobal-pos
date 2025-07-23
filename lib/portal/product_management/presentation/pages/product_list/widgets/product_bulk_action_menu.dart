import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/form/app_dropdown_form_field.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/product_bulk_bloc/product_bulk_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form_cubit/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_shared/extensions.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

enum BulkActionType { setCategory, removeCategory, delete }

class ProductBulkActionMenu extends StatefulWidget {
  const ProductBulkActionMenu({super.key});

  @override
  State<ProductBulkActionMenu> createState() => _ProductBulkActionMenuState();
}

class _ProductBulkActionMenuState extends State<ProductBulkActionMenu> {
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
                    value: BulkActionType.setCategory,
                    onTap: () => _showBulkActionDialog(
                      context,
                      title: 'Product Bulk Update',
                      content: AppDropdownFormField<Category>.lazy(
                        label: 'Category',
                        hint: 'Select category',
                        getName: (category) => category.name,
                        onChanged: (category) => context.read<ProductFormCubit>().setCategory(category),
                      ),
                      // content: CategoryDropdown(onChanged: (value) => setState(() => _category = value)),
                      onAction: () => context.read<ProductBulkBloc>().add(ProductBulkEvent.bulkUpdateProduct(
                            ids: ids,
                            category: _category,
                          )),
                    ),
                    child: UIText.labelMedium("Set Category"),
                  ),
                  PopupMenuItem(
                    height: 38,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    value: BulkActionType.removeCategory,
                    onTap: () => _showBulkActionDialog(
                      context,
                      title: 'Product Bulk Update',
                      message: 'Are you sure you want to remove category for all selected products?',
                      onAction: () => context.read<ProductBulkBloc>().add(ProductBulkEvent.bulkUpdateProduct(ids: ids)),
                    ),
                    child: UIText.labelMedium("Remove Category"),
                  ),
                  const PopupMenuDivider(height: 8),
                  PopupMenuItem(
                    height: 38,
                    value: BulkActionType.delete,
                    onTap: () => _showBulkActionDialog(
                      context,
                      title: 'Producg Bulk Delete',
                      message:
                          'Are you sure you want to delete all selected products? This action is permanent and cannot be undone.',
                      onAction: () => context.read<ProductBulkBloc>().add(ProductBulkEvent.bulkDeleteProduct(ids)),
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
        builder: (context) => BlocConsumer<ProductBulkBloc, ProductBulkState>(
          listener: (context, state) {
            final shouldPop = state.maybeWhen(
              success: (_) => true,
              failure: (_) => true,
              orElse: () => false,
            );

            if (shouldPop) Navigator.pop(context);
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        UIButton.outlined('Cancel', onClick: () => Navigator.pop(context)),
                        const UIHorizontalSpace(8),
                        UIButton.filled(
                          message != null ? 'Confirm' : 'Save',
                          onClick: onAction,
                          style: message != null ? UIStyleButton.danger : null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
