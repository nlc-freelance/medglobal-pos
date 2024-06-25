import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medglobal_admin_portal/features/product_management/data/dto/category_dto.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  final int? id;
  final String name;

  const Category({this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  CategoryDto toDto() => CategoryDto(name: name);

  dynamic get(String prop) => prop;
}
