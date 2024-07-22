import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class DataGridToolbar extends StatelessWidget {
  const DataGridToolbar({
    this.searchPlaceholder = 'Search',
    this.isDownloadable,
    this.isImportCSV,
    this.filters,
    this.onChanged,
    this.searchController,
    this.padding,
    this.search,
    super.key,
  });

  final bool? isDownloadable;
  final bool? isImportCSV;
  final String searchPlaceholder;
  final List<Widget>? filters;
  final Function(String value)? onChanged;
  final TextEditingController? searchController;
  final EdgeInsets? padding;
  final Widget? search;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          search ??
              UISearchField(
                fieldWidth: 500.0,
                hint: searchPlaceholder,
                icon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Assets.icons.search.svg(),
                ),
                controller: searchController,
                onChanged: onChanged != null ? (value) => onChanged!(value) : (_) => {},
              ),
          Row(
            children: [
              ...?filters,
              const UIHorizontalSpace(8),
              if (isImportCSV == true) ...[
                UIButton.outlined(
                  'Import from CSV',
                  iconBuilder: (isHover) => Assets.icons.import.setColorOnHover(isHover),
                  onClick: () {},
                ),
                const UIHorizontalSpace(8),
              ],
              if (isDownloadable == true)
                UIButton.outlined(
                  'Download CSV',
                  iconBuilder: (isHover) => Assets.icons.download.setColorOnHover(isHover),
                  onClick: () {},
                ),
            ],
          ),
        ],
      ),
    );
  }
}
