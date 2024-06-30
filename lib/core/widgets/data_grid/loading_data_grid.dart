import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LoadingDataGrid<T> extends StatefulWidget {
  final List<GridColumn> columns;
  final SfDataGridThemeData style;
  final bool showCheckbox;

  const LoadingDataGrid({
    super.key,
    required this.columns,
    required this.style,
    this.showCheckbox = false,
  });

  @override
  State<LoadingDataGrid<T>> createState() => _LoadingDataGridState<T>();
}

class _LoadingDataGridState<T> extends State<LoadingDataGrid<T>> with DataGridInitMixin<T> {
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
                footer: const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)),

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
