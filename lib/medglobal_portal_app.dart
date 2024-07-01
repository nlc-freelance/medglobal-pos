import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/category/category_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_selection/product_selection_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/cubit/supplier/supplier_cubit.dart';
import 'package:medglobal_admin_portal/features/supplier_management/presentation/cubit/supplier_list/supplier_list_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class MedGlobaPortalApp extends StatelessWidget {
  const MedGlobaPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<AuthBloc>()..add(const AppInitEvent())),
        BlocProvider(create: (_) => GetIt.I<SidebarCubit>()),
        BlocProvider(create: (_) => GetIt.I<SupplierListCubit>()),
        BlocProvider(create: (_) => GetIt.I<SupplierCubit>()),
        BlocProvider(create: (_) => GetIt.I<ProductSelectionCubit>()),
        BlocProvider(create: (_) => GetIt.I<CategoryCubit>()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) => AppRouter.router.refresh(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'MedGlobal Admin Portal',
          theme: UITheme.theme,
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
