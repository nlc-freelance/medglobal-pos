import 'package:flutter/widgets.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/utils/input_formatter.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/screens/register_shift_dialog.dart';

class AppCurrencyFormField extends StatefulWidget {
  const AppCurrencyFormField({
    super.key,
    required this.label,
    required this.hint,
    this.isRequired = false,
    this.value,
    this.validators,
    this.onChanged,
  });

  final String label;
  final String hint;
  final bool isRequired;
  final double? value;
  final List<String? Function(String?)>? validators;
  final void Function(String value)? onChanged;

  @override
  State<AppCurrencyFormField> createState() => _AppCurrencyFormFieldState();
}

class _AppCurrencyFormFieldState extends State<AppCurrencyFormField> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value?.toString().toCurrencyString());

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        if (_controller.text.isEmpty) return;

        _controller.text = _controller.text.toCurrencyString();
      } else {
        if (_controller.text.isNotEmpty) {
          // If text is not empty, remove all comma so the text is back to just digits and 1 period
          // This is so the NumberInputFormatter still allows editing the same text
          _controller.text = _controller.text.removeCurrencyFormat();
        }
      }
    });
  }

  // @override
  // void didUpdateWidget(covariant AppCurrencyFormField oldWidget) {
  //   _controller.text = widget.value?.toString() ;
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField.top(
      label: widget.label,
      hint: widget.hint,
      isRequired: widget.isRequired,
      controller: _controller,
      focusNode: _focusNode,
      formatter: [NumberInputFormatter()],
      validator: widget.validators == null ? null : (value) => FormValidators.run(value, widget.validators!),
      onChanged: widget.onChanged,
    );
  }
}
