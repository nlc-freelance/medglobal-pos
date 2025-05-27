import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

/// Todos:
/// Slowly migrate to use [AppTextFormField] instead of [UITextFormField] from shared package, esp for ND1 features.
/// UITextFormField will be removed in the future.
/// To migrate: Product Name, Stock Keeping Unit details, Variant
/// Others: Add focus node so this widget can be used in RegisterShiftDialog

enum FieldLabelPosition { none, top, left }

class AppTextFormField extends StatelessWidget {
  final FieldLabelPosition layout;
  final String? label;
  final String hint;
  final TextEditingController controller;
  final bool isObscured;
  final bool isRequired;
  final String? Function(String?)? validator;
  final void Function(String value)? onChanged;
  final List<TextInputFormatter>? formatter;

  const AppTextFormField.top({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isObscured = false,
    this.isRequired = false,
    this.validator,
    this.onChanged,
    this.formatter,
  }) : layout = FieldLabelPosition.top;

  const AppTextFormField.left({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isObscured = false,
    this.isRequired = false,
    this.validator,
    this.onChanged,
    this.formatter,
  }) : layout = FieldLabelPosition.left;

  const AppTextFormField.noLabel({
    super.key,
    this.label,
    required this.hint,
    required this.controller,
    this.isObscured = false,
    this.isRequired = false,
    this.validator,
    this.onChanged,
    this.formatter,
  }) : layout = FieldLabelPosition.none;

  @override
  Widget build(BuildContext context) {
    final textFormField = TextFormField(
      controller: controller,
      onChanged: onChanged,
      style: UIStyleText.bodyRegular.copyWith(fontSize: 12, color: UIColors.textDark),
      decoration: InputDecoration(
        hintText: hint,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: UIColors.textGray),
        ),
      ),
      cursorHeight: 14,
      inputFormatters: [...?formatter],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
    );

    return layout == FieldLabelPosition.none
        ? textFormField
        : Flex(
            direction: layout == FieldLabelPosition.top ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: layout == FieldLabelPosition.top ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              if (layout != FieldLabelPosition.none)
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
              layout == FieldLabelPosition.left ? Expanded(child: textFormField) : textFormField,
            ],
          );
  }
}
