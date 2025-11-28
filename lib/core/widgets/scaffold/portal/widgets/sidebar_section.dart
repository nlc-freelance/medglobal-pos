import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SidebarSection extends StatefulWidget {
  const SidebarSection({
    super.key,
    this.leading,
    required this.title,
    required this.isExpanded,
    required this.hasSelection,
    required this.onToggle,
    required this.children,
    this.isSubLevel1 = false,
  });

  final Widget? leading;
  final String title;
  final bool isExpanded;
  final bool hasSelection;
  final VoidCallback onToggle;
  final List<Widget> children;
  final bool isSubLevel1;

  @override
  State<SidebarSection> createState() => _SidebarSectionState();
}

class _SidebarSectionState extends State<SidebarSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    /// Initialize to correct expanded state
    if (widget.isExpanded) _controller.value = 1.0;
  }

  @override
  void didUpdateWidget(covariant SidebarSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      widget.isExpanded ? _controller.forward() : _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            listTileTheme: const ListTileThemeData(minLeadingWidth: 0),
          ),
          child: ListTile(
            onTap: _onToggle,
            leading: widget.leading ?? const SizedBox.shrink(),
            title: UIText.labelMedium(
              widget.title,
              color: widget.hasSelection ? UIColors.primary : UIColors.textRegular,
            ),
            titleTextStyle: UIStyleText.inter.copyWith(fontWeight: FontWeight.w500),
            trailing: RotationTransition(
              turns: Tween<double>(begin: 0, end: 0.5).animate(_animation),
              child: Assets.icons.arrowDown.svg(
                height: 10,
                colorFilter: (widget.hasSelection ? UIColors.primary : UIColors.textLight).toColorFilter,
              ),
            ),
            selected: widget.hasSelection,
            selectedColor: UIColors.primary,
            horizontalTitleGap: widget.leading == null ? 8 : null,
            dense: true,
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.zero,
            // contentPadding: const EdgeInsets.only(left: 22, right: 24),
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        ClipRect(
          child: SizeTransition(
            sizeFactor: _animation,
            axisAlignment: -1.0,
            child: FadeTransition(
              opacity: _animation,
              child: Padding(
                padding: EdgeInsets.only(left: widget.isSubLevel1 ? 8 : 20),
                child: Column(children: widget.children),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onToggle() => widget.onToggle();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
