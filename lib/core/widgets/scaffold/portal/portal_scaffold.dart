import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/portal/widgets/portal_side_bar1.dart';

class PortalScaffold extends StatelessWidget {
  const PortalScaffold({
    required this.child,
    required this.route,
    super.key,
  });

  // final StatefulNavigationShell navigationShell;
  final Widget child;
  final GoRouterState route;

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: Scaffold(
        body: Row(
          children: [
            BlocBuilder<SidebarCubit, bool>(
              builder: (context, state) => Visibility(
                visible: state,
                child: PortalSideBar1(),
                // child: PortalSidebar(currentMenu: route.topRoute!.name!),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  PortalTopbar(path: route.fullPath!.transformPathToText),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 16.0),
                      child: child,
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
