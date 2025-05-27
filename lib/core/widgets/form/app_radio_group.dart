import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AppRadioGroup<T> extends StatefulWidget {
  const AppRadioGroup({
    required this.items,
    required this.onChanged,
    required this.itemAsString,
    this.direction = Axis.horizontal,
    this.spacing = 0.0,
    this.value,
    this.labelStyle,
    super.key,
  });

  final List<T> items;
  final void Function(T?) onChanged;
  final String Function(T) itemAsString;
  final TextStyle? labelStyle;
  final Axis direction;
  final double spacing;
  final T? value;

  @override
  State<AppRadioGroup<T>> createState() => _AppRadioGroupState<T>();
}

class _AppRadioGroupState<T> extends State<AppRadioGroup<T>> {
  T? selected;

  @override
  void initState() {
    super.initState();
    setState(() => selected = widget.value);
  }

  @override
  void didUpdateWidget(covariant AppRadioGroup<T> oldWidget) {
    if (oldWidget.value != widget.value) setState(() => selected = widget.value);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => Wrap(
        direction: widget.direction,
        spacing: widget.spacing,
        children: widget.items
            .map(
              (item) => ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 200.0),
                child: HoverBuilder(
                  builder: (isHovered) => Theme(
                    data: Theme.of(context).copyWith(
                      focusColor: UIColors.transparent,
                      hoverColor: UIColors.transparent,
                      highlightColor: UIColors.transparent,
                      splashColor: UIColors.transparent,
                    ),
                    child: ListTileTheme(
                      horizontalTitleGap: 6,
                      child: RadioListTile<T>(
                        selected: selected != null ? item == selected : false,
                        value: item,
                        groupValue: selected,
                        onChanged: (value) {
                          setState(() => selected = value as T);
                          widget.onChanged(value);
                        },
                        title: Text(widget.itemAsString(item), style: widget.labelStyle ?? UIStyleText.labelMedium),
                        fillColor: WidgetStateColor.resolveWith(
                          (states) => isHovered
                              ? UIColors.primary
                              : states.contains(WidgetState.selected)
                                  ? UIColors.primary
                                  : UIColors.borderRegular,
                        ),
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      );
}
