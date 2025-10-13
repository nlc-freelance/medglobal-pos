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
    this.showProminentHint = false,
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
    this.onRemoveAllFromMultiSelect,
    this.isSelectedInMultiSelect,
  });

  final DropdownListType type;
  final List<T>? items;
  final String label;
  final LabelPosition labelPosition;
  final String hint;
  final bool showProminentHint;
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
  final VoidCallback? onRemoveAllFromMultiSelect;
  final bool Function(T item)? isSelectedInMultiSelect;

  factory AppDropdownFormField.lazy({
    LabelPosition labelPosition = LabelPosition.top,
    required String label,
    required String hint,
    bool showProminentHint = false,
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
    VoidCallback? onRemoveAllFromMultiSelect,
    bool Function(T item)? isSelectedInMultiSelect,
  }) {
    return AppDropdownFormField<T>._(
      type: DropdownListType.lazy,
      label: label,
      labelPosition: labelPosition,
      hint: hint,
      showProminentHint: showProminentHint,
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
      onRemoveAllFromMultiSelect: onRemoveAllFromMultiSelect,
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
    return widget.labelPosition == LabelPosition.top
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _FormLabel(
                label: widget.label,
                isRequired: widget.isRequired,
                textStyle: UIStyleText.labelRegular.copyWith(fontSize: 11),
              ),
              const UIVerticalSpace(6),
              _buildFormField(),
            ],
          )
        : LayoutBuilder(builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth > 1000 ? 650 : constraints.maxWidth,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _FormLabel(
                      label: widget.label,
                      isRequired: widget.isRequired,
                      textStyle: UIStyleText.labelMedium,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: _buildFormField(),
                  ),
                ],
              ),
            );
          });
  }

  void _setValue(T? item) => setState(() => value = item);

  void _onShowDropdownList() => widget.isReadOnly ? {} : setState(() => visible = true);

  void _hideDropdownList() => setState(() => visible = false);

  Widget _buildFormField() {
    return _FormField(
      onTap: _onShowDropdownList,
      target: widget.isMultiSelect
          ? _MultiSelectDropdownContainer<T>(
              menuKey: menuKey,
              hint: widget.hint,
              showProminentHint: widget.showProminentHint,
              values: widget.selectedItems,
              getName: (item) => widget.getName(item),
              onRemove: widget.onRemoveFromMultiSelect,
              onRemoveAll: widget.onRemoveAllFromMultiSelect,
              showSelectedItems: widget.showSelectedItems,
            )
          : _SingleSelectDropdownContainer(
              menuKey: menuKey,
              value: value == null ? null : widget.getName(value as T),
              hint: widget.hint,
              isReadOnly: widget.isReadOnly,
              showSelectedItem: widget.showSelectedItem,
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
}

class _FormLabel extends StatelessWidget {
  const _FormLabel({
    required this.label,
    required this.isRequired,
    required this.textStyle,
  });

  final String label;
  final bool isRequired;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: label,
        style: textStyle,
        children: [
          if (isRequired)
            TextSpan(
              text: ' *',
              style: textStyle.copyWith(color: Colors.red),
            ),
        ],
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.onTap,
    required this.target,
    required this.follower,
    required this.visible,
    required this.onClose,
    this.anchor,
  });

  final VoidCallback onTap;
  final Widget target;
  final Widget follower;
  final bool visible;
  final Anchor? anchor;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: OverlayBuilder(
        target: target,
        follower: follower,
        visible: visible,
        anchor: anchor,
        onClose: onClose,
      ),
    );
  }
}

class _SingleSelectDropdownContainer extends StatelessWidget {
  const _SingleSelectDropdownContainer({
    required this.menuKey,
    required this.hint,
    required this.isReadOnly,
    required this.value,
    this.showSelectedItem = true,
  });

  final GlobalKey menuKey;
  final String hint;
  final bool isReadOnly;
  final String? value;
  final bool showSelectedItem;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: menuKey,
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
        fillColor: UIColors.borderMuted.withValues(alpha: isReadOnly ? 0.5 : 0.15),
        filled: true,
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: UIColors.borderRegular),
        ),
      ),
    );
  }
}

class _MultiSelectDropdownContainer<T> extends StatelessWidget {
  const _MultiSelectDropdownContainer({
    super.key,
    required this.menuKey,
    required this.hint,
    this.showProminentHint = false,
    required this.values,
    required this.getName,
    required this.onRemove,
    this.onRemoveAll,
    required this.showSelectedItems,
  });

  final GlobalKey menuKey;
  final String hint;
  final bool showProminentHint;
  final List<T>? values;
  final String Function(T item) getName;
  final void Function(T item)? onRemove;
  final VoidCallback? onRemoveAll;
  final bool showSelectedItems;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        key: menuKey,
        constraints: const BoxConstraints(minHeight: 42.5),
        width: double.infinity,
        padding: values?.isNotEmpty == true && showSelectedItems
            ? const EdgeInsets.fromLTRB(4, 4, 12, 4)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: UIColors.borderMuted.withValues(alpha: 0.15),
          border: Border.all(color: UIColors.borderRegular.withValues(alpha: 0.75)),
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
                    style: UIStyleText.hint.copyWith(
                      color: showProminentHint ? UIColors.textRegular : UIColors.textMuted,
                    ),
                  ),
            values?.isNotEmpty == true && onRemoveAll != null
                ? InkWell(
                    onTap: onRemoveAll,
                    borderRadius: BorderRadius.circular(16),
                    child: Assets.icons.close.svg(),
                  )
                : Assets.icons.arrowDown.svg(),
          ],
        ),
      ),
    );
  }
}
