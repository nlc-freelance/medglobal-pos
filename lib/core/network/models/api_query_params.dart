class ApiQueryParams {
  final int? page;
  final int? size;

  ApiQueryParams({this.page = 1, this.size = 20});

  Map<String, dynamic> toJson() => {
        'page': page,
        'size': size,
      };
}
