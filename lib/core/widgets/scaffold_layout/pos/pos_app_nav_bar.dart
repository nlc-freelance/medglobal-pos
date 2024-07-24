import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/pos/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class POSAppNavBar extends StatelessWidget {
  const POSAppNavBar(this.routeState, {super.key});

  final GoRouterState routeState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterShiftBloc, RegisterShiftState>(
      builder: (context, state) {
        return AppBar(
          surfaceTintColor: UIColors.transparent,
          backgroundColor: UIColors.background,
          centerTitle: false,
          title: BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UIText.heading5(
                    routeState.matchedLocation == '/point-of-sale/transactions'
                        ? 'Transactions'
                        : (routeState.matchedLocation == '/point-of-sale/register' ? 'Register' : ''),
                  ),
                  const UIHorizontalSpace(16),
                  if (state.register != null) ...[
                    UIText.bodyRegular('|'),
                    const UIHorizontalSpace(16),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Chip(
                        label: Text(
                          state.register!.name!,
                          style: UIStyleText.labelMedium.copyWith(fontSize: 13),
                        ),
                        backgroundColor: UIColors.whiteBg,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: UIColors.transparent),
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
          actions: [
            FutureBuilder(
                future: SharedPreferencesService.isShiftOpen(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Chip(
                          label: Text(
                            '\u2022  ${snapshot.data == true ? 'Open' : 'Closed'}',
                            style: UIStyleText.labelSemiBold.copyWith(
                              color: snapshot.data == true ? UIColors.completed : UIColors.buttonDanger,
                              fontSize: 13,
                            ),
                          ),
                          backgroundColor: UIColors.whiteBg,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: UIColors.transparent),
                          ),
                        )
                      : const SizedBox();
                }),
            const UIHorizontalSpace(16),
            UIText.bodyRegular(
              DateFormat('EEEE, d MMMM yyyy h:mm a').format(DateTime.now().toLocal()),
            ),
            const UIHorizontalSpace(20),
          ],
        );
      },
    );
  }
}
