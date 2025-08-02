import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AppTabBar extends StatefulWidget {
  const AppTabBar({
    super.key,
    required this.onChangedTab,
    required this.tabs,
  });

  final void Function(int index) onChangedTab;
  final List<String> tabs;

  @override
  State<AppTabBar> createState() => _TabBarFilterState();
}

class _TabBarFilterState extends State<AppTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return; // Wait until transition finishes
      widget.onChangedTab(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: widget.tabs
          .map((tabs) => Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.only(right: 16),
                child: Tab(text: tabs),
              ))
          .toList(),
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.only(left: 0, right: 0),
      dividerColor: UIColors.borderMuted,
      dividerHeight: 0.8,
      labelColor: UIColors.primary,
      labelStyle: UIStyleText.labelSemiBold,
      unselectedLabelColor: UIColors.textMuted,
      unselectedLabelStyle: UIStyleText.labelMedium.copyWith(color: UIColors.textLight),
      indicatorPadding: EdgeInsets.zero,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2.3,
          color: UIColors.primary,
        ),
        insets: EdgeInsets.only(left: 0, right: 26, bottom: 0),
      ),
      overlayColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.pressed)) return UIColors.transparent;
        if (state.contains(WidgetState.hovered)) return UIColors.transparent;
        return UIColors.transparent;
      }),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
