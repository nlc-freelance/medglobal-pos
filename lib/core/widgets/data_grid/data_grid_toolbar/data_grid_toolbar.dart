import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class DataGridToolbar extends StatelessWidget {
  const DataGridToolbar({
    this.filters,
    this.search,
    this.padding,
    this.reportType,
    this.reportFilters,
    super.key,
  });

  final List<Widget>? filters;
  final Widget? search;
  final EdgeInsets? padding;
  final ReportType? reportType;
  final Map<String, dynamic>? reportFilters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 24),
      child: Row(
        children: [
          if (search != null) ...[
            search!,
            const UIHorizontalSpace(8),
            const Spacer(),
          ],
          ...?filters,
          if (search == null) const Spacer(),
          if (reportType != null) ...[
            const UIHorizontalSpace(8),
            ExportButton(type: reportType!, filters: reportFilters),
          ],
        ],
      ),
    );
  }
}
