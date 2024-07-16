import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'supply_needs_list_state.dart';

class SupplyNeedListCubit extends Cubit<SupplyNeedListState> {
  // final GetSupplyNeedsUseCase _getSupplyNeedsUseCase;

  SupplyNeedListCubit() : super(SupplyNeedListInitial());

  // Future<void> getSupplyNeeds() async {
  //   emit(SupplyNeedListLoading());

  //   try {
  //     final result = await _getSupplyNeedsUseCase.call(GetSupplyNeedsParams(1));
  //     result.fold(
  //       (error) => emit(SupplyNeedListError(message: error.message)),
  //       (data) => emit(SupplyNeedListLoaded(supplyNeeds: data.supplyNeeds!)),
  //     );
  //   } catch (e) {
  //     emit(SupplyNeedListError(message: e.toString()));
  //   }
  // }
}
