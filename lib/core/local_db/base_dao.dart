// import 'package:medglobal_admin_portal/core/errors/errors.dart';
// import 'package:medglobal_admin_portal/core/local_db/app_database.dart';
// import './native/database_connection.dart';
//
// /// A base Data Access Object (DAO) mixin providing
// /// safe read/write operations with error handling.
// mixin BaseDao {
//   // /// Safe read with error handling.
//   // Future<R> safeRead<R>(Future<R> Function() operation) async {
//   //   try {
//   //     return await operation();
//   //   } catch (e) {
//   //     throw _mapDriftException(e);
//   //   }
//   // }
//
//   /// Safe write with error handling.
//   Future<R> safeCall<R>(Future<R> Function() operation) async {
//     try {
//       return await operation();
//     } catch (e) {
//       throw _mapDriftException(e);
//     }
//   }
//
//   // /// Wraps a Drift transaction safely.
//   // Future<R> safeTransaction<R>(Future<R> Function() operation) {
//   //   return transaction(() => safeCall(operation));
//   // }
//
//   /// Applies a case-insensitive search filter to a text column.
//   // void applySimpleSearch({
//   //   required SimpleSelectStatement<T, dynamic> query,
//   //   required Expression<String> column,
//   //   String? search,
//   // }) {
//   //   try {
//   //     if (search != null && search.trim().isNotEmpty) {
//   //       final keyword = search.trim().toLowerCase();
//   //       query.where((_) => column.lower().like('%$keyword%'));
//   //     }
//   //   } catch (e) {
//   //     throw _mapDriftException(e);
//   //   }
//   // }
//
//   /// Calculates total pages based on [size] and a filtered count query.
//   int getTotalPages({
//     required int totalCount,
//     required int size,
//   }) {
//     return (totalCount / size).ceil();
//   }
// }
//
// /// Internal helper to execute [operation] and map exceptions into [AppException].
// ///
// /// [operation]: The async database operation to execute.
// /// [label]: Descriptive label used for logging or debugging.
// ///
// /// Returns the result of the operation on success.
// /// Throws a mapped [AppException] on failure.
// // Future<R> _call<R>(Future<R> Function() operation) async {
// //   try {
// //     return await operation();
// //   } catch (e) {
// //     throw _mapDriftException(e);
// //   }
// // }
//
// AppException _mapDriftException(Object e) {
//   if (e is SqliteException) {
//     return LocalDatabaseException('Database error: ${e.message}');
//   } else if (e is DriftWrappedException) {
//     return LocalDatabaseException('Query failed: ${e.message}');
//   } else if (e is InvalidDataException) {
//     return LocalDatabaseException('Data mapping error: ${e.toString()}');
//   } else {
//     return UnexpectedException('Unexpected error: ${e.toString()}');
//   }
// }

import 'db_exceptions/db_exception_mapper.dart';

mixin BaseDao {
  Future<T> safeCall<T>(Future<T> Function() action) async {
    try {
      return await action();
    } catch (e) {
      throw mapDbException(e); // uses the platform-specific mapper
    }
  }
}
