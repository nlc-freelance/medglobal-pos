import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class DataGridToolbar extends StatelessWidget {
  const DataGridToolbar({
    this.isDownloadable = false,
    this.isImportCSV = false,
    this.filters,
    this.search,
    this.padding,
    super.key,
  });

  final bool isDownloadable;
  final bool isImportCSV;
  final List<Widget>? filters;
  final Widget? search;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          if (search != null) search!,
          ...?filters,
          const Spacer(),
          if (isImportCSV)
            UIButton.outlined(
              'Import from CSV',
              iconBuilder: (isHover) => Assets.icons.import.setColorOnHover(isHover),
              onClick: () {},
            ),
          if (isDownloadable) ...[
            const UIHorizontalSpace(8),
            UIButton.outlined(
              'Download CSV',
              iconBuilder: (isHover) => Assets.icons.download.setColorOnHover(isHover),
              onClick: () {},
            ),
          ],
        ],
      ),
    );
  }
}
