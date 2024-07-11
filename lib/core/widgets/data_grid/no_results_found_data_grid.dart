import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/data_grid_util.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class NoResultsFoundDataGrid<T> extends StatefulWidget {
  final List<GridColumn> columns;
  final SfDataGridThemeData style;
  final bool showCheckbox;
  final String message;

  const NoResultsFoundDataGrid({
    super.key,
    required this.columns,
    required this.style,
    required this.message,
    this.showCheckbox = false,
  });

  @override
  State<NoResultsFoundDataGrid<T>> createState() => _NoResultsFoundDataGridState<T>();
}

class _NoResultsFoundDataGridState<T> extends State<NoResultsFoundDataGrid<T>> with DataGridInitMixin<T> {
  late List<GridColumn> _columns;
  late BaseDataSource _source;

  @override
  void initState() {
    super.initState();
    _columns = widget.columns;

    _source = getDataSource(<T>[])!..build();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: UIStyleContainer.topBorder,
          child: SfDataGridTheme(
            data: widget.style,
            child: ClipRect(
              clipper: HorizontalBorderClipper(),
              child: SfDataGrid(
                source: _source,
                columns: _columns,
                footerHeight: 100,
                footer: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Assets.icons.cube.svg(),
                      const UIVerticalSpace(16),
                      UIText.labelMedium(widget.message),
                    ],
                  ),
                ),

                /// Data Grid Dynamic Config
                showCheckboxColumn: widget.showCheckbox,

                /// Data Grid Constant Style
                shrinkWrapRows: true,
                headerRowHeight: Sizes.headerHeight,
                columnWidthMode: ColumnWidthMode.fill,
                headerGridLinesVisibility: GridLinesVisibility.none,
                gridLinesVisibility: GridLinesVisibility.horizontal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
