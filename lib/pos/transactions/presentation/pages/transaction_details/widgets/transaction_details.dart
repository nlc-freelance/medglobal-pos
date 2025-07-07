import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_remote_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_list_by_branch_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/datagrid/refundable_items_data_grid.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/datagrid/refunded_items_data_grid.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/datagrid/transaction_items_data_grid.dart';
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

  void _toggleIssueRefund() {
    setState(() => _isIssuingRefund = !_isIssuingRefund);
    context.read<RefundRemoteCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RefundRemoteCubit, RefundRemoteState>(
      listener: (context, state) {
        if (state is RefundSuccess) {
          context.read<TransactionCubit>().getTransactionById(state.refund.id!);
          context.read<TransactionListByBranchCubit>().addNewTransactionToList(state.refund);
          SnackbarUtil.success(context, 'A refund has been successfully issued.');
        }
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
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
                      RefundableItemsDataGrid(widget.transaction),
                      const ReasonForRefundDetails(),
                    ] else
                      TransactionItemsDataGrid(widget.transaction),
                  ],
                  if (widget.transaction.type == TransactionType.REFUND) RefundedItemsDataGrid(widget.transaction),
                ],
              ),
            ),
            if (widget.transaction.type == TransactionType.SALE && _isIssuingRefund)
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (state is RefundError) ...[
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Assets.icons.infoCircle.svg(),
                            const UIHorizontalSpace(8),
                            Expanded(
                              child: UIText.labelSemiBold(state.message, color: UIColors.buttonDanger),
                            ),
                          ],
                        ),
                      ),
                    ],
                    Expanded(
                      child: BlocSelector<RefundCubit, RefundState, Transaction>(
                        selector: (state) => state.refund,
                        builder: (context, refund) {
                          return CancelActionButton(
                            onCancel: () => setState(() => _isIssuingRefund = false),
                            onAction: () => context.read<RefundRemoteCubit>().createRefund(refund),
                            actionLabel: 'Issue Refund',
                            isLoading: state is RefundLoading,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
