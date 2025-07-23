import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/app_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/shared/dropdown_list.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/shared/dropdown_lazy_list.dart';
import 'package:medglobal_admin_portal/core/widgets/overlay_builder.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

enum LabelPosition { top, left }

/// A reusable, generic dropdown widget designed for use within forms,
/// with support for both single and multi-select modes.
///
/// Supports both static lists and lazy-loaded lists of items.
///
/// Additionally, it supports customizable label layout alignment (label left or right),
/// and configurable states such as editable or read-only.
class AppDropdownFormField<T> extends StatefulWidget {
  const AppDropdownFormField._({
    super.key,
    required this.type,
    this.items,
    required this.label,
    required this.labelPosition,
    required this.hint,
    this.isRequired = false,
    this.isReadOnly = false,
    this.value,
    required this.onChanged,
    required this.getName,
    this.anchor,
    this.showSelectedItem = true,
    this.isMultiSelect = false,
    this.showSelectedItems = true,
    this.selectedItems,
    this.onRemoveFromMultiSelect,
    this.isSelectedInMultiSelect,
  });

  final DropdownListType type;
  final List<T>? items;
  final String label;
  final LabelPosition labelPosition;
  final String hint;
  final bool isRequired;
  final bool isReadOnly;
  final T? value;
  final String Function(T item) getName;
  final void Function(T item) onChanged;
  final Anchor? anchor;

  // SingleSelect
  final bool showSelectedItem;

  // MultiSelect
  final bool isMultiSelect;
  final bool showSelectedItems;
  final List<T>? selectedItems;
  final void Function(T item)? onRemoveFromMultiSelect;
  final bool Function(T item)? isSelectedInMultiSelect;

  factory AppDropdownFormField.lazy({
    LabelPosition labelPosition = LabelPosition.top,
    required String label,
    required String hint,
    bool isRequired = false,
    bool isReadOnly = false,
    T? value,
    required String Function(T item) getName,
    required void Function(T item) onChanged,
    Anchor? anchor,
    bool showSelectedItem = true,
    bool isMultiSelect = false,
    bool showSelectedItems = true,
    List<T>? selectedItems,
    void Function(T item)? onRemoveFromMultiSelect,
    bool Function(T item)? isSelectedInMultiSelect,
  }) {
    return AppDropdownFormField<T>._(
      type: DropdownListType.lazy,
      label: label,
      labelPosition: labelPosition,
      hint: hint,
      isRequired: isRequired,
      isReadOnly: isReadOnly,
      value: value,
      getName: getName,
      onChanged: onChanged,
      anchor: anchor,
      showSelectedItem: showSelectedItem,
      isMultiSelect: isMultiSelect,
      showSelectedItems: showSelectedItems,
      selectedItems: selectedItems,
      onRemoveFromMultiSelect: onRemoveFromMultiSelect,
      isSelectedInMultiSelect: isSelectedInMultiSelect,
    );
  }

  factory AppDropdownFormField.static({
    LabelPosition labelPosition = LabelPosition.top,
    required List<T> items,
    required String label,
    required String hint,
    bool isMultiSelect = false,
    bool showSelectedItems = false,
    List<T>? selectedItems,
    bool isRequired = false,
    bool isReadOnly = false,
    T? value,
    required String Function(T item) getName,
    required void Function(T item) onChanged,
    Anchor? anchor,
    void Function(T item)? onRemoveFromMultiSelect,
    bool Function(T item)? isSelectedInMultiSelect,
  }) {
    return AppDropdownFormField<T>._(
      type: DropdownListType.static,
      items: items,
      label: label,
      labelPosition: LabelPosition.top,
      hint: hint,
      isRequired: isRequired,
      isReadOnly: isReadOnly,
      value: value,
      getName: getName,
      onChanged: onChanged,
      anchor: anchor,
      isMultiSelect: isMultiSelect,
      showSelectedItems: showSelectedItems,
      selectedItems: selectedItems,
      onRemoveFromMultiSelect: onRemoveFromMultiSelect,
      isSelectedInMultiSelect: isSelectedInMultiSelect,
    );
  }

  @override
  State<AppDropdownFormField<T>> createState() => _DropdownFormFieldState<T>();
}

class _DropdownFormFieldState<T> extends State<AppDropdownFormField<T>> {
  final GlobalKey menuKey = GlobalKey();

