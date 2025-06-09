part of 'sale_bloc.dart';

@freezed
class SaleEvent with _$SaleEvent {
  const factory SaleEvent.createSale(Order order) = _CreateSale;
}
