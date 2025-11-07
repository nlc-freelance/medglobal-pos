import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/domain/entities/supply_need.dart';
import 'package:medglobal_admin_portal/portal/stock_management/supply_needs/domain/usecases/get_supply_needs_usecase.dart';

part 'supply_needs_state.dart';

class SupplyNeedsCubit extends Cubit<SupplyNeedsState> {
  final GetSupplyNeedsUseCase _getSupplyNeedsUseCase;

  SupplyNeedsCubit(this._getSupplyNeedsUseCase) : super(SupplyNeedsInitial());

  Future<void> getSupplyNeeds({int? branchId}) async {
    emit(SupplyNeedsLoading());

    try {
      final result = await _getSupplyNeedsUseCase.call(GetSupplyNeedsParams(branchId: branchId));
      result.when(
        success: (data) => emit(SupplyNeedsLoaded(supplyNeeds: data)),
        failure: (error) => emit(SupplyNeedsError(message: error.message)),
      );
    } catch (e) {
      emit(SupplyNeedsError(message: e.toString()));
    }
  }
}
