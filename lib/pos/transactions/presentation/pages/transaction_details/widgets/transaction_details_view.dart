import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/refund_bloc/refund_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/datagrid/refunded_items_data_grid.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/datagrid/transaction_items_data_grid.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/widgets/issue_refund/issue_refund_view.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/pages/transaction_details/widgets/transaction_details_header.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionDetails2 extends StatefulWidget {
  const TransactionDetails2({super.key, required this.transaction});

  final Transaction transaction;

  @override
  State<TransactionDetails2> createState() => _TransactionDetails2State();
}

class _TransactionDetails2State extends State<TransactionDetails2> {
  bool _isIssuingRefund = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TransactionDetailsHeader(
          isIssuingRefund: _isIssuingRefund,
          onTapReceiptId: _toggleIssueRefund,
          transaction: widget.transaction,
        ),
        const UIVerticalSpace(60),
        if (isSale && _isIssuingRefund)
          IssueRefundView(
            transaction: widget.transaction,
            onCancel: () => setState(() => _isIssuingRefund = false),
          ),
        if (isSale) TransactionItemsDataGrid(widget.transaction),
        if (isRefund) RefundedItemsDataGrid(widget.transaction),
      ],
    );
  }

  void _toggleIssueRefund() {
    setState(() => _isIssuingRefund = !_isIssuingRefund);
    context.read<RefundBloc>().add(const RefundEvent.reset());
  }

  bool get isSale => widget.transaction.type == TransactionType.sale;
  bool get isRefund => widget.transaction.type == TransactionType.refund;
}
