import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/new_stock_transfer.dart';

part 'new_stock_transfer_state.dart';

class NewStockTransferCubit extends Cubit<NewStockTransferState> {
  NewStockTransferCubit() : super(NewStockTransferState.initial());

  void setSourceBranchId(int value) => emit(NewStockTransferState(state.payload.copyWith(fromBranch: value)));
  void setDestinationBranchId(int value) => emit(NewStockTransferState(state.payload.copyWith(toBranch: value)));
  void setAutoFill(bool value) => emit(NewStockTransferState(state.payload.copyWith(isAutoFill: value)));

  void reset() => emit(NewStockTransferState.initial());
}
