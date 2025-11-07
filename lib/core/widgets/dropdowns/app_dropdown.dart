import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/lazy_list_bloc/lazy_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/query_params.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/shared/dropdown_list.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/shared/dropdown_lazy_list.dart';
import 'package:medglobal_admin_portal/core/widgets/overlay_builder.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

enum DropdownListType { lazy, static }

/// A reusable, generic dropdown widget designed for selection purposes
/// outside of form contexts, such as filters.
///
/// Supports both static lists and lazy-loaded lists of items.
class AppDropdown<T> extends StatefulWidget {
  const AppDropdown._({
    super.key,
    this.items,
    required this.hint,
    required this.getName,
    required this.onSelectItem,
    this.onRemoveSelectedItem,
    this.hasInlineLabel = false,
    this.inlineLabel,
    required this.type,
    this.isEnabled = true,
    this.value,
    this.filters,
    this.highlightOnSelect = true,
  });

  final DropdownListType type;
  final List<T>? items;
  final String hint;
  final String Function(T item) getName;
  final void Function(T item) onSelectItem;
  final VoidCallback? onRemoveSelectedItem;
  final bool hasInlineLabel;
  final String? inlineLabel;
  final bool isEnabled;
  final T? value;
  final FilterQuery? filters;

  /// Highlights the dropdown when an item is selected.
  ///
  /// Enabled by default for filter-style dropdowns. Set to `false`
  /// for input-style dropdowns where highlighting is not needed.
  final bool highlightOnSelect;

  factory AppDropdown.lazy({
    required String Function(T item) getName,
    required void Function(T item) onSelectItem,
    VoidCallback? onRemoveSelectedItem,
    required String hint,
    bool hasInlineLabel = false,
    String? inlineLabel,
    bool isEnabled = true,
    T? value,
    FilterQuery? filters,
    bool highlightOnSelect = true,
    Key? key,
  }) =>
      AppDropdown._(
        key: key,
        type: DropdownListType.lazy,
        hint: hint,
        getName: getName,
        onSelectItem: onSelectItem,
        onRemoveSelectedItem: onRemoveSelectedItem,
        hasInlineLabel: hasInlineLabel,
        inlineLabel: inlineLabel,
        isEnabled: isEnabled,
        value: value,
        filters: filters,
        highlightOnSelect: highlightOnSelect,
      );

  factory AppDropdown.static({
    required List<T> items,
    required String Function(T item) getName,
    required void Function(T item) onSelectItem,
    VoidCallback? onRemoveSelectedItem,
    required String hint,
    bool hasInlineLabel = false,
    String? inlineLabel,
    bool isEnabled = true,
    highlightOnSelect = true,
    T? value,
    Key? key,
  }) =>
      AppDropdown._(
        key: key,
        type: DropdownListType.static,
        items: items,
        hint: hint,
        getName: getName,
        onSelectItem: onSelectItem,
        onRemoveSelectedItem: onRemoveSelectedItem,
        hasInlineLabel: hasInlineLabel,
        inlineLabel: inlineLabel,
        isEnabled: isEnabled,
        value: value,
        highlightOnSelect: highlightOnSelect,
      );

  @override
  State<AppDropdown<T>> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
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
      if (lazyListBloc.state.items.isEmpty) lazyListBloc.add(LazyListEvent<T>.fetch(filters: widget.filters));
    }
  }

  @override
  void didUpdateWidget(covariant AppDropdown<T> oldWidget) {
    _setValue(widget.value);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return OverlayBuilder(
      target: _DropdownButton(
        menuKey: menuKey,
        hint: widget.hint,
        value: value == null ? null : widget.getName(value as T),
        onTap: () => setState(() => visible = true),
        onRemoveSelectedItem: widget.onRemoveSelectedItem == null
            ? null
            : () {
                _setValue(null);
                widget.onRemoveSelectedItem!();
              },
        hasInlineLabel: widget.hasInlineLabel,
        inlineLabel: widget.inlineLabel,
        isEnabled: widget.isEnabled,
        highlightOnSelect: widget.highlightOnSelect,
      ),
      follower: widget.type == DropdownListType.lazy
          ? DropdownLazyList<T>(
              menuKey: menuKey,
              onChanged: (T item) {
                widget.onSelectItem(item);
                _setValue(item);
                _hideDropdownList();
              },
              getName: widget.getName,
              filters: widget.filters,
            )
          : DropdownList<T>(
              items: widget.items!,
              menuKey: menuKey,
              onChanged: (T item) {
                widget.onSelectItem(item);
                _setValue(item);
                _hideDropdownList();
              },
              getName: (T item) => widget.getName(item),
            ),
      visible: visible,
      onClose: _hideDropdownList,
    );
  }

  void _setValue(T? item) => setState(() => value = item);

  void _hideDropdownList() => setState(() => visible = false);
}

class _DropdownButton<T> extends StatelessWidget {
  const _DropdownButton({
    super.key,
    required this.menuKey,
    required this.hint,
    required this.onTap,
    this.onRemoveSelectedItem,
    this.value,
    required this.hasInlineLabel,
    this.inlineLabel,
    required this.isEnabled,
    required this.highlightOnSelect,
  });

  final GlobalKey menuKey;
  final String hint;
  final VoidCallback onTap;
  final VoidCallback? onRemoveSelectedItem;
  final String? value;
  final bool hasInlineLabel;
  final String? inlineLabel;
  final bool isEnabled;
  final bool highlightOnSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: menuKey,
      hoverColor: UIColors.transparent,
      highlightColor: UIColors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      onTap: isEnabled ? onTap : null,
      child: HoverBuilder(
        builder: (isHover) {
          final highlight = value?.isNotEmpty == true && highlightOnSelect;
          return Container(
            constraints: const BoxConstraints(minWidth: 200),
            padding: const EdgeInsets.symmetric(vertical: 7.2, horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(color: UIColors.borderRegular),
              color: isEnabled
                  ? highlight
                      ? UIColors.secondary
                      : isHover
                          ? UIColors.whiteBg
                          : UIColors.background
                  : UIColors.borderMuted.withValues(alpha: 0.5),
              border: Border.all(
                color: highlight ? UIColors.primary.withValues(alpha: 0.2) : UIColors.borderRegular,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                hasInlineLabel == true
                    ? Text.rich(
                        TextSpan(
                          text: inlineLabel,
                          style: UIStyleText.labelMedium.copyWith(color: UIColors.textMuted),
                          children: [
                            TextSpan(
                              text: '     ${value ?? hint}',
                              style: (value != null ? UIStyleText.labelMedium : UIStyleText.hint).copyWith(
                                color: value != null
                                    ? highlightOnSelect
                                        ? UIColors.primary
                                        : UIColors.textRegular
                                    : UIColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Text(
                        value ?? hint,
                        style: UIStyleText.hint.copyWith(
                          color: value != null ? UIColors.textDark : UIColors.textMuted,
                        ),
                      ),
                const UIHorizontalSpace(10),
                value != null && onRemoveSelectedItem != null
                    ? SizedBox(
                        height: 18,
                        child: Material(
                          color: UIColors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () => onRemoveSelectedItem!(),
                            hoverColor: UIColors.borderRegular,
                            child: Assets.icons.close.svg(height: 22),
                          ),
                        ),
                      )
                    : Assets.icons.arrowDown.svg(height: 10)
              ],
            ),
          );
        },
      ),
    );
  }
}
