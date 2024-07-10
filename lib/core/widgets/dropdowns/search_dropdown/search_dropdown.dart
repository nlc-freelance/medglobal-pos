import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/search_dropdown/single_select_dropdown.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

enum DropdownType { single, multi }

class SearchDropdown<T> extends StatefulWidget {
  const SearchDropdown._({
    super.key,
    required this.type,
    required this.hint,
    required this.label,
    required this.itemAsString,
    required this.asyncItemsCallback,
    this.isRequired = false,
    this.isLeftLabel = false,
    this.showSelectedItems = true,
    this.selectedItem,
    this.selectedItems,
    this.onSelectItem,
    this.onSelectItems,
    this.validator,
  });

  final DropdownType type;
  final String hint;
  final String label;
  final bool isRequired;
  final bool isLeftLabel;
  final bool showSelectedItems;
  final String Function(T item) itemAsString;
  final Future<List<T>> asyncItemsCallback;
  final Function(T value)? onSelectItem;
  final Function(List<T> value)? onSelectItems;
  final T? selectedItem;
  final List<T>? selectedItems;
  final String? Function(List<T>?)? validator;

  factory SearchDropdown.multi({
    required String hint,
    required String label,
    required String Function(T item) itemAsString,
    required Future<List<T>> asyncItemsCallback,
    required Function(List<T> value)? onSelectItems,
    bool isRequired = false,
    bool showSelectedItems = true,
    List<T>? selectedItems,
    String? Function(List<T>?)? validator,
  }) =>
      SearchDropdown._(
        type: DropdownType.multi,
        hint: hint,
        label: label,
        itemAsString: itemAsString,
        asyncItemsCallback: asyncItemsCallback,
        showSelectedItems: showSelectedItems,
        onSelectItems: onSelectItems,
        selectedItems: selectedItems,
        isRequired: isRequired,
        validator: validator,
      );

  factory SearchDropdown.single({
    required String hint,
    required String label,
    required String Function(T item) itemAsString,
    required Future<List<T>> asyncItemsCallback,
    required Function(T value) onSelectItem,
    bool isRequired = false,
    bool isLeftLabel = false,
    T? selectedItem,
  }) =>
      SearchDropdown._(
        type: DropdownType.single,
        hint: hint,
        label: label,
        isRequired: isRequired,
        isLeftLabel: isLeftLabel,
        itemAsString: itemAsString,
        asyncItemsCallback: asyncItemsCallback,
        onSelectItem: onSelectItem,
        selectedItem: selectedItem,
      );

  @override
  State<SearchDropdown<T>> createState() => _SearchDropdownState<T>();
}

class _SearchDropdownState<T> extends State<SearchDropdown<T>> {
  List<T> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    if (widget.selectedItems != null) setState(() => _selectedItems = widget.selectedItems!);
  }

  @override
  void didUpdateWidget(covariant SearchDropdown<T> oldWidget) {
    if (widget.selectedItems != null) setState(() => _selectedItems = widget.selectedItems!);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: widget.isLeftLabel ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: widget.isLeftLabel ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const UIVerticalSpace(2),
        Row(
          children: [
            widget.isLeftLabel ? UIText.labelMedium(widget.label) : UIText.labelRegular(widget.label),
            if (widget.isRequired) ...[
              const UIHorizontalSpace(2.0),
              UIText.labelMedium('*', color: UIColors.accent),
            ]
          ],
        ),
        if (widget.isLeftLabel) const UIHorizontalSpace(30.0),
        if (!widget.isLeftLabel) const UIVerticalSpace(4),
        widget.type == DropdownType.single
            ? widget.isLeftLabel
                ? Expanded(
                    child: SingleSelectDropdown(
                    label: widget.label,
                    hint: widget.hint,
                    itemAsString: widget.itemAsString,
                    asyncItemsCallback: widget.asyncItemsCallback,
                    onSelectItem: widget.onSelectItem!,
                    selectedItem: widget.selectedItem,
                  ))
                : SingleSelectDropdown(
                    label: widget.label,
                    hint: widget.hint,
                    itemAsString: widget.itemAsString,
                    asyncItemsCallback: widget.asyncItemsCallback,
                    onSelectItem: widget.onSelectItem!,
                    selectedItem: widget.selectedItem,
                  )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownSearch<T>.multiSelection(
                    asyncItems: (_) async => await widget.asyncItemsCallback,
                    itemAsString: (item) => widget.itemAsString(item),
                    compareFn: (item1, item2) => item1 == item2,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: widget.validator,
                    popupProps: PopupPropsMultiSelection.menu(
                      showSearchBox: true,
                      fit: FlexFit.loose,
                      constraints: const BoxConstraints(maxHeight: 240),
                      // Local search, change if going to search via API request
                      searchDelay: const Duration(milliseconds: 0),
                      itemBuilder: (context, item, isSelected) => ListTile(
                        dense: true,
                        title: Text(widget.itemAsString(item), style: UIStyleText.chip),
                      ),
                      menuProps: const MenuProps(elevation: 1),
                      selectionWidget: (context, item, isSelected) => Checkbox(
                        value: isSelected ||
                            _selectedItems.any((value) => widget.itemAsString(value) == widget.itemAsString(item)),
                        onChanged: (_) => {},
                      ),
                      validationWidgetBuilder: (context, items) => UIButton.filled(
                        'Select item(s)',
                        onClick: () {
                          for (var item in items) {
                            if (!_selectedItems.contains(item)) setState(() => _selectedItems.add(item));
                          }
                          widget.onSelectItems!(_selectedItems);
                          Navigator.pop(context);
                        },
                      ),
                      searchFieldProps: TextFieldProps(
                        cursorHeight: 15,
                        style: UIStyleText.bodyRegular,
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          // constraints: BoxConstraints(maxHeight: 38),
                        ),
                      ),
                      loadingBuilder: (context, _) =>
                          const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)),
                      errorBuilder: (context, error, _) => const Center(child: Text('Something went wrong.')),
                      emptyBuilder: (context, _) => const Center(child: Text('No items found.')),
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        hintText: widget.hint,
                        // constraints: const BoxConstraints(maxHeight: 38),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: UIColors.borderRegular),
                        ),
                      ),
                    ),
                    dropdownButtonProps: DropdownButtonProps(
                      icon: Assets.icons.arrowDown.setSize(12),
                      // icon: Icon(Icons.keyboard_arrow_down, size: 16),
                    ),
                  ),
                  const UIVerticalSpace(8),
                  if (widget.showSelectedItems)
                    Wrap(
                      direction: Axis.horizontal,
                      runSpacing: 6,
                      spacing: 4,
                      children: _selectedItems
                          .map(
                            (item) => Chip(
                              label: Text(widget.itemAsString(item), style: UIStyleText.chip),
                              backgroundColor: UIColors.whiteBg,
                              deleteIcon: Assets.icons.close.svg(),
                              onDeleted: () => setState(() => _selectedItems.removeAt(_selectedItems.indexOf(item))),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(color: UIColors.borderMuted, width: 0.8),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                ],
              ),
      ],
    );
  }
}
