import 'package:json_annotation/json_annotation.dart';

part 'category_payload.g.dart';

@JsonSerializable()
class CategoryPayload {
  final String? name;

  const CategoryPayload({
    this.name,
  });

  Map<String, dynamic> toJson() => _$CategoryPayloadToJson(this);
}
