import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class Dropdown<T> extends StatelessWidget {
  const Dropdown({
    super.key,
    required this.hint,
    required this.label,
    required this.itemAsString,
    required this.items,
    required this.onSelectItem,
    this.selectedItem,
  });

  final String hint;
  final String label;
  final String Function(T item) itemAsString;
  final List<T> items;
  final Function(T value) onSelectItem;
  final T? selectedItem;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIText.labelRegular(label),
          const UIVerticalSpace(4),
          DropdownSearch<T>(
            items: items,
            itemAsString: (item) => itemAsString(item),
            onChanged: (value) => onSelectItem(value as T),
            selectedItem: selectedItem,
            popupProps: PopupProps.menu(
              showSearchBox: false,
              fit: FlexFit.loose,
              menuProps: const MenuProps(elevation: 1),
              constraints: const BoxConstraints(maxHeight: 210),
              // Local search, change if going to search via API request
              searchDelay: const Duration(milliseconds: 0),
              itemBuilder: (context, item, isSelected) => ListTile(
                dense: true,
                // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                title: Text(itemAsString(item), style: UIStyleText.chip),
              ),
            ),
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: UIStyleText.chip,
              dropdownSearchDecoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                hintText: hint,
                constraints: const BoxConstraints(maxHeight: 38),
                filled: true,
                fillColor: UIColors.background,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: UIColors.borderRegular),
                ),
              ),
            ),
            dropdownButtonProps: DropdownButtonProps(
              icon: Assets.icons.arrowDown.setSize(12),
            ),
          ),
        ],
      );
}
