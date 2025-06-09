import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/pos_transaction_bloc/pos_transaction_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/widgets/transaction_details.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/widgets/transaction_details_view.dart';
// import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionDetailSection extends StatefulWidget {
  const TransactionDetailSection({super.key});

  @override
  State<TransactionDetailSection> createState() => _TransactionDetailSectionState();
}

class _TransactionDetailSectionState extends State<TransactionDetailSection> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        decoration: BoxDecoration(
          border: Border.all(color: UIColors.borderMuted, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: BlocBuilder<PosTransactionBloc, PosTransactionState>(
          builder: (context, state) => state.maybeWhen(
            loading: () => const LoadingView(),
            loaded: (transaction) => TransactionDetails2(transaction: transaction),
            failure: (message) => FailureView(message),
            orElse: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.icons.cube.svg(width: 48, height: 48),
                const UIVerticalSpace(16),
                UIText.bodyRegular(
                  'Select a transaction from the list on the left \n to view details or issue a refund.',
                  color: UIColors.textMuted,
                  align: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        // child: BlocBuilder<TransactionCubit, TransactionState>(
        //   builder: (context, state) {
        //     if (state is TransactionByIdLoading) {
        //       return const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2));
        //     }
        //     if (state is TransactionByIdError) {
        //       return Center(child: Text(state.message));
        //     }
        //     if (state is TransactionByIdSuccess) {
        //       return TransactionDetails2(transaction: state.transaction);
        //     }
        //     return Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Assets.icons.cube.svg(width: 48, height: 48),
        //         const UIVerticalSpace(16),
        //         UIText.bodyRegular(
        //           'Select a transaction from the list on the left \n to view details or issue a refund.',
        //           color: UIColors.textMuted,
        //           align: TextAlign.center,
        //         ),
        //       ],
        //     );
        //   },
        // ),
      ),
    );
  }
}
