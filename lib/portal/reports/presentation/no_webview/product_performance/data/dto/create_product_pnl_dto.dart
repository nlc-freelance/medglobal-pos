import 'package:json_annotation/json_annotation.dart';

part 'create_product_pnl_dto.g.dart';

@JsonSerializable()
class CreateProductPNLDto {
  final List<int> productCategoryIds;
  final int topSize;
  final String rankingCriteria;
  final String startDate;
  final String endDate;

  CreateProductPNLDto({
    required this.productCategoryIds,
    required this.topSize,
    required this.rankingCriteria,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson() => _$CreateProductPNLDtoToJson(this);
}
