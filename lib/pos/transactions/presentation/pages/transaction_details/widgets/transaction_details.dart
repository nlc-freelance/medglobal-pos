import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/datagrid/ordered_items_data_grid.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/datagrid/refund_items_data_grid.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/datagrid/refunded_items_data_grid.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/widgets/reason_for_refund.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/widgets/transaction_details_header.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionDetails extends StatefulWidget {
  const TransactionDetails(this.transaction, {super.key});

  final Transaction transaction;

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  bool _isIssuingRefund = false;

  @override
  void initState() {
    super.initState();
    context.read<RefundRemoteCubit>().reset();
  }

  void _toggleIssueRefund() => setState(() => _isIssuingRefund = !_isIssuingRefund);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RefundRemoteCubit, RefundRemoteState>(
      listener: (context, state) {
        if (state is RefundSuccess) {
          context.read<TransactionCubit>().getTransactionById(state.refund.id!);
          ToastNotification.success(
              context, 'A refund has been successfully issued for ${state.refund.saleTransactionReceiptId}.');
        }
      },
      builder: (context, state) {
        if (state is RefundLoading) {
          return const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2));
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                TransactionDetailsHeader(
                  isIssuingRefund: _isIssuingRefund,
                  onTapReceiptId: _toggleIssueRefund,
                  transaction: widget.transaction,
                ),
                const UIVerticalSpace(60),
                if (widget.transaction.type == TransactionType.SALE) ...[
                  if (_isIssuingRefund) ...[
                    RefundItemsDataGrid(widget.transaction),
                    const ReasonForRefundDetails(),
                  ] else
                    OrderedItemsDataGrid(widget.transaction),
                ],
                if (widget.transaction.type == TransactionType.REFUND) RefundedItemsDataGrid(widget.transaction),
              ],
            ),
            if (widget.transaction.type == TransactionType.SALE && _isIssuingRefund)
              Row(
                children: [
                  if (state is RefundError)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.icons.infoCircle.svg(),
                        const UIHorizontalSpace(8),
                        UIText.labelSemiBold('Something went wrong. ${state.message}', color: UIColors.buttonDanger),
                      ],
                    ),
                  const Spacer(),
                  BlocSelector<RefundCubit, RefundState, Transaction>(
                    selector: (state) => state.refund,
                    builder: (context, refund) {
                      return CancelActionButton(
                        onCancel: () => setState(() => _isIssuingRefund = false),
                        onAction: () => context.read<RefundRemoteCubit>().createRefund(refund),
                        actionLabel: 'Issue Refund',
                      );
                    },
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
