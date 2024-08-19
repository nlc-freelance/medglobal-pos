import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/pages/return_transaction_details/return_transaction_items_data_grid.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/cubit/transaction_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ReturnTransactionDetailsPage extends StatelessWidget {
  const ReturnTransactionDetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(
              title: 'Sale Details',
              subtitle: Strings.subtitlePlaceholder,
            ),
            if (state is TransactionByIdLoading) ...[
              const UIVerticalSpace(30.0),
              const Center(
                child: CircularProgressIndicator(
                  color: UIColors.primary,
                  strokeWidth: 2,
                ),
              ),
            ],
            if (state is TransactionByIdError) Text(state.message),
            if (state is TransactionByIdSuccess)
              Expanded(
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
                            value: (state.transaction.id ?? Strings.empty).toString(),
                          ),
                          LabelValue.text(
                            label: 'Date Processed',
                            value: state.transaction.createdAt != null
                                ? DateFormat('MM/dd/yyyy HH:mm').format(state.transaction.createdAt!.toLocal())
                                : Strings.empty,
                          ),
                          LabelValue.type(
                            label: 'Status',

                            /// Only sale for now
                            type: TransactionType.SALE,
                          ),
                          LabelValue.text(
                            label: 'Employee',
                            value: state.transaction.employee?.name,
                          ),
                          LabelValue.text(
                            label: 'Branch',
                            value: state.transaction.branch?.name,
                          ),
                          LabelValue.text(
                            label: 'Reason for Return',
                            value: 'Damaged Items',
                          ),
                        ],
                      ),
                      const UIVerticalSpace(40),
                      ReturnTransactionItemsDataGrid(state.transaction),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
