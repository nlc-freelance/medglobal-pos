import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/repository/register_repository.dart';

part 'unassigned_register_list_state.dart';
part 'unassigned_register_list_cubit.freezed.dart';

class UnassignedRegisterListCubit extends Cubit<UnassignedRegisterListState> {
  final RegisterRepository _registerRepository;

  UnassignedRegisterListCubit({required RegisterRepository registerRepository})
      : _registerRepository = registerRepository,
        super(const UnassignedRegisterListState.initial());

  Future<void> fetch() async {
    emit(const UnassignedRegisterListState.loading());

    try {
      final result =
          await _registerRepository.getRegisters(const PageQuery(page: 1, size: 20, extra: {'assigned': false}));

      result.when(
        success: (registers) => emit(UnassignedRegisterListState.loaded(registers.items)),
        failure: (failure) => emit(UnassignedRegisterListState.failure(failure.message)),
      );
    } catch (e) {
      emit(UnassignedRegisterListState.failure(e.toString()));
    }
  }
}
