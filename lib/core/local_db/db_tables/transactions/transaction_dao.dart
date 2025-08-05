import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/sales/domain/entities/order_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(tables: [Transactions, TransactionItems])
class TransactionDao extends DatabaseAccessor<AppDatabase> with _$TransactionDaoMixin {
  TransactionDao(super.db);

  Future<int> insertOrderWithItems(
    TransactionsCompanion order,
    List<TransactionItemsCompanion> items,
  ) async {
    return transaction(() async {
      final transactionId = await into(transactions).insert(order);
      for (final item in items) {
        await into(transactionItems).insert(item.copyWith(transactionId: Value(transactionId)));
      }
      return transactionId;
    });
  }

  /// Retrieves a complete transaction with all transaction items.
  Future<TransactionDetails> getTransactionDetailsById(int id) async {
    // Fetch items for this transaction
    final items = await getTransactionItems(id);

    final transaction = await (select(transactions)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    if (transaction == null) {
      throw UnexpectedException('Transaction not found');
    }

    return TransactionDetails(
      transaction: transaction,
      items: items,
    );
  }

  /// Retrieves all transaction items associated with a given transaction ID from the `transactionItems` table.
  Future<List<TransactionItemModel>> getTransactionItems(int id) async {
    return await (select(transactionItems)..where((tbl) => tbl.transactionId.equals(id))).get();
  }

  Future<void> markAsSynced(int id) {
    return (update(transactions)..where((tbl) => tbl.id.equals(id)))
        .write(const TransactionsCompanion(isSynced: Value(true)));
  }
}

/// Mappers

extension OrderMapper on Order {
  String get _generateReceiptId => 'MG-${branch.code}${DateTime.now().microsecondsSinceEpoch}';

  TransactionsCompanion toDriftCompanion() {
    return TransactionsCompanion.insert(
      receiptId: _generateReceiptId, // MG-LPB-xxxxxxxxxxx
      type: TransactionType.sale.name,
      registerId: register.id,
      registerName: register.name,
      branchId: branch.id,
      branchName: branch.name,
      employeeId: employee.id,
      employeeFirstName: employee.firstName,
      employeeLastName: employee.lastName,
      subtotal: subtotal,
      totalDiscountAmount: Value(totalDiscountAmount),
      total: total,
      amountPaid: amountPaid,
      createdAt: DateTime.now(),
    );
  }
}

extension OrderItemMapper on OrderItem {
  TransactionItemsCompanion toDriftCompanion() {
    return TransactionItemsCompanion.insert(
      transactionId: 1,
      itemId: itemId,
      itemName: itemName,
      quantity: quantity,
      price: price,
      discountType: Value(discountType?.name),
      discountValue: Value(discount?.value),
      discountAmount: Value(discountAmountPerUnit),
      totalDiscountAmount: Value(totalDiscountAmount),
      subtotal: subtotal,
      total: totalPrice,
    );
  }
}

class TransactionDetails {
  final TransactionModel transaction;
  final List<TransactionItemModel> items;

  TransactionDetails({
    required this.transaction,
    required this.items,
  });
}

extension TransactionDetailsMapper on TransactionDetails {
  Transaction toEntity() {
    return Transaction(
      id: transaction.id,
      receiptId: transaction.receiptId,
      type: transaction.type == 'sale' ? TransactionType.sale : TransactionType.refund,
      branch: BranchPartial(
        id: transaction.branchId,
        name: transaction.branchName,
      ),
      register: RegisterPartial(
        id: transaction.registerId,
        name: transaction.registerName,
      ),
      employee: EmployeePartial(
        id: transaction.employeeId,
        firstName: transaction.employeeFirstName,
        lastName: transaction.employeeLastName,
      ),
      items: items.map((item) => item.toEntity()).toList(),
      subtotal: transaction.subtotal,
      totalDiscountAmount: transaction.totalDiscountAmount,
      tax: transaction.tax,
      total: transaction.total,
      amountPaid: transaction.amountPaid,
      createdAt: transaction.createdAt,

      /// If transaction is a refund
      saleTransactionId: transaction.saleTransactionId,
      saleTransactionReceiptId: transaction.saleTransactionReceiptId,
      reasonForRefund: transaction.reasonForReturn,
      status: transaction.status == 'completed' ? ReturnStatus.completed : ReturnStatus.awaitingAction,
    );
  }
}

extension TransactionItemModelMapper on TransactionItemModel {
  TransactionItem toEntity() {
    return TransactionItem(
      id: id,
      itemId: itemId,
      name: itemName,
      quantity: quantity,
      price: price,
      subtotal: subtotal,
      discountType: discountType == 'percentage' ? DiscountType.percentage : DiscountType.peso,
      discountValue: discountValue,
      discountAmount: discountAmount,
      total: total,
    );
  }
}
