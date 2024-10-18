import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:medglobal_admin_portal/core/utils/datetime_converter.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  final int? id;
  final String? name;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const Category({
    this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, name, createdAt, updatedAt];

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
