import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/presentation/cubit/register/active_register_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class PosHeader extends StatelessWidget {
  const PosHeader(this.routeState, {super.key});

  final GoRouterState routeState;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: UIColors.transparent,
      backgroundColor: UIColors.background,
      centerTitle: false,
      title: BlocBuilder<ActiveRegisterCubit, ActiveRegisterState>(
        builder: (context, state) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              UIText.heading5(
                routeState.matchedLocation == '/point-of-sale/transactions'
                    ? 'Transactions'
                    : (routeState.matchedLocation == '/point-of-sale/register' ? 'Register' : 'Order Payment'),
              ),
              const UIHorizontalSpace(16),
              if (state.name != null) ...[
                UIText.bodyRegular('|'),
                const UIHorizontalSpace(16),
                Text(
                  state.name!,
                  style: UIStyleText.labelMedium.copyWith(fontSize: 14),
                ),
              ],
            ],
          );
        },
      ),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: Assets.icons.menu.setSize(20),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ),
      actions: [
        BlocBuilder<ActiveRegisterCubit, ActiveRegisterState>(
          builder: (context, state) {
            final status = state.status;
            final isOpen = status == RegisterShiftStatus.open;

            return Chip(
              avatar: Container(
                width: 6.8,
                height: 6.8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isOpen ? UIColors.completed : UIColors.buttonDanger,
                ),
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 6),
              label: Text(
                status.label,
                style: UIStyleText.labelSemiBold.copyWith(
                  color: isOpen ? UIColors.completed : UIColors.buttonDanger,
                  fontSize: 13,
                ),
              ),
              backgroundColor: UIColors.whiteBg,
              visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: UIColors.transparent),
              ),
            );
          },
        ),
        const UIHorizontalSpace(16),
        UIText.bodyRegular(
          DateFormat('EEEE, d MMMM yyyy h:mm a').format(DateTime.now().toLocal()),
        ),
        const UIHorizontalSpace(20),
      ],
    );
  }
}
