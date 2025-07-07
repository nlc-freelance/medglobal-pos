import 'package:json_annotation/json_annotation.dart';

part 'create_product_abc_dto.g.dart';

@JsonSerializable()
class CreateProductABCDto {
  final int branchId;
  final String rankingCriteria;
  final String startDate;
  final String endDate;

  CreateProductABCDto({
    required this.branchId,
    required this.rankingCriteria,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson() => _$CreateProductABCDtoToJson(this);
}
