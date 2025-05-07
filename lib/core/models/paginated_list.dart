import 'package:equatable/equatable.dart';

class PaginatedList<T> extends Equatable {
  final List<T> items;
  final int currentSize;
  final int currentPage;
  final int totalPages;
  final int totalCount;

  const PaginatedList({
    required this.items,
    required this.currentSize,
    required this.currentPage,
    required this.totalPages,
    required this.totalCount,
  });

  @override
  List<Object> get props => [items, currentSize, currentPage, totalPages, totalCount];

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
