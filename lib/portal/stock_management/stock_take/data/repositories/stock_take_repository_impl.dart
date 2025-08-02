import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/errors/errors.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/data/api/stock_take_api.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/new_stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_items_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/repositories/stock_take_repository.dart';

class StockTakeRepositoryImpl implements StockTakeRepository {
  final StockTakeApi _stockTakeApi;

  StockTakeRepositoryImpl(this._stockTakeApi);

  @override
  Future<Either<Failure, StockTake>> create(NewStockTake payload) async {
    try {
      final response = await _stockTakeApi.create(payload);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, StockTake>> getStockTakeById(int id) async {
    try {
      final response = await _stockTakeApi.getStockTakeById(id);
      return Right(response.toEntity());
      // } on DioException catch (e) {
      //   return Left(ServerFailure(e.message!));
      // }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnexpectedException catch (e) {
      return Left(UnexpectedFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, StockTakePaginatedList>> getStockTakes({
    required int page,
    required int size,
    StockOrderStatus? status,
    String? startDate,
    String? endDate,
  }) async {
    try {
      final response = await _stockTakeApi.getStockTakes(
        page: page,
        size: size,
        status: status,
        startDate: startDate,
        endDate: endDate,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, StockTake>> update(
    StockOrderUpdate type, {
    required int id,
    required StockTake stockTake,
    int? uncountedItemsValue,
  }) async {
    try {
      final response = await _stockTakeApi.update(
        type,
        id: id,
        stockTake: stockTake,
        uncountedItemsValue: uncountedItemsValue,
      );
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, StockTakeItemsPaginatedList>> getItemsById(
    int id, {
    required int page,
    required int size,
    required bool isCounted,
    String? search,
  }) async {
    try {
      final response = await _stockTakeApi.getItemsById(
        id,
        page: page,
        size: size,
        isCounted: isCounted,
        search: search,
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, void>> updateStockItemsById({required int id, required Map<int, int?> items}) async {
    try {
      final response = await _stockTakeApi.updateStockTakeItemsById(id: id, items: items);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
