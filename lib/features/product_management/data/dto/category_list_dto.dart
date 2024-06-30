import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category_dto.dart';
import '../../domain/entities/category_list.dart';

part 'category_list_dto.g.dart';

@JsonSerializable()
class CategoryListDto extends Equatable {
  final List<CategoryDto>? categories;
  final int? currentPage;
  final int? totalPages;

  const CategoryListDto({
    this.categories,
    this.currentPage,
    this.totalPages,
  });

  @override
  List<Object?> get props => [categories, currentPage, totalPages];

  factory CategoryListDto.fromJson(Map<String, dynamic> json) => _$CategoryListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListDtoToJson(this);

  CategoryList toEntity() => CategoryList(
        categories: categories?.map((category) => category.toEntity()).toList() ?? [],
        currentPage: currentPage,
        totalPages: totalPages,
      );
}
