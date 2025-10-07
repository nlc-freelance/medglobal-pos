import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_remote_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/cubit/return_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/presentation/pages/return_transaction_details/return_transaction_items_data_grid.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ReturnTransactionDetails extends StatelessWidget {
  const ReturnTransactionDetails({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReturnRemoteCubit, ReturnRemoteState>(
      listener: (context, state) {
        if (state is ReturnSuccess) {
          context.read<ReturnCubit>().setReturnItems(state.transaction.items ?? []);
          SnackbarUtil.success(context, 'Return has been successfully completed.');

          // Reload list
          context.read<ReturnTransactionListCubit>().getTransactions();
        }
      },
      builder: (context, state) {
        return BlocSelector<ReturnCubit, ReturnState, List<TransactionItem>>(
          selector: (state) => state.items,
          builder: (context, returnedItems) {
            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PageSectionTitle(title: 'General Information'),
                    Row(
                      spacing: 24,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: LabelValue.text(
                            label: 'Receipt ID',
                            value: (transaction.receiptId).toString(),
                          ),
                        ),
                        Expanded(
                          child: LabelValue.text(
                            label: 'Refunded from',
                            value: (transaction.saleTransactionReceiptId ?? Strings.empty).toString(),
                          ),
                        ),
                        Expanded(
                          child: LabelValue.text(
                            label: 'Date Processed',
                            value: DateFormat('MM/dd/yyyy HH:mm').format(transaction.createdAt),
                          ),
                        ),
                        Expanded(
                          child: LabelValue.returnStatus(
                            label: 'Status',
                            status: transaction.status!,
                          ),
                        ),
                      ],
                    ),
                    const UIVerticalSpace(40),
                    Row(
                      spacing: 24,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: LabelValue.text(
                            label: 'Employee',
                            value: transaction.employee.name,
                          ),
                        ),
                        Expanded(
                          child: LabelValue.text(
                            label: 'Branch',
                            value: transaction.branch.name,
                          ),
                        ),
                        Expanded(
                          child: LabelValue.text(
                            label: 'Reason for Return',
                            value: transaction.reasonForRefund ?? Strings.noValue,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    // GridView(
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 4,
                    //     crossAxisSpacing: 10,
                    //     mainAxisSpacing: 16,
                    //     mainAxisExtent: 60,
                    //   ),
                    //   shrinkWrap: true,
                    //   children: [
                    //     LabelValue.text(
                    //       label: 'Receipt ID',
                    //       value: (transaction.receiptId).toString(),
                    //     ),
                    //     LabelValue.text(
                    //       label: 'Refunded from',
                    //       value: (transaction.saleTransactionReceiptId ?? Strings.empty).toString(),
                    //     ),
                    //     LabelValue.text(
                    //       label: 'Date Processed',
                    //       value: DateFormat('MM/dd/yyyy HH:mm').format(transaction.createdAt),
                    //     ),
                    //     LabelValue.returnStatus(
                    //       label: 'Status',
                    //       status: transaction.status!,
                    //     ),
                    //     LabelValue.text(
                    //       label: 'Employee',
                    //       value: transaction.employee.name,
                    //     ),
                    //     LabelValue.text(
                    //       label: 'Branch',
                    //       value: transaction.branch.name,
                    //     ),
                    //     LabelValue.text(
                    //       label: 'Reason for Return',
                    //       value: transaction.reasonForRefund ?? '-',
                    //     ),
                    //   ],
                    // ),
                    const UIVerticalSpace(40),
                    ReturnTransactionItemsDataGrid(transaction),
                    const UIVerticalSpace(40),
                    if (transaction.status == ReturnStatus.awaitingAction)
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
                              onCancel: () => context.goNamed('returnTransactionList'),
                              onAction: () => context
                                  .read<ReturnRemoteCubit>()
                                  .processReturn(transaction.copyWith(items: returnedItems)),
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
