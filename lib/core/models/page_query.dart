import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_query.freezed.dart';

@freezed
class PageQuery with _$PageQuery {
  const factory PageQuery({
    @Default(1) int page,
    @Default(20) int size,
    String? search,
    @Default({}) Map<String, dynamic> extra,
  }) = _PageQuery;
}

extension PageQueryExt on PageQuery {
  Map<String, dynamic> toJson() {
    final filteredExtra = Map.fromEntries(extra.entries.where((entry) => entry.value != null));

    return {
      'page': page,
      'size': size,
      if (search?.isNotEmpty == true) 'search': search,
      ...filteredExtra,
    };
  }
}
