import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';

class PortalScaffold extends StatelessWidget {
  const PortalScaffold({
    required this.navigationShell,
    required this.routerState,
    super.key,
  });

  // final StatefulNavigationShell navigationShell;
  final Widget navigationShell;
  final GoRouterState routerState;

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: Scaffold(
        body: Row(
          children: [
            BlocBuilder<SidebarCubit, bool>(
              builder: (context, state) => Visibility(
                visible: state,
                child: PortalSidebar(currentMenu: routerState.topRoute!.name!),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  PortalTopbar(path: routerState.fullPath!.transformPathToText),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 16.0),
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
