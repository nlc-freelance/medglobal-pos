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
    if (path.contains('/store')) url = 'https://im3929rlc9.execute-api.ap-southeast-1.amazonaws.com/dev';

    /// Mock
    if (path.contains('/registers') || path.contains('/shifts')) {
      url = 'https://019b7ae5-d4d0-4d69-8f0b-e98c552e4c11.mock.pstmn.io';
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
