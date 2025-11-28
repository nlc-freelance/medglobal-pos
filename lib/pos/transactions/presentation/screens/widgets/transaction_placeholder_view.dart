import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_cubit.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionPlaceholderView extends StatelessWidget {
  const TransactionPlaceholderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, bool>(
      builder: (context, isOnline) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isOnline ? Assets.icons.cube.svg(width: 48, height: 48) : const Icon(Icons.wifi_off_rounded),
            const UIVerticalSpace(16),
            if (!isOnline) ...[
              UIText.heading6('No internet connection'),
              const UIVerticalSpace(8),
            ],
            UIText.bodyRegular(
              isOnline
                  ? 'Select a transaction from the list on the left \n to view details or issue a refund.'
                  : 'You need to be online to view your transactions.\nPlease connect to the internet and try again.',
              color: UIColors.textMuted,
              align: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
