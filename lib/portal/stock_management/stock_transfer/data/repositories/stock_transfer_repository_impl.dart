import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/helper/base_repository.dart';
import 'package:medglobal_admin_portal/core/network/network.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/data/api/stock_transfer_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/new_stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/repositories/stock_transfer_repository.dart';

/// Concrete implementation of [StockTransferRepository] that uses [StockTransferApi] for API calls
/// and [BaseRepository] to centralize error handling.
class StockTransferRepositoryImpl extends BaseRepository implements StockTransferRepository {
  final StockTransferApi _api;

  StockTransferRepositoryImpl(this._api);

  @override
  Future<ApiResult<StockTransfer>> create(NewStockTransfer payload) {
    return call(() async {
      final response = await _api.create(payload);
      return response.toEntity();
    });
  }

  @override
  Future<ApiResult<StockTransfer>> getStockTransferById(int id) {
    return call(() async {
      final response = await _api.getStockTransferById(id);
      return response.toEntity();
    });
  }

  @override
  Future<ApiResult<StockTransferPaginatedList>> getStockTransfers({
    required int page,
    required int size,
    StockOrderStatus? status,
    int? sourceBranchId,
    int? destinationBranchId,
    String? startDate,
    String? endDate,
  }) {
    return call(() async {
      final response = await _api.getStockTransfers(
        page: page,
        size: size,
        status: status,
        sourceBranchId: sourceBranchId,
        destinationBranchId: destinationBranchId,
        startDate: startDate,
        endDate: endDate,
      );
      return response;
    });
  }

  @override
  Future<ApiResult<StockTransfer>> update(
    StockOrderUpdate type, {
    required int id,
    required StockTransfer stockTransfer,
  }) {
    return call(() async {
      final response = await _api.update(type, id: id, stockTransfer: stockTransfer);
      return response.toEntity();
    });
  }

  @override
  Future<ApiResult<void>> delete(int id) {
    return call(() async {
      return await _api.delete(id);
    });
  }
}
