import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class DataGridToolbar extends StatelessWidget {
  final bool isDownloadable;
  final String searchPlaceholder;

  const DataGridToolbar({
    this.searchPlaceholder = 'Search',
    this.isDownloadable = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UISearchField(
            fieldWidth: 320.0,
            hint: searchPlaceholder,
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Assets.icons.search.svg(),
            ),
            controller: TextEditingController(),
          ),
          if (isDownloadable)
            UIButton.outlined(
              'Download CSV',
              iconBuilder: (isHover) => Assets.icons.download.setColorOnHover(isHover),
              onClick: () {},
            ),
        ],
      ),
    );
  }
}
