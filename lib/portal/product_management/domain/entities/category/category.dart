import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/core.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const factory Category({
    int? id,
    required String name,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
  }) = _Category;
}
