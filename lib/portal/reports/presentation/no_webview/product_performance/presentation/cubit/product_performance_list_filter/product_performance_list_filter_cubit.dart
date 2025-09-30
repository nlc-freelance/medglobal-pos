import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/models/page_query.dart';

part 'product_performance_list_filter_state.dart';
part 'product_performance_list_filter_cubit.freezed.dart';

class ProductPerformanceListFilterCubit extends Cubit<ProductPerformanceListFilterState> {
  ProductPerformanceListFilterCubit() : super(ProductPerformanceListFilterState.initial());

  void setPageAndSize(int page, int size) => emit(state.copyWith(page: page, size: size));

  void setType(ReportType? value) => emit(state.copyWith(type: value));

  void reset() => emit(ProductPerformanceListFilterState.initial());
}
