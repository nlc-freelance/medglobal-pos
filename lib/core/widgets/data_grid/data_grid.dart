import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// By default, when no type is passed as <T>, DataGrid uses the BaseDataSource to build the DataGridRows.
/// If DataGrid has custom cell values, pass the type as <T> and add the custom DataSource to the DataGridInitMixin.
class DataGrid<T> extends StatefulWidget {
  final List<GridColumn> columns;
  // final List<RowData> rows;
  final List<T> data;
  final SelectionMode selectionMode;
  final bool showCheckbox;
  final bool allowColumnDrag;
  final bool allowEditing;
  final GridNavigationMode navigationMode;
  final SfDataGridThemeData style;
  final Widget Function(DataGridController controller)? selectionToolbarBuilder;
  final void Function(List<DataGridRow> rows)? onSelectedRowDataIds;
  final List<int>? selectedRowDataIDs;

  /// Single select by row tap to view details
  final void Function(int id)? onTap;

  const DataGrid({
    super.key,
    required this.data,
    required this.columns,
    // required this.rows,
    required this.navigationMode,
    required this.style,
    this.selectionMode = SelectionMode.none,
    this.showCheckbox = false,
    this.allowColumnDrag = true,
    this.allowEditing = false,
    this.selectionToolbarBuilder,
    this.onSelectedRowDataIds,
    this.selectedRowDataIDs,
    this.onTap,
  });

  @override
  State<DataGrid<T>> createState() => _DataGridState<T>();
}

class _DataGridState<T> extends State<DataGrid<T>> with DataGridInitMixin<T> {
  late DataGridController _controller;
  late List<GridColumn> _columns;
  // late List<RowData> _rows;
  // late BaseDataSource _source;
  late BaseDataSource _source;
  List<T> _data = <T>[];

  // int _rowsPerPage = 20;

  @override
  void initState() {
    super.initState();
    _controller = DataGridController();

    _columns = widget.columns;
    // _rows = widget.rows;

    _data = widget.data;

    // _source = initDataGridSource(_data);
    _source = getDataSource(_data)!..build();
  }

  @override
  Widget build(BuildContext context) {
    final showSelectedRowsToolbar = widget.selectionToolbarBuilder != null && _controller.selectedRows.isNotEmpty;

    return Column(
      children: [
        if (showSelectedRowsToolbar) widget.selectionToolbarBuilder!(_controller),
        Container(
          decoration: UIStyleContainer.topBorder,
          child: SfDataGridTheme(
            data: widget.style,
            child: ClipRect(
              clipper: HorizontalBorderClipper(),
              child: SfDataGrid(
                controller: _controller,
                source: _source,
                columns: _columns,
                footerHeight: 100,
                footer: _source.rows.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Assets.icons.cube.svg(),
                            const UIVerticalSpace(12),
                            UIText.labelMedium('No data available'),
                          ],
                        ),
                      )
                    : null,

                /// Data Grid Dynamic Config
                selectionMode: widget.selectionMode,
                showCheckboxColumn: widget.showCheckbox,
                allowColumnsDragging: widget.allowColumnDrag,
                navigationMode: widget.navigationMode,
                verticalScrollPhysics: const AlwaysScrollableScrollPhysics(),
                allowEditing: widget.allowEditing,
                editingGestureType: EditingGestureType.tap,

                /// Data Grid Constant Style
                shrinkWrapRows: true,
                onQueryRowHeight: (details) => _source.runtimeType != BaseDataSource
                    ? details.getIntrinsicRowHeight(details.rowIndex)
                    : Sizes.rowHeight,
                rowHeight: Sizes.rowHeight,
                headerRowHeight: Sizes.headerHeight,
                columnWidthMode: ColumnWidthMode.fill,
                headerGridLinesVisibility: GridLinesVisibility.none,
                gridLinesVisibility: GridLinesVisibility.horizontal,

                /// Data Grid Callbacks
                onSelectionChanged: (_, __) {
                  if (widget.showCheckbox) widget.onSelectedRowDataIds!(_controller.selectedRows);
                },
                onColumnDragging: (DataGridColumnDragDetails details) {
                  if (details.action == DataGridColumnDragAction.dropped && details.to != null) {
                    final GridColumn rearrangeColumn = _columns[details.from];

                    _columns.removeAt(details.from);
                    _columns.insert(details.to!, rearrangeColumn);

                    _source.build();
                    _source.update();

                    /// DataGrid with [showCheckbox] does not maintain the selected rows upon column drag and drops.
                    /// Column drag and drop requires rebuilding of the DataGridRow in order to display the data correctly.
                    /// To maintain the selection even after re-arranging the columns, store the selected data IDs in state.
                    /// Then use it to get the rows and assign to the [selectedRows] of the DataGridController.
                    if (widget.showCheckbox) {
                      final selectedRows =
                          _source.rows.where((row) => widget.selectedRowDataIDs!.contains(row.id)).toList();
                      _controller.selectedRows = selectedRows;
                    }
                  }
                  return true;
                },
                columnDragFeedbackBuilder: (context, column) => Container(
                  height: Sizes.headerHeight,
                  width: column.minimumWidth,
                  decoration: const BoxDecoration(
                    color: UIColors.background,
                    border: Border.fromBorderSide(BorderSide(color: UIColors.borderRegular, width: 1.0)),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  child: column.label,
                ),
                onCellTap: (details) => widget.onTap != null
                    ? widget.onTap!(_source.rows[details.rowColumnIndex.rowIndex - 1].getCells().first.value)
                    : null,
              ),
            ),
          ),
        ),
        // UIVerticalSpace(16),
        // Container(
        //     height: 60,
        //     child: SfDataPager(
        //       delegate: _source,
        //       availableRowsPerPage: [10, 30, 50],
        //       onRowsPerPageChanged: (int? rowsPerPage) {
        //         setState(() {
        //           _rowsPerPage = rowsPerPage!;
        //           _source.updateDataGrid();
        //         });
        //       },
        //       pageCount: ((_rows.length / _rowsPerPage).ceil()).toDouble(),
        //     )),
      ],
    );
  }
}
