class ApiEndpoint {
  final String path;

  ApiEndpoint(this.path);

  static String baseUrl(path) {
    String url = '';
    if (path.contains('/suppliers')) url = 'https://7ayvpkcn48.execute-api.ap-southeast-1.amazonaws.com/dev';
    if (path.contains('/product') ||
        path.contains('/purchase-orders') ||
        path.contains('/stock-returns') ||
        path.contains('/stock-transfers') ||
        path.contains('/stock-takes')) {
      url = 'https://i4pqwf8ek2.execute-api.ap-southeast-1.amazonaws.com/dev';
    }
    if (path.contains('/store') || path.contains('/registers')) {
      url = 'https://im3929rlc9.execute-api.ap-southeast-1.amazonaws.com/dev';
    }

    if (path.contains('/shifts')) {
      url = 'https://u6r2va1rc1.execute-api.ap-southeast-1.amazonaws.com/dev';
    }
    return url;
  }

  /// Supplier
  static String suppliers([int? id]) {
    const path = '/suppliers';
    return id != null ? '$path/$id' : path;
  }

  /// Category
  static String productCategories = '/product-categories';

  /// Products
  static String products([int? id]) {
    const path = '/products';
    return id != null ? '$path/$id' : path;
  }

  /// Branch
  static String branches = '/stores';
}
