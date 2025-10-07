import 'package:drift/drift.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/helper/branch_code.dart';
import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
import 'package:medglobal_admin_portal/core/local_db/base_dao.dart';
import 'package:medglobal_admin_portal/core/models/paginated_list.dart';
import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/pos/app_session/domain/entities/app_session.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction_item.dart';
import 'package:medglobal_admin_portal/core/local_db/db_tables/db_tables.dart';
import 'package:ulid/ulid.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(tables: [Transactions, TransactionItems])
class TransactionDao extends DatabaseAccessor<AppDatabase> with _$TransactionDaoMixin, BaseDao {
  TransactionDao(super.db);

  Future<int> insertTransaction(
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

  /// Get all transactions from the past 7 days
  Future<PaginatedList<TransactionModel>> getTransactionsFrom7Days({
    required int page,
    required int branchId,
    int size = 20,
    String? search,
  }) {
    return safeCall(() async {
      final sevenDaysAgo = DateTime.now().subtract(const Duration(days: 7));

      // Calculate how many rows to skip based on the page number and page size
      final offset = (page - 1) * size;

      final query = select(transactions)
        ..where((tbl) => tbl.createdAt.isBiggerOrEqualValue(sevenDaysAgo))
        ..limit(size, offset: offset)
        ..orderBy([
          (tbl) => OrderingTerm(
                expression: tbl.createdAt,
                mode: OrderingMode.desc,
              )
        ]);

      applySimpleSearch(
        query: query,
        column: transactions.receiptId,
        search: search,
      );

      final data = await query.get();

      final totalCount = await _countItems(search: search);
      final totalPages = getTotalPages(totalCount: totalCount, size: size);

      return PaginatedList<TransactionModel>(
        items: data,
        currentSize: size,
        currentPage: page,
        totalPages: totalPages,
        totalCount: totalCount,
      );
    });
  }

  /// Calculates total pages based on [size] and a filtered count query.
  int getTotalPages({
    required int totalCount,
    required int size,
  }) {
    return (totalCount / size).ceil();
  }

  void applySimpleSearch({
    required SimpleSelectStatement<dynamic, dynamic> query,
    required Expression<String> column,
    String? search,
  }) {
    if (search != null && search.trim().isNotEmpty) {
      final keyword = search.trim().toLowerCase();
      query.where((_) => column.lower().like('%$keyword%'));
    }
  }

  Future<int> _countItems({String? search}) async {
    // return safeCall(() async {
    final query = selectOnly(transactions, distinct: true)..addColumns([transactions.id.count()]);

    if (search != null && search.trim().isNotEmpty) {
      final keyword = search.trim().toLowerCase();
      final hasMatch = transactions.receiptId.lower().like('%$keyword%');
      query.where(hasMatch);
    }

    final count = await query.getSingle().then((row) => row.read(transactions.id.count()));
    return count ?? 0;
    // });
  }

  /// Retrieves a complete transaction with all transaction items.
  Future<TransactionDetails> getTransactionDetailsById(int id) async {
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

  // Future<void> markAsSynced(int id) {
  //   return (update(transactions)..where((tbl) => tbl.id.equals(id)))
  //       .write(const TransactionsCompanion(isSynced: Value(true)));
  // }

  /// Clear all transactions
  Future<void> clearAll() async {
    return safeCall(() async {
      await delete(transactionItems).go();
      await delete(transactions).go();
    });
  }
}

/// Mappers
extension OrderMapper on Order {
  TransactionsCompanion toTransactionCompanion(AppSession session) {
    final generatedReceiptId = 'MG-${branchCode(session.branchName)}-${Ulid().toString().toUpperCase()}';

    return TransactionsCompanion(
      receiptId: Value(generatedReceiptId),
      type: Value(TransactionType.sale.name),
      registerId: Value(session.registerId),
      registerName: Value(session.registerName),
      branchId: Value(session.branchId),
      branchName: Value(session.branchName),
      employeeId: Value(session.employeeId),
      employeeFirstName: Value(session.employeeFirstName),
      employeeLastName: Value(session.employeeLastName),
      subtotal: Value(subtotal()),
      totalDiscountAmount: Value(totalDiscountAmount()),
      total: Value(total),
      amountPaid: Value(amountPaid!),
      createdAt: Value(DateTime.now()),
    );
  }
}

extension OrderItemMapper on OrderItem {
  TransactionItemsCompanion toTransactionItemCompanion() {
    return TransactionItemsCompanion.insert(
      transactionId: 1, // Placeholder ID
      itemId: itemId,
      itemName: itemName,
      quantity: quantity,
      price: price,
      discountType: Value(discountType?.name),
      discount: Value(discount?.value),
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
      status: transaction.type == 'sale'
          ? null
          : transaction.status == 'completed'
              ? ReturnStatus.completed
              : ReturnStatus.awaitingAction,
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
      discount: discount,
      discountAmount: discountAmount,
      total: total,
    );
  }
}

extension TransactionModelMapper on TransactionModel {
  Transaction toEntity() {
    return Transaction(
      id: id,
      receiptId: receiptId,
      register: RegisterPartial(id: registerId, name: registerName),
      branch: BranchPartial(id: branchId, name: branchName),
      employee: EmployeePartial(id: employeeId, firstName: employeeFirstName, lastName: employeeLastName),
      subtotal: subtotal,
      total: total,
      totalDiscountAmount: totalDiscountAmount,
      type: type == 'sale' ? TransactionType.sale : TransactionType.refund,
      reasonForRefund: reasonForReturn,
      createdAt: createdAt,
    );
  }
}
