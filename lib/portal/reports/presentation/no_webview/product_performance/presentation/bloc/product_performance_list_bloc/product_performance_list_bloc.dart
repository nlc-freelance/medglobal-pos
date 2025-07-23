import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/entities/report.dart';
import 'package:medglobal_admin_portal/portal/reports/domain/repositories/report_repository.dart';

part 'product_performance_list_event.dart';
part 'product_performance_list_state.dart';
part 'product_performance_list_bloc.freezed.dart';

class ProductPerformanceListBloc extends Bloc<ProductPerformanceListEvent, ProductPerformanceListState> {
  final ReportRepository _repository;

  ProductPerformanceListBloc({required ReportRepository repository})
      : _repository = repository,
        super(const ProductPerformanceListState.initial()) {
    on<_GetProductPerformanceReports>(_onGetProductPerformances);
    on<_AddReport>(_onAddReport);
    on<_UpdateReport>(_onUpdateReport);
    on<_RemoveReport>(_onRemoveReport);
  }

  Future<void> _onGetProductPerformances(_GetProductPerformanceReports event, emit) async {
    emit(const ProductPerformanceListState.loading());

    try {
      final result = await _repository.getReports(event.query);

      result.fold(
        (failure) => emit(ProductPerformanceListState.failure(failure.message)),
        (data) => emit(ProductPerformanceListState.loaded(data)),
      );
    } catch (e) {
      emit(ProductPerformanceListState.failure(e.toString()));
    }
  }

  /// Called after successful report creation
  /// This adds a temporary report in the list so it can be displayed in the data grid
  /// While the report is still generating
  void _onAddReport(event, emit) {
    state.maybeWhen(
      initial: () {
        emit(
          ProductPerformanceListState.loaded(
            PaginatedList(
              items: <Report>[event.report],
              currentSize: 1,
              currentPage: 1,
              totalPages: 1,
              totalCount: 1,
            ),
          ),
        );
      },
      loaded: (data, _) {
        if (data.items.any((item) => item.id == event.report.id)) return;

        final reports = <Report>[event.report, ...data.items];

        final updatedReports = data.copyWith(items: reports);
        emit(ProductPerformanceListState.loaded(updatedReports, addedNew: true));
      },
      orElse: () {},
    );
  }

  /// Called after the polling is finished and a completed report has been returned
  /// This updates the list by replacing the newly generated report's temp object with the actual new object returned from API
  /// This keeps the list up to date
  void _onUpdateReport(event, emit) {
    state.maybeWhen(
      loaded: (data, _) {
        final reports = data.items.map<Report>((report) {
          return report.id == event.id ? event.update(report) : report;
        }).toList();

        final updatedReports = data.copyWith(items: reports);

        emit(ProductPerformanceListState.loaded(updatedReports));
      },
      orElse: () {},
    );
  }

  void _onRemoveReport(event, emit) {
    state.maybeWhen(
      loaded: (data, _) {
        final reports = data.items.where((report) => report.id != event.id).toList();

        final updatedReports = data.copyWith(items: reports);

        emit(ProductPerformanceListState.loaded(updatedReports));
      },
      orElse: () {},
    );
  }
}
