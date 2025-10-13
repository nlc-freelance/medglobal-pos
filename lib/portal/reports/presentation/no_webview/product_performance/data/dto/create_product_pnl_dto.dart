import 'package:json_annotation/json_annotation.dart';

part 'create_product_pnl_dto.g.dart';

@JsonSerializable()
class CreateProductPNLDto {
  final int branchId;
  final List<int>? productCategoryIds;
  final int topSize;
  final String rankingCriteria;
  final String startDate;
  final String endDate;

  CreateProductPNLDto({
    required this.branchId,
    required this.productCategoryIds,
    required this.topSize,
    required this.rankingCriteria,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson() => _$CreateProductPNLDtoToJson(this);
}
