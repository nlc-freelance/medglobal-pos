import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/refund_bloc/refund_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/register_transaction_bloc/register_transaction_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/transaction_list_bloc/transaction_list_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_form/refund_form_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_view_mode/transaction_view_mode_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/issue_refund/reason_for_refund.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/issue_refund/refundable_items_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class IssueRefundView extends StatelessWidget {
  const IssueRefundView({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<RefundBloc>()),
        BlocProvider(create: (_) => RefundFormCubit()),
      ],
      child: _IssueRefundView(transaction: transaction),
    );
  }
}

class _IssueRefundView extends StatelessWidget {
  const _IssueRefundView({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RefundBloc, RefundState>(
      listener: (context, state) {
        state.maybeWhen(
          processing: () => PageLoader.show(context),
          success: (refund) {
            PageLoader.close();
            context.read<TransactionListBloc>().add(TransactionListEvent.insertNewTransaction(refund));
            context.read<RegisterTransactionBloc>().add(RegisterTransactionEvent.getById(refund.id));
            context.read<TransactionViewModeCubit>().view(TransactionViewMode.refund);
          },
          failure: (message) {
            PageLoader.close();
            SnackbarUtil.error(context, message);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIText.heading5('Issue Refund'),
            const UIVerticalSpace(30),
            Wrap(
              spacing: 32,
              runSpacing: 16,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.heading6('Refund for'),
                    HoverBuilder(
                      builder: (isHover) => InkWell(
                        onTap: () => _onViewSaleTransaction(context),
                        hoverColor: UIColors.transparent,
                        child: Text(
                          transaction.receiptId,
                          style: UIStyleText.bodyRegular.copyWith(
                            color: UIColors.primary,
                            fontWeight: FontWeight.w400,
                            decoration: isHover ? TextDecoration.underline : TextDecoration.none,
                            decorationColor: UIColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIText.heading6('Cashier'),
                    UIText.bodyRegular(transaction.employee.name),
                  ],
                ),
              ],
            ),
            const UIVerticalSpace(30),
            RefundableItemsDataGrid(transaction),
            const ReasonForRefundDetails(),
            const UIVerticalSpace(16),
            state.maybeWhen(
              failure: (message) => PageErrorBanner(message: message),
              orElse: () => const SizedBox(),
            ),
            BlocSelector<RefundFormCubit, RefundFormState, RefundFormState>(
              selector: (state) => state,
              builder: (context, state) {
                return CancelActionButton(
                  onCancel: () => _onViewSaleTransaction(context),
                  onAction: () => context.read<RefundBloc>().add(RefundEvent.createRefund(
                        saleTransaction: transaction,
                        reasonForRefund: state.reasonForRefund,
                        items: state.itemsForRefund,
                      )),
                  actionLabel: 'Issue Refund',
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _onViewSaleTransaction(BuildContext context) {
    context.read<TransactionViewModeCubit>().view(TransactionViewMode.sale);
  }
}
