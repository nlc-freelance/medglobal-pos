import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/category.dart';

part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDto extends Equatable {
  final int? id;
  final String? name;

  const CategoryDto({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  Category toEntity() => Category(
        id: id,
        name: name ?? Strings.empty,
      );
}
