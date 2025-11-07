class ApiPaginatedList<T> {
  final List<T> items;
  final int size;
  final int page;
  final int totalCount;
  final int totalPages;

  ApiPaginatedList({
    required this.items,
    required this.size,
    required this.page,
    required this.totalCount,
    required this.totalPages,
  });

  factory ApiPaginatedList.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return ApiPaginatedList<T>(
      items: (json['items'] as List<dynamic>).map((item) => fromJson(item as Map<String, dynamic>)).toList(),
      size: json['size'],
      page: json['page'],
      totalCount: json['totalCount'],
      totalPages: json['totalPages'],
    );
  }
}
