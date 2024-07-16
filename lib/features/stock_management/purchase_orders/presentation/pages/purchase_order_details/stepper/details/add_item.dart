import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/search_dropdown.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/features/supplier_management/domain/repositories/supplier_repository.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key, required this.onSelectItems});

  final void Function(List<Supplier> value) onSelectItems;

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return UIButton.text(
      'Add item',
      iconBuilder: (isHover) => Assets.icons.add.setColorOnHover(isHover),
      onClick: () {
        // Show Dialog with dropdown fetching the products available from the current supplier PO
        // Add the variant to the data source
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            List<Supplier>? _selectedItems;

            return Dialog(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: StatefulBuilder(
                builder: (context, setState) => Container(
                  width: MediaQuery.sizeOf(context).width * 0.35,
                  color: UIColors.background,
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIText.heading6('Add products'),
                      const Divider(color: UIColors.borderMuted),

                      /// Replace with product/variant type
                      SearchDropdown<Supplier>.multi(
                        hint: 'Select products to add',
                        label: '',
                        itemAsString: (product) => product.name,
                        asyncItemsCallback: GetIt.I<SupplierRepository>().getAllSuppliers(),
                        onSelectItems: (product) => setState(() => _selectedItems = product),
                      ),
                      const UIVerticalSpace(30),
                      if (_selectedItems != null)
                        CancelActionButton(
                          actionLabel: 'Add',
                          onCancel: () => Navigator.pop(context),
                          onAction: () {
                            widget.onSelectItems(_selectedItems!);
                            Navigator.pop(context);
                          },
                        ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
