import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_params.freezed.dart';

@freezed
class PageQuery with _$PageQuery {
  const factory PageQuery({
    @Default(1) int page,
    @Default(20) int size,
    String? search,
    Map<String, dynamic>? extra,
  }) = _PageQuery;
}

extension PageQueryExt on PageQuery {
  Map<String, dynamic> toJson() {
    final filteredExtra = Map.fromEntries((extra ?? {}).entries.where((entry) => entry.value != null));

    return {
      'page': page,
      'size': size,
      if (search?.trim().isNotEmpty == true) 'search': search,
      ...filteredExtra,
    };
  }
}

@freezed
class FilterQuery with _$FilterQuery {
  const factory FilterQuery({
    String? search,
    Map<String, dynamic>? extra,
  }) = _FilterQuery;
}

extension FilterQueryExt on FilterQuery {
  Map<String, dynamic> toJson() {
    final filteredExtra = Map.fromEntries((extra ?? {}).entries.where((entry) => entry.value != null));

    return {
      if (search?.trim().isNotEmpty == true) 'search': search,
      ...filteredExtra,
    };
  }
}
