import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/utils/data_grid_util.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DataGridNoData extends StatefulWidget {
  final List<GridColumn> columns;
  final bool showCheckbox;
  final DataGridSource source;

  const DataGridNoData({
    super.key,
    required this.columns,
    required this.source,
    this.showCheckbox = false,
  });

  @override
  State<DataGridNoData> createState() => _DataGridNoDataState();
}

class _DataGridNoDataState extends State<DataGridNoData> {
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
    return ClipRect(
      clipper: HorizontalBorderClipper(),
      child: SfDataGridTheme(
        data: DataGridUtil.baseStyle,
        child: SfDataGrid(
          source: _source,
          columns: _columns,
          footerHeight: 100,
          footer: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Assets.icons.cube.svg(),
                const UIVerticalSpace(12),
                UIText.labelMedium(
                  'No data available, please add items to your order.',
                  color: UIColors.textMuted,
                ),
              ],
            ),
          ),

          /// Data Grid Dynamic Config
          showCheckboxColumn: widget.showCheckbox,

          /// Data Grid Constant Style
          shrinkWrapRows: true,
          columnWidthMode: ColumnWidthMode.fill,
          headerGridLinesVisibility: GridLinesVisibility.none,
        ),
      ),
    );
  }
}
