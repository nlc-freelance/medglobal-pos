import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/portal/widgets/portal_side_bar1.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SidebarItem extends StatelessWidget {
  const SidebarItem({
    super.key,
    required this.title,
    required this.route,
    required this.routeName,
    this.ignoreSubpaths,
  });

  final String title;
  final String route;
  final String routeName;
  final List<String>? ignoreSubpaths;

  @override
  Widget build(BuildContext context) {
    final isSelected = context.isSubrouteOf(route) &&
        (ignoreSubpaths?.isNotEmpty == true
            ? ignoreSubpaths!.any((subpath) => !context.currentRoute.contains(subpath))
            : true);

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4.5),
          bottomLeft: Radius.circular(4.5),
        ),
        border: isSelected
            ? const Border(
                left: BorderSide(
                  color: UIColors.accent,
                  width: 3.0,
                ),
              )
            : const Border(),
      ),
      child: Material(
        color: UIColors.transparent,
        child: ListTile(
          onTap: () => context.goNamed(routeName),
          title: UIText.labelMedium(title, color: isSelected ? UIColors.primary : UIColors.textRegular),
          titleTextStyle: UIStyleText.inter.copyWith(fontWeight: FontWeight.w500),
          selected: isSelected,
          selectedColor: UIColors.primary,
          selectedTileColor: UIColors.whiteBg,
          hoverColor: UIColors.whiteBg,
          dense: true,
          visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
          contentPadding: const EdgeInsets.only(left: 12),
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomLeft: Radius.circular(4),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
