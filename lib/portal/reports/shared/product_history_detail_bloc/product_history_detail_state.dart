part of 'product_history_detail_bloc.dart';

@freezed
class ProductHistoryDetailState with _$ProductHistoryDetailState {
  const factory ProductHistoryDetailState.initial() = _Initial;
  const factory ProductHistoryDetailState.loading() = _Loading;
  const factory ProductHistoryDetailState.success({required String routeName, required int id}) = _Success;
  const factory ProductHistoryDetailState.failure(String message) = _Failure;
}
