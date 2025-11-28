import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/data/api/return_api.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/domain/repositories/return_repository.dart';
import 'package:medglobal_admin_portal/portal/transactions/return/data/dto/return/update_return_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

/// Concrete implementation of [ReturnRepository] that uses [ReturnApi] for API calls
/// and [BaseRepository] to centralize error handling.
class ReturnRepositoryImpl extends BaseRepository implements ReturnRepository {
  final ReturnApi _api;

  ReturnRepositoryImpl(this._api);

  @override
  Future<ApiResult<Transaction>> update(Transaction transaction) {
    return call(() async {
      final payload = UpdateReturnDto.fromDomain(transaction);
      final response = await _api.update(transaction.id, payload);

      return response.toDomain();
    });
  }
}
