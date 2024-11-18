import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_shift/domain/entities/sales_per_shift_paginated_list.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_shift/domain/usecases/get_sales_per_shift_usecase.dart';

part 'sales_per_shift_list_state.dart';

class SalesPerShiftListCubit extends Cubit<SalesPerShiftListState> {
  final GetSalesPerShiftUseCase _getSalesPerShiftUseCase;

  SalesPerShiftListCubit(this._getSalesPerShiftUseCase) : super(SalesPerShiftListInitial());

  Future<void> getSalesPerShift({
    int page = 1,
    int size = 20,
    int? branchId,
    String? startDate,
    String? endDate,
  }) async {
    emit(SalesPerShiftListLoading());

    try {
      final result = await _getSalesPerShiftUseCase.call(GetSalesPerShiftParams(
        page: page,
        size: size,
        branchId: branchId,
        startDate: startDate,
        endDate: endDate,
      ));
      result.fold(
        (error) => emit(SalesPerShiftListError(message: error.message)),
        (data) => emit(SalesPerShiftListLoaded(data: data)),
      );
    } catch (e) {
      emit(SalesPerShiftListError(message: e.toString()));
    }
  }
}
