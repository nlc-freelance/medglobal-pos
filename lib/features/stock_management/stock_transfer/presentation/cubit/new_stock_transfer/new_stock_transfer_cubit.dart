import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_transfer/domain/entities/new_stock_transfer.dart';

part 'new_stock_transfer_state.dart';

class NewStockTransferCubit extends Cubit<NewStockTransferState> {
  NewStockTransferCubit() : super(NewStockTransferState.initial());

  void setSourceBranchId(int value) => emit(NewStockTransferState(state.payload.copyWith(sourceBranchId: value)));
  void setDestinationBranchId(int value) =>
      emit(NewStockTransferState(state.payload.copyWith(destinationBranchId: value)));
  void setAutoFill(bool value) => emit(NewStockTransferState(state.payload.copyWith(isAutoFill: value)));
}
