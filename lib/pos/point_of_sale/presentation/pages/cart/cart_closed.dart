import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/enums/register_shift.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold_layout/pos/widgets/register_shift_dialog.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/bloc/register_shift_bloc.dart';
import 'package:medglobal_admin_portal/shared/register/presentation/cubit/register/register_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CartClosed extends StatelessWidget {
  const CartClosed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.icons.infoCircle.svg(width: 40, colorFilter: UIColors.borderRegular.toColorFilter),
        const UIVerticalSpace(8),
        Text('CLOSED', style: UIStyleText.headline.copyWith(fontSize: 48)),
        const UIVerticalSpace(30),
        Text('Open register shift', style: UIStyleText.bodyRegular.copyWith(fontSize: 14)),
        const UIVerticalSpace(4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            'To start making transactions, open shift and input the initial register cash.',
            style: UIStyleText.hint.copyWith(fontSize: 12.8),
            textAlign: TextAlign.center,
          ),
        ),
        const UIVerticalSpace(24),
        UIButton.filled(
          'Open Shift',
          onClick: () => showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => RegisterShiftDialog(
                    action: RegisterShiftAction.open,
                    dateTime: context.read<RegisterCubit>().state.closedAt,
                    onConfirm: (amount) => context
                        .read<RegisterShiftBloc>()
                        .add(RegisterShiftOpened(id: context.read<RegisterCubit>().state.id!, amount: amount)),
                  )),
        ),
      ],
    );
  }
}
