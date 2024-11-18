import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_shift/domain/entities/sales_per_shift_details.dart';
import 'package:medglobal_admin_portal/portal/reports/sales_per_shift/domain/usecases/get_sales_per_shift_by_id_usecase.dart';

part 'sales_per_shift_state.dart';

class SalesPerShiftCubit extends Cubit<SalesPerShiftState> {
  final GetSalesPerShiftByIdUseCase _getSalesPerShiftByIdUseCase;
  SalesPerShiftCubit(this._getSalesPerShiftByIdUseCase) : super(SalesPerShiftInitial());

  Future<void> getSalesPerShift(int id) async {
    emit(SalesPerShiftLoading());

    try {
      final result = await _getSalesPerShiftByIdUseCase.call(GetSalesPerShiftByIdParams(id));
      result.fold(
        (error) => emit(SalesPerShiftError(message: error.message)),
        (data) => emit(SalesPerShiftLoaded(salesPerShift: data)),
      );
    } catch (e) {
      emit(SalesPerShiftError(message: e.toString()));
    }
  }
}
