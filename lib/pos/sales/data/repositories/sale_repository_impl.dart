// import 'dart:convert';
//
// import 'package:dartz/dartz.dart' hide Order;
// import 'package:get_it/get_it.dart';
// import 'package:medglobal_admin_portal/core/enums/transaction_enum.dart';
// import 'package:medglobal_admin_portal/core/errors/failures.dart';
// import 'package:medglobal_admin_portal/core/local_db/base_repository.dart';
// import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
// import 'package:medglobal_admin_portal/portal/employee_management/domain/entities/employee.dart';
// import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
// import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
// import 'package:medglobal_admin_portal/pos/point_of_sale/data/dto/sale/create_sale_dto.dart';
// import 'package:medglobal_admin_portal/pos/sales/data/datasources/local/sale_local_datasource.dart';
// import 'package:medglobal_admin_portal/pos/sales/data/datasources/remote/sale_remote_datasource.dart';
// import 'package:medglobal_admin_portal/pos/sales/data/dtos/order_payload.dart';
// import 'package:medglobal_admin_portal/pos/sales/domain/entities/order.dart';
// import 'package:medglobal_admin_portal/pos/sales/domain/repositories/sale_repository.dart';
// import 'package:medglobal_admin_portal/pos/sync/network_service.dart';
// import 'package:medglobal_admin_portal/pos/sync/sync_queue_item.dart';
// import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
//
// class SaleRepositoryImpl extends BaseRepository implements SaleRepository {
//   final SaleLocalDataSource _local;
//   final SaleRemoteDatasource _remote;
//   final NetworkService _network;
//
//   SaleRepositoryImpl({
//     required SaleLocalDataSource local,
//     required SaleRemoteDatasource remote,
//     required NetworkService network,
//   })  : _local = local,
//         _remote = remote,
//         _network = network;
//
//   @override
//   Future<Either<Failure, Transaction>> createSale(Order order) async {
//     return call(() async {
//     // final transaction = await _local.insertOrder(order);
//     //
//     // // Check internet connectivity
//     // final isOnline = await _network.hasConnection();
//     //
//     // if (isOnline) {
//     //   try {
//     //     // Send immediately
//     //     await _remote.createSale(OrderPayload.fromDomain(order.register.id, order));
//     //     await _local.markAsSynced(transaction.id);
//     //   } catch (_) {
//     //     // API call failed, add to sync queue
//     //     await _enqueueOrder(transaction);
//     //   }
//     // } else {
//     //   // No internet, add to sync queue
//     //   await _enqueueOrder(transaction);
//     // }
//     //
//     // return transaction;
//     //
//
//
//     // return Future<Either<Failure, Transaction>>();
//     // Transaction(
//     //   id: 1,
//     //   receiptId: 'receiptId',
//     //   type: TransactionType.sale,
//     //   register: RegisterPartial(id: 1, name: ''),
//     //   branch: BranchPartial(id: 1, name: 'name'),
//     //   employee: EmployeePartial(id: 1, firstName: '', lastName: ''),
//     //   items: [],
//     //   createdAt: DateTime.now(),
//     // );
//     });
//   }
//
//   Future<void> _enqueueOrder(Transaction transaction) async {
//     // final item = SyncQueueCompanion.insert(
//     //   table: 'transactions',
//     //   action: 'insert',
//     //   payload: jsonEncode(transaction.toJson()),
//     //   status: 'pending',
//     // );
//     // await GetIt.I<AppDatabase>().syncQueueDao.enqueue(item);
//   }
// }
