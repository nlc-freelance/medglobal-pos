import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medglobal_admin_portal/core/widgets/form/app_dropdown_form_field/dropdown_items.dart';
import 'package:medglobal_admin_portal/core/widgets/overlay_builder.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

enum LabelPosition { top, left }

class DropdownFormField<T> extends StatefulWidget {
  const DropdownFormField._({
    super.key,
    required this.label,
    required this.labelPosition,
    required this.hint,
    this.isRequired = false,
    this.value,
    required this.onChanged,
    required this.getName,
    this.anchor,
  });

  final String label;
  final LabelPosition labelPosition;
  final String hint;
  final bool isRequired;
  final T? value;
  final String Function(T item) getName;
  final void Function(T item) onChanged;
  final Anchor? anchor;

  factory DropdownFormField.labelTop({
    required String label,
    required String hint,
    bool isRequired = false,
    T? value,
    required String Function(T item) getName,
    required void Function(T item) onChanged,
    Anchor? anchor,
  }) {
    return DropdownFormField<T>._(
      label: label,
      labelPosition: LabelPosition.top,
      hint: hint,
      isRequired: isRequired,
      value: value,
      getName: getName,
      onChanged: onChanged,
      anchor: anchor,
    );
  }

  factory DropdownFormField.labelLeft({
    required String label,
    required String hint,
    bool isRequired = false,
    T? value,
    required String Function(T item) getName,
    required void Function(T item) onChanged,
    Anchor? anchor,
  }) {
    return DropdownFormField<T>._(
      label: label,
      labelPosition: LabelPosition.top,
      hint: hint,
      isRequired: isRequired,
      value: value,
      getName: getName,
      onChanged: onChanged,
      anchor: anchor,
    );
  }

  @override
  State<DropdownFormField<T>> createState() => _DropdownFormFieldState<T>();
}

class _DropdownFormFieldState<T> extends State<DropdownFormField<T>> {
  final GlobalKey menuKey = GlobalKey();

  bool visible = false;
  T? value;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) _setValue(widget.value);
  }

  @override
  void didUpdateWidget(covariant DropdownFormField<T> oldWidget) {
    if (widget.value != null) _setValue(widget.value);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return OverlayBuilder(
      target: DropdownField(
        menuKey: menuKey,
        label: widget.label,
        labelPosition: widget.labelPosition,
        hint: widget.hint,
        isRequired: widget.isRequired,
        value: value == null ? null : widget.getName(value as T),
        onTap: () => setState(() => visible = true),
      ),
      follower: DropdownItems<T>(
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

class DropdownField<T> extends StatelessWidget {
  const DropdownField({
    super.key,
    required this.menuKey,
    required this.label,
    required this.labelPosition,
    required this.hint,
    required this.isRequired,
    this.value,
    required this.onTap,
  });

  final GlobalKey menuKey;
  final String label;
  final LabelPosition labelPosition;
  final String hint;
  final bool isRequired;
  final String? value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final field = InkWell(
      key: menuKey,
      hoverColor: UIColors.transparent,
      highlightColor: UIColors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      onTap: onTap,
      child: TextFormField(
        readOnly: true,
        enabled: false,
        controller: TextEditingController(text: value),
        mouseCursor: SystemMouseCursors.click,
        showCursor: false,
        style: UIStyleText.chip.copyWith(color: UIColors.textDark),
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: Assets.icons.arrowDown.svg(),
          suffixIconConstraints: const BoxConstraints.tightFor(width: 48, height: 12),
        ),
      ),
    );

    return Flex(
      direction: labelPosition == LabelPosition.top ? Axis.vertical : Axis.horizontal,
      crossAxisAlignment: labelPosition == LabelPosition.top ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text.rich(
            TextSpan(
              text: label,
              style: UIStyleText.labelRegular.copyWith(fontSize: 10.5),
              children: [
                if (isRequired)
                  TextSpan(
                    text: ' *',
                    style: UIStyleText.labelRegular.copyWith(fontSize: 10.5, color: Colors.red),
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
