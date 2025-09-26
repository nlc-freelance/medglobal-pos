import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medglobal_admin_portal/core/utils/shared_preferences_service.dart';
import 'package:medglobal_admin_portal/pos/register/domain/entities/order.dart';
import 'package:medglobal_admin_portal/pos/register/domain/usecases/create_sale_usecase.dart';
import 'package:medglobal_admin_portal/pos/transactions/data/dto/transaction/transaction_dto.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';

part 'sale_event.dart';
part 'sale_state.dart';
part 'sale_bloc.freezed.dart';

class SaleBloc extends HydratedBloc<SaleEvent, SaleState> {
  final CreateSaleUseCase _createSaleUseCase;
  // final SaleRepository _repository;

  SaleBloc({required CreateSaleUseCase createSaleUseCase})
      : _createSaleUseCase = createSaleUseCase,
        super(const SaleState.initial()) {
    on<_CreateSale>(_onCreateSale);
    on<_Reset>(_onReset);
  }

  Future<void> _onCreateSale(_CreateSale event, emit) async {
    // final amountPaid = event.order.amountPaid;

    // if (amountPaid == null || amountPaid == 0) {
    //   emit(const SaleState.failure('Please enter the amount received to proceed with the transaction.'));
    //   return;
    // }
    //
    // if (amountPaid < event.order.total) {
    //   emit(const SaleState.failure('Received amount is less than the total amount due.'));
    //   return;
    // }

    emit(const SaleState.processing());

    try {
      final result = await _createSaleUseCase.call(event.order, event.amountPaid);

      // final registerId = await SharedPreferencesService.getRegisterId();
      //
      // final result = await _repository.createSale(registerId: registerId!, order: event.order);
      //
      result.fold(
        (error) => emit(SaleState.failure(error.message)),
        (transaction) => emit(SaleState.success(transaction)),
      );
    } catch (e) {
      emit(SaleState.failure(e.toString()));
    }
  }

  void _onReset(_, emit) => emit(const SaleState.initial());

  @override
  SaleState? fromJson(Map<String, dynamic> json) {
    try {
      final transactionJson = json['transaction'] as Map<String, dynamic>?;
      if (transactionJson != null) {
        final dto = TransactionDto.fromJson(transactionJson);
        return SaleState.success(dto.toDomain());
      }

      final message = json['message'] as String?;
      if (message != null) {
        return SaleState.failure(message);
      }

      return const SaleState.initial();
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(SaleState state) {
    try {
      return state.when(
        initial: () => {},
        processing: () => {},
        success: (transaction) => {'transaction': TransactionDto.fromDomain(transaction).toJson()},
        failure: (message) => {'message': message},
      );
    } catch (_) {
      return null;
    }
  }
}
