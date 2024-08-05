import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'price_dto.g.dart';

@JsonSerializable()
class PriceDto extends Equatable {
  final int? id;
  final double? price;

  const PriceDto({
    this.id,
    this.price,
  });

  @override
  List<Object?> get props => [id, price];

  factory PriceDto.fromJson(Map<String, dynamic> json) => _$PriceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PriceDtoToJson(this);
}
