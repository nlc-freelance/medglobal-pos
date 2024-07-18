import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/data/api/stock_return_api.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/stock_return_paginated_list.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/entities/stock_return_request.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_return/domain/repositories/stock_return_repository.dart';

class StockReturnRepositoryImpl implements StockReturnRepository {
  final StockReturnApi _stockReturnApi;

  StockReturnRepositoryImpl(this._stockReturnApi);

  @override
  Future<Either<Failure, StockReturn>> create(StockReturnRequest payload) async {
    try {
      final response = await _stockReturnApi.create(payload);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, StockReturn>> getStockReturnById(int id) async {
    try {
      final response = await _stockReturnApi.getStockReturnById(id);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, StockReturnPaginatedList>> getStockReturns({int? page, StockOrderStatus? status}) async {
    try {
      final response = await _stockReturnApi.getStockReturns(page: page, status: status);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> update(StockOrderUpdate type,
      {required int id, required StockReturn stockReturn}) async {
    try {
      return Right(await _stockReturnApi.update(type, id: id, stockReturn: stockReturn));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
