import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';

class ScaffoldLayout extends StatelessWidget {
  const ScaffoldLayout({
    required this.navigationShell,
    required this.routerState,
    super.key,
  });

  final StatefulNavigationShell navigationShell;
  final GoRouterState routerState;

  @override
  Widget build(BuildContext context) {
    final showSideBar = context.select((SidebarCubit cubit) => cubit.state);

    return Portal(
      child: Scaffold(
        body: Row(
          children: [
            if (showSideBar) SideNavBar(currentMenu: routerState.topRoute!.name!),
            Expanded(
              child: Column(
                children: [
                  AppNavBar(path: routerState.fullPath!.transformPathToText),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
                      child: navigationShell,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
