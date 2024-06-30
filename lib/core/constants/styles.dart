import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class StyleDataGrid {
  StyleDataGrid._();

  static SfDataGridThemeData get base => const SfDataGridThemeData(
        columnDragIndicatorStrokeWidth: 1.0,
        columnDragIndicatorColor: UIColors.primary,
        headerHoverColor: UIColors.transparent,
        rowHoverColor: UIColors.secondary,
        selectionColor: UIColors.secondary,
        gridLineColor: UIColors.borderMuted,
        gridLineStrokeWidth: 0.8,
      );

  static SfDataGridThemeData get rowNavigation => base.copyWith(
        currentCellStyle: const DataGridCurrentCellStyle(
          borderColor: UIColors.transparent,
          borderWidth: 0.0,
        ),
      );

  static SfDataGridThemeData get cellNavigation => base.copyWith(
        currentCellStyle: const DataGridCurrentCellStyle(
          borderColor: UIColors.buttonPrimaryHover,
          borderWidth: 0.8,
        ),
      );
}

class HorizontalBorderClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(2, 0, size.width - 2, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
