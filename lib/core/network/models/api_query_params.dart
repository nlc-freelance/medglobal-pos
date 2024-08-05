class ApiQueryParams {
  final int? page;
  final int? size;

  ApiQueryParams({this.page = 1, this.size = 200});

  Map<String, dynamic> toJson() => {
        'page': page,
        'size': size,
      };
}
