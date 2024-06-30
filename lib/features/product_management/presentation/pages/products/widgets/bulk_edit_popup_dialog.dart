import 'package:flutter/material.dart';
import '../../../../../../core/core.dart';
import 'bulk_edit_category_dropdown.dart';
import '../../../../domain/entities/category.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BulkEditPopupDialog extends StatefulWidget {
  const BulkEditPopupDialog({super.key});

  @override
  State<BulkEditPopupDialog> createState() => _BulkEditPropertyState();
}

class _BulkEditPropertyState extends State<BulkEditPopupDialog> with DialogMixin {
  final _hideCategory = true;
  bool _showPopup = false;
  Category? _category;

  @override
  Widget build(BuildContext context) {
    return UIPopupMenuOverlay(
      visible: _showPopup,
      menu: UIButton.text(
        'Edit',
        iconBuilder: (isHover) => Assets.icons.edit2.setColorOnHover(isHover),
        onClick: () => setState(() => _showPopup = true),
      ),
      body: GestureDetector(
        onTap: () => setState(() => _hideCategory),
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: UIColors.background,
            border: Border.all(color: UIColors.borderMuted),
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIText.heading6('Edit Property'),
              const UIVerticalSpace(4.0),
              UIText.subtitle(
                  'Bulk setting or removing a product property value. These actions will update all selected products at once.'),
              const UIVerticalSpace(24.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BulkEditCategoryDropdown(
                    hide: _hideCategory,
                    label: 'Category',
                    hint: 'Select category',
                    onSelect: (category) => setState(() => _category = category),
                  ),
                  const UIHorizontalSpace(8.0),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: UIOutlinedIconButton(
                      icon: Assets.icons.minus.svg(width: 16.0),
                      onTap: () {
                        setState(() => _hideCategory);
                        showConfirmationDialog(
                          context,
                          title: 'Remove category',
                          message: 'Are you sure you want to remove the category for all selected products?',
                          actionLabel: 'Remove',
                          onAction: () {
                            setState(() {
                              _showPopup = false;
                              _category = null;
                            });
                            // TODO: API remove category for selected products
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              const UIVerticalSpace(12.0),
              if (_category != null)
                Align(
                  alignment: Alignment.bottomRight,
                  child: UIButton.text(
                    'Apply',
                    onClick: () {
                      setState(() {
                        _showPopup = false;
                        _category = null;
                      });
                      // TODO: API bulk set category
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
      onClose: () => setState(() {
        _showPopup = false;
        _category = null;
      }),
    );
  }
}
