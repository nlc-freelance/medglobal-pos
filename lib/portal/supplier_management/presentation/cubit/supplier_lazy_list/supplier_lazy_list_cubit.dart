import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:medglobal_admin_portal/core/models/models.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/repositories/supplier_repository.dart';

part 'supplier_lazy_list_state.dart';

class SupplierLazyListCubit extends Cubit<SupplierLazyListState> {
  final SupplierRepository _repository;

  SupplierLazyListCubit(this._repository) : super(SupplierLazyListState.initial());

  int _currentPage = 1;
  int _totalCount = -1;
  Set<Supplier> _suppliers = {};

  void reset() {
    _suppliers = {};
    _currentPage = 1;
    emit(SupplierLazyListState.initial());
  }

  Future<void> getSuppliers({String? search, bool isInitialSearch = false}) async {
    if (_suppliers.length != _totalCount) {
      if (isInitialSearch) {
        _suppliers = {};
        _currentPage = 1;
      }

      if (_currentPage == 1) {
        emit(state.copyWith(isInitLoading: true));
      } else {
        emit(state.copyWith(isLoadingMore: true));
      }

      try {
        final result = await _repository.getSuppliers(PageQuery(page: _currentPage, size: 10));
        result.fold(
          (error) => emit(state.copyWith(isInitLoading: false, isLoadingMore: false, error: error.message)),
          (data) {
            _currentPage++;
            _suppliers = {..._suppliers, ...data.items};
            _totalCount = data.totalCount;
            emit(state.copyWith(
              isInitLoading: false,
              isLoadingMore: false,
              suppliers: _suppliers.toList(),
              hasNoData: data.totalCount == 0 && data.items.isEmpty == true,
              hasReachedMax: data.currentPage == data.totalPages,
            ));
          },
        );
      } catch (e) {
        emit(state.copyWith(isInitLoading: false, isLoadingMore: false, error: e.toString()));
      }
    }
  }
}
