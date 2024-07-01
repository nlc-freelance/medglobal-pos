import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SingleSelectDropdown<T> extends StatelessWidget {
  const SingleSelectDropdown({
    super.key,
    required this.hint,
    required this.label,
    required this.itemAsString,
    required this.asyncItemsCallback,
  });

  final String hint;
  final String label;
  final String Function(T item) itemAsString;
  final Future<List<T>> asyncItemsCallback;

  @override
  Widget build(BuildContext context) => DropdownSearch<T>(
        asyncItems: (_) async => await asyncItemsCallback,
        itemAsString: (item) => itemAsString(item),
        onChanged: (value) {},
        popupProps: PopupProps.menu(
          showSearchBox: true,
          fit: FlexFit.loose,
          menuProps: const MenuProps(elevation: 1),
          constraints: const BoxConstraints.tightFor(height: 210),
          searchDelay: const Duration(milliseconds: 1), // search via API request
          itemBuilder: (context, item, isSelected) => ListTile(
            dense: true,
            title: Text(itemAsString(item), style: UIStyleText.chip),
          ),
          searchFieldProps: TextFieldProps(
            cursorHeight: 15,
            style: UIStyleText.chip,
            decoration: const InputDecoration(
              hintText: 'Search',
              constraints: BoxConstraints(maxHeight: 38),
            ),
          ),
          loadingBuilder: (context, _) =>
              const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)),
          errorBuilder: (context, error, _) => const Center(child: Text('Something went wrong.')),
          emptyBuilder: (context, _) => const Center(child: Text('No items found.')),
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
        dropdownButtonProps: const DropdownButtonProps(
          icon: Icon(Icons.keyboard_arrow_down, size: 16),
        ),
      );
}
