import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ColumnData {
  final String name;
  final String label;

  ColumnData(this.name, this.label);
}

class DataGridUtil {
  DataGridUtil._();

  static List<GridColumn> getColumns(List<ColumnData> columns) => columns
      .map<GridColumn>((column) => GridColumn(
            visible: column.name != 'id',
            columnName: column.name,
            label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                column.label,
                style: UIStyleText.labelSemiBold.copyWith(
                  color: UIColors.textLight,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ))
      .toList();

  static SfDataGridThemeData get baseStyle => const SfDataGridThemeData(
        columnDragIndicatorStrokeWidth: 1.0,
        columnDragIndicatorColor: UIColors.primary,
        headerHoverColor: UIColors.transparent,
        rowHoverColor: UIColors.secondary,
        selectionColor: UIColors.secondary,
        gridLineColor: UIColors.borderMuted,
        gridLineStrokeWidth: 0.8,
      );

  static SfDataGridThemeData get rowNavigationStyle => baseStyle.copyWith(
        currentCellStyle: const DataGridCurrentCellStyle(
          borderColor: UIColors.transparent,
          borderWidth: 0.0,
        ),
      );

  static SfDataGridThemeData get cellNavigationStyle => baseStyle.copyWith(
        rowHoverColor: UIColors.secondary,
        selectionColor: UIColors.transparent,
        currentCellStyle: const DataGridCurrentCellStyle(
          borderColor: UIColors.transparent,
          borderWidth: 0.0,
        ),
      );
}

class HorizontalBorderClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(1, 0, size.width - 1, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
