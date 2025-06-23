import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_list.freezed.dart';

@freezed
class FilterList with _$FilterList {
  const factory FilterList({
    @Default(1) int page,
    @Default(20) int size,
    String? search,
    @Default({}) Map<String, dynamic> extra,
  }) = _FilterList;
}

extension FilterListExt on FilterList {
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
