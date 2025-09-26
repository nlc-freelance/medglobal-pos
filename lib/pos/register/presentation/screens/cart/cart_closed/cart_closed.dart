import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/bloc/product_catalog_remote/product_catalog_bloc.dart';
import 'package:medglobal_admin_portal/pos/product_catalog/presentation/cubit/product_catalog_local/product_catalog_cubit.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/screens/register_shift_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:medglobal_admin_portal/pos/register_shift/presentation/bloc/register_shift_bloc/register_shift_bloc.dart';

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
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.read<ProductCatalogCubit>()),
                BlocProvider.value(value: context.read<ProductCatalogBloc>()),
                BlocProvider.value(value: context.read<RegisterShiftBloc>()),
              ],
              child: BlocConsumer<RegisterShiftBloc, RegisterShiftState>(
                listener: (context, state) {
                  state.maybeWhen(
                    open: (_, __) => Navigator.pop(context),
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  return RegisterShiftDialog(
                    action: RegisterShiftAction.open,
                    dateTime: state.maybeWhen(
                      closed: (closedSince) => closedSince,
                      orElse: () => null,
                    ),
                    onConfirm: (amount) => context.read<RegisterShiftBloc>().add(RegisterShiftEvent.open(amount)),
                    // .add(RegisterShiftOpened(id: context.read<ActiveRegisterCubit>().state.id!, amount: amount)),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
