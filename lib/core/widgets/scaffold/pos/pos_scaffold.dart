import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/pos_header.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/pos_drawer.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold/pos/widgets/register_selection_dialog.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/product_list/pos_product_list_cubit.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/register/active_register_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PosScaffold extends StatefulWidget {
  const PosScaffold({
    super.key,
    required this.route,
    required this.child,
  });

  // final GoRouterState routerState;
  // final StatefulNavigationShell navigationShell;
  final Widget child;
  final GoRouterState route;

  @override
  State<PosScaffold> createState() => _PosScaffoldState();
}

class _PosScaffoldState extends State<PosScaffold> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<ActiveRegisterCubit>().state.id == null) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => BlocProvider.value(
            value: context.read<PosProductListCubit>(),
            child: RegisterSelectionDialog(
              onConfirm: (register) {
                context.read<ActiveRegisterCubit>().saveRegister(register);
                if (register.shiftDetail?.status == 'open') context.read<PosProductListCubit>().getPOSProducts();
                Navigator.pop(context);
              },
            ),
          ),
        );
      }

      if (context.read<ActiveRegisterCubit>().state.isOpen) context.read<PosProductListCubit>().getPOSProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: Scaffold(
        drawerScrimColor: UIColors.transparent,
        drawer: PosDrawer(routerState: widget.route),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            margin: const EdgeInsets.all(16),
            child: PosHeader(widget.route),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
          child: widget.child,
        ),
      ),
    );
  }
}
