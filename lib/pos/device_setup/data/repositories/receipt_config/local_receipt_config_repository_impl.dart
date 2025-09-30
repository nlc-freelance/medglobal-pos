// import 'package:dartz/dartz.dart';
// import 'package:medglobal_admin_portal/core/errors/failures.dart';
// import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
// import 'package:medglobal_admin_portal/pos/receipt_config/domain/entities/receipt_configuration.dart';
// import 'package:medglobal_admin_portal/pos/receipt_config/data/datasources/local_receipt_config_datasource.dart';
// import 'package:medglobal_admin_portal/pos/receipt_config/domain/repositories/local_receipt_config_repository.dart';
//
// class LocalReceiptConfigRepositoryImpl extends BaseRepository implements LocalReceiptConfigRepository {
//   final LocalReceiptConfigDataSource _localDataSource;
//
//   LocalReceiptConfigRepositoryImpl({
//     required LocalReceiptConfigDataSource localDataSource,
//   }) : _localDataSource = localDataSource;
//
//   @override
//   Future<Either<Failure, void>> upsertReceiptConfig(ReceiptConfiguration config) {
//     return call(() async {
//       await _localDataSource.upsertProducts(config);
//     });
//   }
//
//   @override
//   Future<Either<Failure, void>> clearReceiptConfig() {
//     return call(() async {
//       await _localDataSource.clearReceiptConfig();
//     });
//   }
// }
