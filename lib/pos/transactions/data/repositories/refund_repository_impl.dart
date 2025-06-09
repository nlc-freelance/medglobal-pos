import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/dto/refund/create_refund_dto.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/data/dto/refund/create_refund_item_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/api/refund_api.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/refund_item.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/repositories/refund_repository.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/response/transaction_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

class RefundRepositoryImpl implements RefundRepository {
  final RefundApi _refundApi;

  RefundRepositoryImpl(this._refundApi);

  @override
  Future<Either<Failure, Transaction>> createRefund({
    required int registerId,
    required int saleId,
    required List<RefundItem> items,
    String? reasonForRefund,
  }) async {
    try {
      final requestDto = CreateRefundDto(
        registerId: registerId,
        saleTransactionId: saleId,
        items: items.map((item) => CreateRefundItemDto.fromDomain(item)).toList(),
        notes: reasonForRefund,
      );

      final response = await _refundApi.createRefund(requestDto);

      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(ServerFailure(e.message!));
    }
  }
}
