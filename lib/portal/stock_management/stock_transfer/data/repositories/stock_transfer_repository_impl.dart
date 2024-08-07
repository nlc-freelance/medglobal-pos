import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/data/api/stock_transfer_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/new_stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/repositories/stock_transfer_repository.dart';

class StockTransferRepositoryImpl implements StockTransferRepository {
  final StockTransferApi _stockTransferApi;

  StockTransferRepositoryImpl(this._stockTransferApi);

  @override
  Future<Either<Failure, StockTransfer>> create(NewStockTransfer payload) async {
    try {
      final response = await _stockTransferApi.create(payload);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, StockTransfer>> getStockTransferById(int id) async {
    try {
      final response = await _stockTransferApi.getStockTransferById(id);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, StockTransferPaginatedList>> getStockTransfers({int? page, StockOrderStatus? status}) async {
    try {
      final response = await _stockTransferApi.getStockTransfers(page: page, status: status);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, StockTransfer>> update(StockOrderUpdate type,
      {required int id, required StockTransfer stockTransfer}) async {
    try {
      final response = await _stockTransferApi.update(type, id: id, stockTransfer: stockTransfer);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> delete(int id) async {
    try {
      return Right(await _stockTransferApi.delete(id));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
