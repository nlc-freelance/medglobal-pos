import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/authentication/presentation/bloc/auth_bloc.dart';
import 'package:medglobal_admin_portal/portal/branches/cubit/branch_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/category/category_lazy_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_lazy_list/supplier_lazy_list_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PortalTopbar extends StatelessWidget implements PreferredSizeWidget {
  final String path;

  const PortalTopbar({required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    final isSideBarOpen = context.select((SidebarCubit cubit) => cubit.state);

    return Padding(
      padding: isSideBarOpen ? const EdgeInsets.fromLTRB(24, 0, 16, 8) : const EdgeInsets.symmetric(horizontal: 16.0),
      child: AppBar(
        backgroundColor: UIColors.background,
        surfaceTintColor: UIColors.transparent,
        centerTitle: false,
        titleSpacing: 0.0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isSideBarOpen) ...[
              IconButton(
                onPressed: context.read<SidebarCubit>().openSideBar,
                icon: Assets.icons.menu.svg(),
              ),
              const UIHorizontalSpace(12.0),
            ],
            // UIText.labelMedium(path),
          ],
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TODO: Implement Notification
              // hasNotification
              //     ? Badge(
              //         label: const Text('2'),
              //         child: Assets.icons.notification,
              //       )
              //     : Assets.icons.notification.svg(),
              const UIHorizontalSpace(16.0),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) => state is AuthenticatedState
                    ? UIText.labelMedium('${state.user.firstName} ${state.user.lastName}')
                    : const SizedBox(),
              ),
              const UIHorizontalSpace(12.0),
              UIPopupMenuButton<ProfileMenu>.icon(
                  icon: Assets.icons.arrowDown.setSize(12.0),
                  menu: ProfileMenu.values,
                  menuAsString: (item) => item.title,
                  onSelect: (menu) {
                    if (ProfileMenu.LOGOUT == menu) {
                      /// Dropdowns
                      context.read<BranchLazyListCubit>().reset();
                      context.read<CategoryLazyListCubit>().reset();
                      context.read<SupplierLazyListCubit>().reset();

                      context.read<AuthBloc>().add(const LogoutEvent());
                    }
                  }),
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
