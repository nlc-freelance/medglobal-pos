import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AppCheckboxListTile extends StatefulWidget {
  const AppCheckboxListTile({
    required this.label,
    this.subtitle,
    required this.onToggle,
    this.value,
    this.controlAffinity = ListTileControlAffinity.leading,
    this.labelStyle,
    super.key,
  });

  final String label;
  final String? subtitle;
  final void Function(bool) onToggle;
  final bool? value;
  final ListTileControlAffinity controlAffinity;
  final TextStyle? labelStyle;

  @override
  State<AppCheckboxListTile> createState() => _MGCheckboxListTileState();
}

class _MGCheckboxListTileState extends State<AppCheckboxListTile> {
  bool value = false;

  @override
  void initState() {
    super.initState();
    if (widget.value != null) setState(() => value = widget.value!);
  }

  @override
  void didUpdateWidget(covariant AppCheckboxListTile oldWidget) {
    if (oldWidget.value != widget.value) {
      if (widget.value != null) setState(() => value = widget.value!);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          focusColor: UIColors.transparent,
          hoverColor: UIColors.transparent,
          highlightColor: UIColors.transparent,
          splashColor: UIColors.transparent,
        ),
        child: HoverBuilder(builder: (isHovered) {
          return ListTileTheme(
            horizontalTitleGap: 6,
            child: CheckboxListTile(
              value: value,
              onChanged: (_) {
                setState(() => value = !value);
                widget.onToggle(value);
              },
              title: Text(widget.label, style: widget.labelStyle ?? UIStyleText.labelMedium),
              controlAffinity: widget.controlAffinity,
              subtitle: widget.subtitle != null ? UIText.subtitle(widget.subtitle!) : null,
              side: WidgetStateBorderSide.resolveWith(
                (states) => BorderSide(
                  width: 1.5,
                  color: states.contains(WidgetState.selected) || isHovered ? UIColors.primary : UIColors.borderRegular,
                ),
              ),
              dense: true,
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
            ),
          );
        }),
      );
}
