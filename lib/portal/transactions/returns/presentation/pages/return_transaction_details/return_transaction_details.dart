import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/pages/return_transaction_details/return_transaction_items_data_grid.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ReturnTransactionDetails extends StatelessWidget {
  const ReturnTransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReturnRemoteCubit, ReturnRemoteState>(
      listener: (context, state) {
        if (state is ReturnSuccess) {
          context.read<ReturnCubit>().setReturn(state.transaction);
          ToastNotification.success(context, 'Return has been successfully completed.');
        }
      },
      builder: (context, state) {
        return BlocSelector<ReturnCubit, ReturnState, Transaction>(
          selector: (state) => state.transaction,
          builder: (context, transaction) {
            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 16,
                        mainAxisExtent: 60,
                      ),
                      shrinkWrap: true,
                      children: [
                        LabelValue.text(
                          label: 'Receipt ID',
                          value: (transaction.receiptId ?? Strings.empty).toString(),
                        ),
                        LabelValue.text(
                          label: 'Date Processed',
                          value: transaction.createdAt != null
                              ? DateFormat('MM/dd/yyyy HH:mm').format(transaction.createdAt!.toLocal())
                              : Strings.empty,
                        ),
                        LabelValue.returnStatus(
                          label: 'Status',
                          status: transaction.status!,
                        ),
                        LabelValue.text(
                          label: 'Employee',
                          value: transaction.employee?.name,
                        ),
                        LabelValue.text(
                          label: 'Branch',
                          value: transaction.branch?.name,
                        ),
                        LabelValue.text(
                          label: 'Reason for Return',
                          value: transaction.reasonForReturn ?? '-',
                        ),
                      ],
                    ),
                    const UIVerticalSpace(40),
                    ReturnTransactionItemsDataGrid(transaction),
                    const UIVerticalSpace(40),
                    if (transaction.status == ReturnStatus.AWAITING_ACTION)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (state is ReturnError) ...[
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
                            child: CancelActionButton(
                              onCancel: () =>
                                  AppRouter.router.pushReplacementNamed(SideMenuTreeItem.RETURN_TRANSACTIONS.name),
                              onAction: () => context.read<ReturnRemoteCubit>().processReturn(transaction),
                              actionLabel: 'Complete',
                              isLoading: state is ReturnLoading,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
