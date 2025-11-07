import 'package:medglobal_admin_portal/core/enums/transaction_enum.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/transactions/repositories/transaction_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/datasources/transactions/transaction_api.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

/// Concrete implementation of [TransactionRepository] that uses [TransactionApi] for API calls
/// and [BaseRepository] to centralize error handling.
class TransactionRepositoryImpl extends BaseRepository implements TransactionRepository {
  final TransactionApi _api;

  TransactionRepositoryImpl({required TransactionApi api}) : _api = api;

  @override
  Future<ApiResult<PaginatedList<Transaction>>> getTransactions({
    TransactionType? type,
    required int page,
    required int size,
    String? search,
    int? shift,
    int? branch,
    bool? isAllBranches,
    String? startDate,
    String? endDate,
  }) async {
    return call(() async {
      final responseDto = await _api.getTransactions(
        page: page,
        size: size,
        type: type,
        search: search,
        shift: shift,
        branch: branch,
        isAllBranches: isAllBranches,
        startDate: startDate,
        endDate: endDate,
      );

      return responseDto.convert((item) => item.toDomain());
    });
    // try {
    //   final responseDto = await _api.getTransactions(
    //     page: page,
    //     size: size,
    //     type: type,
    //     search: search,
    //     shift: shift,
    //     branch: branch,
    //     isAllBranches: isAllBranches,
    //     startDate: startDate,
    //     endDate: endDate,
    //   );
    //
    //   return Right(responseDto.convert((item) => item.toDomain()));
    // } on DioException catch (e) {
    //   return Left(ServerFailure(e.message!));
    // }
  }

  @override
  Future<ApiResult<Transaction>> getTransactionById(int id) async {
    return call(() async {
      final response = await _api.getTransactionById(id);
      return response.toDomain();
    });
    // try {
    //   final response = await _api.getTransactionById(id);
    //   return Right(response.toDomain());
    //   // } on DioException catch (e) {
    //   //   return Left(ServerFailure(e.message!));
    //   // }
    // } on ServerException catch (e) {
    //   return Left(ServerFailure(e.message));
    // } on UnexpectedException catch (e) {
    //   return Left(UnexpectedFailure(e.message));
    // } catch (e) {
    //   return Left(UnexpectedFailure(e.toString()));
    // }
  }
}
