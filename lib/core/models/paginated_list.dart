import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_list.freezed.dart';

@freezed
class PaginatedList<T> with _$PaginatedList<T> {
  const PaginatedList._();

  const factory PaginatedList({
    required List<T> items,
    required int currentSize,
    required int currentPage,
    required int totalPages,
    required int totalCount,
  }) = _PaginatedList<T>;

  /// Converts a [PaginatedList] of type [T] to a [PaginatedList] of type [S]
  /// by applying the [fromJson] transformation function to each item.
  PaginatedList<S> convert<S>(S Function(T) fromJson) {
    return PaginatedList<S>(
      items: items.map(fromJson).toList(),
      currentSize: currentSize,
      currentPage: currentPage,
      totalPages: totalPages,
      totalCount: totalCount,
    );
  }

  bool get hasItems => totalCount > 0 && items.isNotEmpty;

  bool get hasNoItems => !hasItems;

  bool get hasMore => totalPages > currentPage;

  bool get hasReachedMax => currentPage == totalPages;

  bool get isOnFirstPage => currentPage == 1;

  bool get isOnLastPage => currentPage == totalPages;

  String get pageRecordsCount {
    final start = (currentPage - 1) * currentSize + 1;
    final end = currentPage * currentSize > totalCount ? totalCount : currentPage * currentSize;

    return 'Viewing $start - $end of $totalCount records';
  }

  String get pageInfo => 'Page $currentPage of $totalPages';

  int get firstPage => 1;

  int get previousPage => currentPage - 1;

  int get nextPage => currentPage + 1;

  int get lastPage => totalPages;

  bool get isNotOnFirstPage => !isOnFirstPage;

  bool get isNotOnLastPage => !isOnLastPage;
}
