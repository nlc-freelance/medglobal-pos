part of 'unassigned_register_list_cubit.dart';

@freezed
class UnassignedRegisterListState with _$UnassignedRegisterListState {
  const factory UnassignedRegisterListState.initial() = _Initial;
  const factory UnassignedRegisterListState.loading() = _Loading;
  const factory UnassignedRegisterListState.loaded(List<Register> registers) = _Loaded;
  const factory UnassignedRegisterListState.failure(String message) = _Failure;
}
