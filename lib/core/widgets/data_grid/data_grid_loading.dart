import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/utils/data_grid_util.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataGridLoading extends StatefulWidget {
  final List<GridColumn> columns;
  final bool showCheckbox;
  final DataGridSource source;

  const DataGridLoading({
    super.key,
    required this.columns,
    required this.source,
    this.showCheckbox = false,
  });

  @override
  State<DataGridLoading> createState() => _LoadingDataGridState();
}

class _LoadingDataGridState extends State<DataGridLoading> {
  late List<GridColumn> _columns;
  late DataGridSource _source;

  @override
  void initState() {
    super.initState();
    _columns = widget.columns;
    _source = widget.source;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: UIStyleContainer.topBorder,
      child: ClipRect(
        clipper: HorizontalBorderClipper(),
        child: SfDataGridTheme(
          data: DataGridUtil.baseStyle,
          child: SfDataGrid(
            source: _source,
            columns: _columns,
            footerHeight: 100,
            footer: const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)),

            /// Data Grid Dynamic Config
            showCheckboxColumn: widget.showCheckbox,

            /// Data Grid Constant Style
            shrinkWrapRows: true,
            headerRowHeight: 38,
            columnWidthMode: ColumnWidthMode.fill,
            headerGridLinesVisibility: GridLinesVisibility.none,
          ),
        ),
      ),
    );
  }
}
