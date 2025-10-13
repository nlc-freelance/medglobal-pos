part of 'product_history_detail_bloc.dart';

@freezed
class ProductHistoryDetailEvent with _$ProductHistoryDetailEvent {
  const factory ProductHistoryDetailEvent.goToDetailsPage(int id, ProductHistoryAction action) = _GoToDetailsPage;
}
