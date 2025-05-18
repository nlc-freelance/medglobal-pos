class Paginated<T> {
  final List<T> items;
  final int size;
  final int page;
  final int totalCount;
  final int totalPages;

  Paginated({
    required this.items,
    required this.size,
    required this.page,
    required this.totalCount,
    required this.totalPages,
  });

  factory Paginated.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return Paginated<T>(
      items: (json['items'] as List<dynamic>).map((item) => fromJson(item as Map<String, dynamic>)).toList(),
      size: json['size'],
      page: json['page'],
      totalCount: json['totalCount'],
      totalPages: json['totalPages'],
    );
  }
}
