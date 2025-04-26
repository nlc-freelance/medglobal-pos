import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/pos/point_of_sale/domain/usecases/create_sale_usecase.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';

part 'sale_remote_state.dart';

class SaleRemoteCubit extends HydratedCubit<SaleRemoteState> {
  final CreateSaleUseCase _createSaleUseCase;

  SaleRemoteCubit(this._createSaleUseCase) : super(SaleInitial());

  Future<void> createSale({required Transaction order, double? receivedAmount}) async {
    if (receivedAmount == null || receivedAmount == 0) {
      emit(const SaleError(message: 'Please enter the cash received to proceed with the transaction.'));
    } else if (receivedAmount < order.total!) {
      emit(const SaleError(message: 'Received cash amount is less than the total amount due.'));
    } else {
      emit(SaleLoading());

      try {
        final id = await SharedPreferencesService.getRegisterId();
        final result = await _createSaleUseCase.call(
          CreateSaleParams(
            id!,
            order.copyWith(amountPaid: receivedAmount),
          ),
        );
        result.fold(
          (error) => emit(SaleError(message: error.message)),
          (data) => emit(SaleSuccess(transaction: data)),
        );
      } catch (e) {
        emit(SaleError(message: e.toString()));
      }
    }
  }

  Future<void> reset() async {
    emit(SaleInitial());
    await super.clear();
  }

  @override
  SaleRemoteState? fromJson(Map<String, dynamic> json) {
    try {
      final stateType = json['stateType'] as String;
      if (stateType == 'SaleSuccess') {
        final transaction = Transaction.fromJson(json['transaction']);
        return SaleSuccess(transaction: transaction);
      } else if (stateType == 'SaleError') {
        final message = json['message'] as String;
        return SaleError(message: message);
      } else {
        return SaleInitial();
      }
    } catch (e) {
      return null; // Handle deserialization error
    }
  }

  @override
  Map<String, dynamic>? toJson(SaleRemoteState state) {
    if (state is SaleSuccess) {
      return {
        'stateType': 'SaleSuccess',
        'transaction': state.transaction.toJson(),
      };
    } else if (state is SaleError) {
      return {
        'stateType': 'SaleError',
        'message': state.message,
      };
    } else {
      return {'stateType': 'SaleInitial'};
    }
  }
}
