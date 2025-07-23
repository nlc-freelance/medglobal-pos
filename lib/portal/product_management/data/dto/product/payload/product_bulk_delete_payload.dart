import 'package:json_annotation/json_annotation.dart';

part 'product_bulk_delete_payload.g.dart';

@JsonSerializable()
class ProductBulkDeletePayload {
  final List<int>? ids;

  const ProductBulkDeletePayload({
    this.ids,
  });

  Map<String, dynamic> toJson() => _$ProductBulkDeletePayloadToJson(this);
}
