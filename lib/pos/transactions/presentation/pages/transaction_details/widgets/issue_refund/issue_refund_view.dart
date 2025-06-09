import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page_error_notice.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/pos_transaction_list_bloc/pos_transaction_list_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/refund_bloc/refund_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_form_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_list_by_branch_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/datagrid/refundable_items_data_grid.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/widgets/issue_refund/reason_for_refund.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class IssueRefundView extends StatelessWidget {
  const IssueRefundView({super.key, required this.transaction, required this.onCancel});

  final Transaction transaction;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RefundBloc, RefundState>(
      listener: (context, state) => state.maybeWhen(
        success: (refund) => _onSuccess(context, refund),
        orElse: () => {},
      ),
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RefundableItemsDataGrid(transaction),
            const ReasonForRefundDetails(),
            state.maybeWhen(
              failure: (message) => PageErrorNotice(message: message),
              orElse: () => const SizedBox(),
            ),
            BlocSelector<RefundFormCubit, RefundFormState, RefundFormState>(
              selector: (state) => state,
              builder: (context, state) {
                return CancelActionButton(
                  onCancel: () => onCancel,
                  onAction: () => context.read<RefundBloc>().add(RefundEvent.createRefund(
                        registerId: transaction.register.id,
                        saleId: transaction.saleTransactionId!,
                        items: state.items,
                        reasonForRefund: state.reasonForRefund,
                      )),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _onSuccess(BuildContext context, Transaction refund) {
    // context.read<TransactionListByBranchCubit>().addNewTransactionToList(refund);
    context.read<PosTransactionListBloc>().add(PosTransactionListEvent.addTransactionToList(refund));
    ToastNotification.success(context, 'A refund has been successfully issued.');
  }
}