  bool visible = false;
  T? value;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) _setValue(widget.value);

    /// If the dropdown is lazy-loaded and the items list is empty,
    /// trigger a fetch event to load the initial data.
    if (widget.type == DropdownListType.lazy) {
      final lazyListBloc = context.read<LazyListBloc<T>>();
      if (lazyListBloc.state.items.isEmpty) lazyListBloc.add(LazyListEvent<T>.fetch());
    }
  }

  @override
  void didUpdateWidget(covariant AppDropdownFormField<T> oldWidget) {
    _setValue(widget.value);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return OverlayBuilder(
      target: _DropdownLabelFormField(
        menuKey: menuKey,
        label: widget.label,
        labelPosition: widget.labelPosition,
        isRequired: widget.isRequired,
        onTap: () => widget.isReadOnly ? {} : setState(() => visible = true),
        child: widget.isMultiSelect
            ? _MutliSelectDropdownContainer<T>(
                hint: widget.hint,
                values: widget.selectedItems,
                getName: (item) => widget.getName(item),
                onRemove: widget.onRemoveFromMultiSelect,
                showSelectedItems: widget.showSelectedItems,
              )
            : _SingleSelectDropdownContainer(
                value: value == null ? null : widget.getName(value as T),
                hint: widget.hint,
                isReadOnly: widget.isReadOnly,
                showSelectedItem: widget.showSelectedItem,
              ),
      ),
      follower: widget.type == DropdownListType.lazy
          ? DropdownLazyList<T>(
              menuKey: menuKey,
              onChanged: (T item) {
                widget.onChanged(item);
                _setValue(item);
                if (!widget.isMultiSelect) _hideDropdownList();
              },
              getName: (T item) => widget.getName(item),
              isMultiSelect: widget.isMultiSelect,
              isSelected: widget.isSelectedInMultiSelect,
            )
          : DropdownList<T>(
              items: widget.items!,
              menuKey: menuKey,
              onChanged: (T item) {
                widget.onChanged(item);
                _setValue(item);
                _hideDropdownList();
              },
              getName: (T item) => widget.getName(item),
            ),
      visible: visible,
      anchor: widget.anchor,
      onClose: _hideDropdownList,
    );
  }

  void _setValue(T? item) => setState(() => value = item);

  void _hideDropdownList() => setState(() => visible = false);
}

class _DropdownLabelFormField extends StatelessWidget {
  const _DropdownLabelFormField({
    super.key,
    required this.menuKey,
    required this.label,
    required this.labelPosition,
    required this.isRequired,
    required this.onTap,
    required this.child,
  });

  final GlobalKey menuKey;
  final String label;
  final LabelPosition labelPosition;
  final bool isRequired;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final field = InkWell(
      key: menuKey,
      hoverColor: UIColors.transparent,
      highlightColor: UIColors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      onTap: onTap,
      child: child,
    );

    return Flex(
      direction: labelPosition == LabelPosition.top ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: labelPosition == LabelPosition.top ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text.rich(
            TextSpan(
              text: label,
              style: UIStyleText.labelRegular.copyWith(fontSize: 11),
              children: [
                if (isRequired)
                  TextSpan(
                    text: ' *',
                    style: UIStyleText.labelRegular.copyWith(color: Colors.red),
                  ),
              ],
            ),
          ),
        ),
        labelPosition == LabelPosition.left ? Expanded(child: field) : field,
      ],
    );
  }
}

class _SingleSelectDropdownContainer extends StatelessWidget {
  const _SingleSelectDropdownContainer({
    super.key,
    required this.hint,
    required this.isReadOnly,
    required this.value,
    this.showSelectedItem = true,
  });

  final String hint;
  final bool isReadOnly;
  final String? value;
  final bool showSelectedItem;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      enabled: false,
      controller: TextEditingController(text: showSelectedItem ? value : null),
      mouseCursor: isReadOnly ? null : SystemMouseCursors.click,
      showCursor: false,
      style: UIStyleText.chip.copyWith(color: UIColors.textDark),
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: isReadOnly
            ? Assets.icons.lock.svg(colorFilter: UIColors.textMuted.toColorFilter)
            : Assets.icons.arrowDown.svg(),
        suffixIconConstraints: const BoxConstraints.tightFor(width: 48, height: 12),
        fillColor: UIColors.borderMuted.withOpacity(isReadOnly ? 0.5 : 0.15),
        filled: true,
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: UIColors.borderRegular),
        ),
      ),
    );
  }
}

class _MutliSelectDropdownContainer<T> extends StatelessWidget {
  const _MutliSelectDropdownContainer({
    super.key,
    required this.hint,
    required this.values,
    required this.getName,
    required this.onRemove,
    required this.showSelectedItems,
  });

  final String hint;
  final List<T>? values;
  final String Function(T item) getName;
  final void Function(T item)? onRemove;
  final bool showSelectedItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 42.5),
      width: double.infinity,
      padding: values?.isNotEmpty == true && showSelectedItems
          ? const EdgeInsets.fromLTRB(4, 4, 16, 4)
          : const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: UIColors.borderMuted.withOpacity(0.15),
        border: Border.all(color: UIColors.borderRegular.withOpacity(0.75)),
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          values?.isNotEmpty == true && showSelectedItems
              ? Expanded(
                  child: Wrap(
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.center,
                    runSpacing: 6,
                    spacing: 4,
                    children: values!
                        .map(
                          (item) => Chip(
                            label: Text(getName(item), style: UIStyleText.chip),
                            backgroundColor: UIColors.whiteBg,
                            deleteIcon: onRemove != null ? Assets.icons.close.svg() : const SizedBox.shrink(),
                            onDeleted: onRemove != null ? () => onRemove!(item) : () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: UIColors.borderMuted, width: 0.8),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              : Text(
                  hint,
                  style: UIStyleText.chip.copyWith(color: UIColors.textMuted),
                ),
          Assets.icons.arrowDown.svg(),
        ],
      ),
    );
  }
}
