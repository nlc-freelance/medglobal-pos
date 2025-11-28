import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataGridTextField extends StatelessWidget {
  const DataGridTextField({
    super.key,
    required this.controller,
    required this.textDisplay,
    required this.focusNode,
    this.inputFormatters,
    required this.onChanged,
    required this.submitCell,
  });

  final TextEditingController controller;
  final dynamic textDisplay;
  final FocusNode focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String) onChanged;
  final CellSubmit submitCell;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: controller..text = (textDisplay ?? Strings.empty).toString(),
        autofocus: true,
        focusNode: focusNode,
        cursorHeight: 15.0,
        style: UIStyleText.bodyRegular.copyWith(fontSize: 12, color: UIColors.textDark),
        inputFormatters: inputFormatters,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: UIColors.textGray),
          ),
        ),
        onChanged: onChanged,
        onSubmitted: (_) => submitCell(),
      ),
    );
  }
}
