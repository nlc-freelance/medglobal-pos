import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold_layout/pos/widgets/pos_header.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold_layout/pos/widgets/pos_drawer.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold_layout/pos/widgets/register_selection_dialog.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/register_item_list_remote/register_item_list_remote_cubit.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PosScaffold extends StatefulWidget {
  const PosScaffold({
    super.key,
    required this.routerState,
    required this.navigationShell,
  });

  final GoRouterState routerState;
  final StatefulNavigationShell navigationShell;

  @override
  State<PosScaffold> createState() => _PosScaffoldState();
}

class _PosScaffoldState extends State<PosScaffold> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<RegisterCubit>().state.id == null) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => RegisterSelectionDialog(
            onConfirm: (register) {
              context.read<RegisterCubit>().saveRegister(register);
              if (register.shiftDetail?.status == 'open') context.read<POSProductListRemoteCubit>().getPOSProducts();
              Navigator.pop(context);
            },
          ),
        );
      }

      if (context.read<RegisterCubit>().state.isOpen) context.read<POSProductListRemoteCubit>().getPOSProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: Scaffold(
        drawerScrimColor: UIColors.transparent,
        drawer: PosDrawer(routerState: widget.routerState),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            margin: const EdgeInsets.all(16),
            child: PosHeader(widget.routerState),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
          child: widget.navigationShell,
        ),
      ),
    );
  }
}
