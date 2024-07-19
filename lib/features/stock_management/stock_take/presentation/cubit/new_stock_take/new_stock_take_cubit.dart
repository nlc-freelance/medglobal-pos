import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/domain/entities/new_stock_take.dart';

part 'new_stock_take_state.dart';

class NewStockTakeCubit extends Cubit<NewStockTakeState> {
  NewStockTakeCubit() : super(NewStockTakeState.initial());

  void setBranchId(int value) => emit(NewStockTakeState(state.payload.copyWith(targetBranch: value)));
  void setSupplierId(int value) => emit(NewStockTakeState(state.payload.copyWith(targetSupplier: value)));
  void setIsAllSupplier(bool value) => emit(NewStockTakeState(state.payload.copyWith(isAllSupplier: value)));
}
