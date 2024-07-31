import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order/order.dart';
import 'package:medglobal_admin_portal/pos/register/domain/usecases/create_sale_usecase.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

part 'sale_remote_state.dart';

class SaleRemoteCubit extends Cubit<SaleRemoteState> {
  final CreateSaleUseCase _createSaleUseCase;

  SaleRemoteCubit(this._createSaleUseCase) : super(SaleInitial());

  Future<void> createSale({required int registerId, required Order order, double? receivedAmount}) async {
    if (receivedAmount == null || receivedAmount == 0) {
      emit(const SaleError(message: 'Please enter the amount received to complete the transaction.'));
    } else {
      emit(SaleLoading());

      try {
        final result = await _createSaleUseCase.call(CreateSaleParams(registerId, order));
        result.fold(
          (error) => emit(SaleError(message: error.message)),
          (data) => emit(SaleSuccess(transaction: data)),
        );
      } catch (e) {
        emit(SaleError(message: e.toString()));
      }
    }
  }

  void reset() => emit(SaleInitial());
}
