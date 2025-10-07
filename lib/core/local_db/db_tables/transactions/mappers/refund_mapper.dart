import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

extension RefundMapper on Transaction {
  TransactionsCompanion toRefundTransactionCompanion() {
    // final generatedReceiptId = 'MG-${branchCode(branch.name)}-${Ulid().toString().toUpperCase()}';

    return TransactionsCompanion(
      receiptId: Value(receiptId),
      type: Value(type.name),
      status: Value(status?.name),
      saleTransactionId: Value(saleTransactionId),
      saleTransactionReceiptId: Value(saleTransactionReceiptId),
      registerId: Value(register.id),
      registerName: Value(register.name),
      branchId: Value(branch.id),
      branchName: Value(branch.name),
      employeeId: Value(employee.id),
      employeeFirstName: Value(employee.firstName),
      employeeLastName: Value(employee.lastName),
      subtotal: Value(subtotal ?? 0),
      totalDiscountAmount: Value(totalDiscountAmount ?? 0),
      total: Value(total ?? 0),
      reasonForReturn: Value(reasonForRefund),
      createdAt: Value(createdAt),
    );
  }
}

extension RefundItemMapper on RefundItem {
  TransactionItemsCompanion toTransactionItemCompanion() {
    return TransactionItemsCompanion.insert(
      transactionId: 1, // Placeholder ID
      itemId: id,
      itemName: name,
      quantity: refundQuantity ?? 0,
      price: price,
      discountType: Value(discountType?.name),
      discount: Value(discount),
      discountAmount: Value(getDiscountAmountPerUnit()),
      totalDiscountAmount: Value(getTotalDiscountAmount()),
      subtotal: subtotal,
      total: getTotal(),
    );
  }
}
