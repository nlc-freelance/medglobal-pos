// import 'package:dartz/dartz.dart';
// import 'package:medglobal_admin_portal/core/errors/failures.dart';
// import 'package:medglobal_admin_portal/core/local_db/base_repository.dart';
// import 'package:medglobal_admin_portal/core/local_db/native/session/session_dao.dart';
// import 'package:medglobal_admin_portal/pos/pos_session/domain/entities/pos_session.dart';
// import 'package:medglobal_admin_portal/pos/pos_session/data/datasources/session_local_datasource.dart';
// import 'package:medglobal_admin_portal/pos/pos_session/domain/repository/session_repository.dart';

// class SessionRepositoryImpl extends BaseRepository implements SessionRepository {
//   // final SessionLocalDataSource _local;

//   SessionRepositoryImpl({required SessionLocalDataSource local}) : _local = local;

//   @override
//   Future<Either<Failure, void>> saveSession(Session session) {
//     return call(() async {
//       return await _local.saveSession(session);
//     });
//   }

//   @override
//   Future<Either<Failure, void>> clearSession() {
//     return call(() async {
//       return await _local.clearSession();
//     });
//   }

//   @override
//   Future<Either<Failure, Session?>> getActiveSession() {
//     return call(() async {
//       final session = await _local.getActiveSession();
//       return session?.toDomain();
//     });
//   }
// }
