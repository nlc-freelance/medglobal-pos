import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/session_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';

class PosHeader extends StatelessWidget {
  const PosHeader(this.routeState, {super.key});

  final GoRouterState routeState;

  @override
  Widget build(BuildContext context) {
    final title = routeState.matchedLocation == '/pos/transactions'
        ? 'Transactions'
        : (routeState.matchedLocation == '/pos/register' ? 'Register' : 'Order Payment');

    return AppBar(
      surfaceTintColor: UIColors.transparent,
      backgroundColor: UIColors.background,
      centerTitle: false,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          UIText.heading5(title),
          const UIHorizontalSpace(16),
          const RegisterName(),
        ],
      ),
      leading: IconButton(
        icon: Assets.icons.menu.setSize(20),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [
        const RegisterShiftStatusIndicator(),
        const UIHorizontalSpace(16),
        UIText.bodyRegular(DateTime.now().toLocal().toFullDateWithTimeFormat()),
        const UIHorizontalSpace(20),
      ],
    );
  }
}

class RegisterName extends StatelessWidget {
  const RegisterName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (session) => Row(
            children: [
              UIText.bodyRegular('|'),
              const UIHorizontalSpace(16),
              Text(
                session.registerName,
                style: UIStyleText.labelMedium.copyWith(fontSize: 14),
              ),
            ],
          ),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}

class RegisterShiftStatusIndicator extends StatelessWidget {
  const RegisterShiftStatusIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterShiftBloc, RegisterShiftState>(
      builder: (context, state) {
        final isLoading = state.maybeWhen(
          open: (_, __) => false,
          closed: (_) => false,
          orElse: () => true,
        );

        final isOpen = state.maybeWhen(
          open: (_, __) => true,
          orElse: () => false,
        );

        final status = isOpen ? RegisterShiftStatus.open : RegisterShiftStatus.closed;

        return isLoading
            ? const CupertinoActivityIndicator()
            : Chip(
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
    );
  }
}
