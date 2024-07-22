import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ColumnData {
  final String name;
  final String label;
  final double? minWidth;

  ColumnData(this.name, this.label, {this.minWidth});
}

class DataGridUtil {
  DataGridUtil._();

  static List<GridColumn> getColumns(List<ColumnData> columns, {bool? showId}) => columns
      .map<GridColumn>((column) => GridColumn(
            visible: showId ?? column.name != 'id',
            columnName: column.name,
            minimumWidth: column.minWidth ?? double.nan,
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

  static SfDataGridThemeData get baseStyle => SfDataGridThemeData(
        columnDragIndicatorStrokeWidth: 1.0,
        columnDragIndicatorColor: UIColors.primary,
        headerHoverColor: UIColors.transparent,
        rowHoverColor: UIColors.secondary,
        selectionColor: UIColors.secondary,
        gridLineColor: UIColors.borderMuted,
        gridLineStrokeWidth: 0.8,

        /// Column group icon indent
        indentColumnWidth: 0,
        indentColumnColor: UIColors.background,
        groupExpanderIcon: Assets.icons.arrowDown.svg(width: 10, colorFilter: UIColors.textDark.toColorFilter),
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

class CustomSelectionManager extends RowSelectionManager {
  CustomSelectionManager(this.dataGridController);
  DataGridController dataGridController;

  @override
  Future<void> handleKeyEvent(KeyEvent keyEvent) async {
    if (keyEvent.logicalKey == LogicalKeyboardKey.tab ||
        keyEvent.logicalKey == LogicalKeyboardKey.arrowDown ||
        keyEvent.logicalKey == LogicalKeyboardKey.arrowUp ||
        keyEvent.logicalKey == LogicalKeyboardKey.arrowLeft ||
        keyEvent.logicalKey == LogicalKeyboardKey.arrowRight) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        dataGridController.beginEdit(dataGridController.currentCell);
      });
    }
    super.handleKeyEvent(keyEvent);
  }
}
