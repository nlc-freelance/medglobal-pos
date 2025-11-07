import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/new_stock_return.dart';

part 'new_stock_return_state.dart';

class NewStockReturnCubit extends Cubit<NewStockReturnState> {
  NewStockReturnCubit() : super(NewStockReturnState.initial());

  void setBranchId(int value) => emit(NewStockReturnState(state.payload.copyWith(branch: value)));
  void setSupplierId(int value) => emit(NewStockReturnState(state.payload.copyWith(supplier: value)));

  void reset() => emit(NewStockReturnState.initial());
}
