import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
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
    required this.items,
    required this.hint,
    required this.getName,
    required this.onSelectItem,
    required this.onRemoveSelectedItem,
    this.hasInlineLabel = false,
    this.inlineLabel,
    required this.type,
  });

  final DropdownListType type;
  final List<T> items;
  final String hint;
  final String Function(T item) getName;
  final void Function(T item) onSelectItem;
  final VoidCallback onRemoveSelectedItem;
  final bool hasInlineLabel;
  final String? inlineLabel;

  factory AppDropdown.lazy({
    required List<T> items,
    required String Function(T item) getName,
    required void Function(T item) onSelectItem,
    required VoidCallback onRemoveSelectedItem,
    required String hint,
    bool hasInlineLabel = false,
    String? inlineLabel,
    Key? key,
  }) =>
      AppDropdown._(
        key: key,
        type: DropdownListType.lazy,
        items: items,
        hint: hint,
        getName: getName,
        onSelectItem: onSelectItem,
        onRemoveSelectedItem: onRemoveSelectedItem,
        hasInlineLabel: hasInlineLabel,
        inlineLabel: inlineLabel,
      );

  factory AppDropdown.static({
    required List<T> items,
    required String Function(T item) getName,
    required void Function(T item) onSelectItem,
    required VoidCallback onRemoveSelectedItem,
    required String hint,
    bool hasInlineLabel = false,
    String? inlineLabel,
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
      );

  @override
  State<AppDropdown<T>> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
  final GlobalKey menuKey = GlobalKey();

  bool visible = false;
  T? value;

  @override
  Widget build(BuildContext context) {
    return OverlayBuilder(
      target: _DropdownButton(
        menuKey: menuKey,
        hint: widget.hint,
        value: value == null ? null : widget.getName(value as T),
        onTap: () => setState(() => visible = true),
        onRemoveSelectedItem: () {
          _setValue(null);
          widget.onRemoveSelectedItem();
        },
        hasInlineLabel: widget.hasInlineLabel,
        inlineLabel: widget.inlineLabel,
      ),
      follower: widget.type == DropdownListType.lazy
          ? DropdownLazyList<T>(
              menuKey: menuKey,
              onChanged: widget.onSelectItem,
              getName: widget.getName,
            )
          : DropdownList<T>(
              items: widget.items,
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
    required this.onRemoveSelectedItem,
    this.value,
    this.hasInlineLabel = false,
    this.inlineLabel,
  });

  final GlobalKey menuKey;
  final String hint;
  final VoidCallback onTap;
  final VoidCallback onRemoveSelectedItem;
  final String? value;
  final bool hasInlineLabel;
  final String? inlineLabel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: menuKey,
      hoverColor: UIColors.transparent,
      highlightColor: UIColors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      onTap: onTap,
      child: HoverBuilder(
        builder: (isHover) {
          final highlight = value?.isNotEmpty == true;
          return Container(
            constraints: const BoxConstraints(minWidth: 180),
            padding: const EdgeInsets.symmetric(vertical: 7.2, horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: highlight
                  ? UIColors.secondary
                  : isHover
                      ? UIColors.whiteBg
                      : UIColors.background,
              border: Border.all(
                color: highlight ? UIColors.primary.withOpacity(0.2) : UIColors.borderRegular,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                hasInlineLabel == true
                    ? Text.rich(
                        TextSpan(
                          text: inlineLabel,
                          style: UIStyleText.labelMedium.copyWith(color: UIColors.textMuted),
                          children: [
                            TextSpan(
                              text: '  ${value ?? hint}',
                              style: UIStyleText.labelMedium.copyWith(
                                color: value != null ? UIColors.primary : UIColors.textLight,
                              ),
                            ),
                          ],
                        ),
                      )
                    : UIText.labelMedium(
                        value ?? hint,
                        color: value != null ? UIColors.primary : UIColors.textLight,
                      ),
                const UIHorizontalSpace(10),
                value != null
                    ? SizedBox(
                        height: 18,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () => onRemoveSelectedItem(),
                          child: Assets.icons.close.svg(height: 22),
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
