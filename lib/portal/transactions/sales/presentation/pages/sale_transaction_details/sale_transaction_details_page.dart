import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/transactions/bloc/transaction_bloc.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/pages/sale_transaction_details/sale_transaction_items_data_grid.dart';
// import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SaleTransactionDetailsPage extends StatefulWidget {
  const SaleTransactionDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<SaleTransactionDetailsPage> createState() => _SaleTransactionDetailsPageState();
}

class _SaleTransactionDetailsPageState extends State<SaleTransactionDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionBloc>().add(TransactionEvent.getTransactionById(int.parse(widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PageHeader(title: 'Sale Details'),
            const UIVerticalSpace(20),
            state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: UIColors.primary,
                  strokeWidth: 2,
                ),
              ),
              loaded: (transaction) => Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PageSectionTitle(title: 'General Information'),
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
                            value: (transaction.receiptId).toString(),
                          ),
                          LabelValue.text(
                            label: 'Time Ordered',
                            value: DateFormat('MM/dd/yyyy HH:mm').format(transaction.createdAt),
                          ),
                          LabelValue.type(
                            label: 'Transaction Type',

                            /// Only sale for now
                            type: TransactionType.sale,
                          ),
                          LabelValue.text(
                            label: 'Employee',
                            value: transaction.employee.name,
                          ),
                          LabelValue.text(
                            label: 'Branch',
                            value: transaction.branch.name,
                          ),
                          LabelValue.text(
                            label: 'Register',
                            value: (transaction.register.id).toString(),
                          ),
                        ],
                      ),
                      const UIVerticalSpace(40),
                      SaleTransactionItemsDataGrid(transaction),
                    ],
                  ),
                ),
              ),
              failure: (message) => FailureView(message),
              orElse: () => const SizedBox(),
            ),
            // if (state is TransactionByIdLoading) ...[
            //   const UIVerticalSpace(30.0),
            //   const Center(
            //     child: CircularProgressIndicator(
            //       color: UIColors.primary,
            //       strokeWidth: 2,
            //     ),
            //   ),
            // ],
            // if (state is TransactionByIdError) Text(state.message),
            // if (state is TransactionByIdSuccess)
            //   Expanded(
            //     child: SingleChildScrollView(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           const PageSectionTitle(title: 'General Information'),
            //           GridView(
            //             physics: const NeverScrollableScrollPhysics(),
            //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 3,
            //               crossAxisSpacing: 10,
            //               mainAxisSpacing: 16,
            //               mainAxisExtent: 60,
            //             ),
            //             shrinkWrap: true,
            //             children: [
            //               LabelValue.text(
            //                 label: 'Receipt ID',
            //                 value: (state.transaction.receiptId).toString(),
            //               ),
            //               LabelValue.text(
            //                 label: 'Time Ordered',
            //                 value: DateFormat('MM/dd/yyyy HH:mm').format(state.transaction.createdAt),
            //               ),
            //               LabelValue.type(
            //                 label: 'Transaction Type',

            //                 /// Only sale for now
            //                 type: TransactionType.sale,
            //               ),
            //               LabelValue.text(
            //                 label: 'Employee',
            //                 value: state.transaction.employee.name,
            //               ),
            //               LabelValue.text(
            //                 label: 'Branch',
            //                 value: state.transaction.branch.name,
            //               ),
            //               LabelValue.text(
            //                 label: 'Register',
            //                 value: (state.transaction.register.id).toString(),
            //               ),
            //             ],
            //           ),
            //           const UIVerticalSpace(40),
            //           SaleTransactionItemsDataGrid(state.transaction),
            //         ],
            //       ),
            //     ),
            //   ),
          ],
        );
      },
    );
  }
}
