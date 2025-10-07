import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/repositories/report_repository.dart';

part 'report_event.dart';
part 'report_state.dart';
part 'report_bloc.freezed.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepository _repository;

  ReportBloc({required ReportRepository repository})
      : _repository = repository,
        super(const ReportState.initial()) {
    on<_GetReport>(_onGetReport);
  }

  Future<void> _onGetReport(_GetReport event, Emitter<ReportState> emit) async {
    emit(const ReportState.loading());

    try {
      final result = await _repository.getReport(event.id);
      result.when(
        success: (report) => emit(ReportState.loaded(report)),
        failure: (error) => emit(ReportState.failure(error.message)),
      );
    } catch (e) {
      emit(ReportState.failure(e.toString()));
    }
  }
}
