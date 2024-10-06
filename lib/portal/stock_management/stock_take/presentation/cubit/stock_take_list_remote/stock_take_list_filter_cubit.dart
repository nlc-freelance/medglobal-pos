import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:medglobal_admin_portal/core/core.dart';

part 'stock_take_list_filter_state.dart';

class StockTakeListFilterCubit extends Cubit<StockTakeListFilterState> {
  StockTakeListFilterCubit() : super(const StockTakeListFilterState());

  void setSize(int value) => emit(state.copyWith(size: value));

  void setStatus(StockOrderStatus? value) => emit(
        state.copyWith(
          status: value,
          nullStatus: value == null,
        ),
      );
}
