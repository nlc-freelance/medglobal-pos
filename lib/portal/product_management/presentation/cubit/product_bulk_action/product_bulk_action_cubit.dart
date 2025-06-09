// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:medglobal_admin_portal/portal/product_management/domain/entities/category/category.dart';
// import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/products/bulk_delete_products_usecase.dart';
// import 'package:medglobal_admin_portal/portal/product_management/domain/usecases/products/bulk_update_products_usecase.dart';

// part 'product_bulk_action_state.dart';

// class ProductBulkActionCubit extends Cubit<ProductBulkActionState> {
//   final BulkDeleteProductsUseCase _bulkDeleteProductsUseCase;
//   final BulkUpdateProductsUseCase _bulkUpdateProductsUseCase;

//   ProductBulkActionCubit(
//     this._bulkDeleteProductsUseCase,
//     this._bulkUpdateProductsUseCase,
//   ) : super(ProductBulkActionInitial());

//   Future<void> bulkDelete(List<int> ids) async {
//     emit(ProductBulkActionLoading());

//     try {
//       final result = await _bulkDeleteProductsUseCase.call(BulkDeleteProductsParams(ids));
//       result.fold(
//         (error) => emit(ProductBulkActionError(message: error.message)),
//         (data) => emit(ProductBulkActionSuccess(message: '${ids.length} Product(s) successfully deleted.')),
//       );
//     } catch (e) {
//       emit(ProductBulkActionError(message: e.toString()));
//     }
//   }

//   Future<void> bulkUpdate(List<int> ids, Category? category) async {
//     emit(ProductBulkActionLoading());

//     try {
//       final result = await _bulkUpdateProductsUseCase.call(BulkUpdateProductsParams(ids, category));
//       result.fold(
//         (error) => emit(ProductBulkActionError(message: error.message)),
//         (data) =>
//             emit(ProductBulkActionSuccess(message: 'Category for all ${ids.length} product(s) successfully updated.')),
//       );
//     } catch (e) {
//       emit(ProductBulkActionError(message: e.toString()));
//     }
//   }
// }
