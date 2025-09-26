part of 'sale_bloc.dart';

@freezed
class SaleEvent with _$SaleEvent {
  const factory SaleEvent.createSale(Order order, double? amountPaid) = _CreateSale;
  const factory SaleEvent.reset() = _Reset;
}
