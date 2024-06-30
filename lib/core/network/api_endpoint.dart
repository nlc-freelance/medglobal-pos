class ApiEndpoint {
  final String path;

  ApiEndpoint(this.path);

  static String baseUrl(path) {
    String url = '';
    if (path.contains('/suppliers')) url = 'https://7ayvpkcn48.execute-api.ap-southeast-1.amazonaws.com/dev';
    if (path.contains('/product')) url = 'https://i4pqwf8ek2.execute-api.ap-southeast-1.amazonaws.com/dev';
    return url;
  }

  /// Supplier
  static String suppliers([int? id]) {
    const path = '/suppliers';
    return id != null ? '$path/$id' : path;
  }

  /// Products
  static String productCategories = '/product-categories';

  static String products([int? id]) {
    const path = '/products';
    return id != null ? '$path/$id' : path;
  }
}
