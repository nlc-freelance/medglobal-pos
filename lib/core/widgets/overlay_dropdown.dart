import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/category.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class OverlayCategoryDropdown extends StatefulWidget {
  const OverlayCategoryDropdown({
    super.key,
    required this.hide,
    required this.label,
    required this.hint,
    required this.categories,
    required this.onSelect,
  });

  final bool hide;
  final String label;
  final String hint;
  final List<Category> categories;
  final void Function(Category category) onSelect;

  @override
  State<OverlayCategoryDropdown> createState() => _DropdownCategoryState();
}

class _DropdownCategoryState extends State<OverlayCategoryDropdown> {
  bool _showDropdown = false;
  Category? _selectedCategory;

  @override
  void initState() {
    super.initState();
    // context.read<ProductSelectionCubit>().resetCategory();
  }

  @override
  void didUpdateWidget(covariant OverlayCategoryDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    _showDropdown = false;
  }

  @override
  Widget build(BuildContext context) {
    // final category = context.select((ProductSelectionCubit cubit) => cubit.state.category);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        UIText.labelRegular(widget.label),
        const UIVerticalSpace(4.0),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: UIColors.borderMuted),
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          width: 260,
          child: ListTile(
            onTap: () => setState(() => _showDropdown = !_showDropdown),
            title: _selectedCategory != null
                ? UIText.bodyRegular(_selectedCategory!.name)
                : Text(widget.hint, style: UIStyleText.hint),
            trailing: Assets.icons.arrowDown.svg(width: 12.0, colorFilter: UIColors.textRegular.toColorFilter),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
            dense: true,
            visualDensity: VisualDensity.compact,
          ),
        ),
        if (_showDropdown)
          Container(
            constraints: const BoxConstraints(maxHeight: 180, maxWidth: 260.0),
            margin: const EdgeInsets.only(top: 4.0),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: UIColors.borderMuted),
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            ),
            child: Material(
              type: MaterialType.transparency,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.label == 'Category')
                      ListTile(
                        onTap: () {
                          setState(() => _showDropdown = !_showDropdown);
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => Dialog(
                              shape:
                                  const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.35,
                                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        UIText.heading6('Add new category'),
                                        InkWell(onTap: () => Navigator.pop(context), child: Assets.icons.close.svg()),
                                      ],
                                    ),
                                    const Divider(color: UIColors.borderMuted),
                                    const UIVerticalSpace(16.0),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: UITextField.noLabel(
                                            hint: 'Enter category name',
                                            width: MediaQuery.sizeOf(context).width * 0.35,
                                            controller: TextEditingController(),
                                          ),
                                        ),
                                        const UIHorizontalSpace(8),
                                        UIButton.filled('Add', onClick: () {
                                          // TODO: Add new category and set it as selected
                                          Navigator.pop(context);
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        leading: Assets.icons.add.svg(width: 12.0, colorFilter: UIColors.primary.toColorFilter),
                        title: UIText.labelSemiBold('Add new category', color: UIColors.primary),
                        minLeadingWidth: 2.0,
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                        visualDensity: VisualDensity.compact,
                      ),
                    ...widget.categories.map(
                      (category) => ListTile(
                        onTap: () {
                          widget.onSelect(category);
                          // context.read<ProductSelectionCubit>().setCategory(category);
                          setState(() {
                            _showDropdown = !_showDropdown;
                            _selectedCategory = category;
                          });
                        },
                        title: UIText.bodyRegular(category.name),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                        dense: true,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}
