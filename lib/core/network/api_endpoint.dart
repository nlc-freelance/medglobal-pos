import 'package:flutter/foundation.dart';

class ApiEndpoint {
  final String path;

  ApiEndpoint(this.path);

  static String baseUrl(path) {
    String baseUrlSandbox = 'https://z1cv19jpah.execute-api.ap-southeast-1.amazonaws.com/sandbox';
    String url = '';

    if (path.contains('/suppliers')) {
      url = kDebugMode ? baseUrlSandbox : 'https://7ayvpkcn48.execute-api.ap-southeast-1.amazonaws.com/dev';
    }
    if (path.contains('/product') ||
        path.contains('/purchase-orders') ||
        path.contains('/stock-returns') ||
        path.contains('/stock-transfers') ||
        path.contains('/stock-takes')) {
      url = kDebugMode ? baseUrlSandbox : 'https://i4pqwf8ek2.execute-api.ap-southeast-1.amazonaws.com/dev';
    }
    if (path.contains('/store') || path.contains('/registers')) {
      url = kDebugMode ? baseUrlSandbox : 'https://im3929rlc9.execute-api.ap-southeast-1.amazonaws.com/dev';
    }
    if (path.contains('/shifts')) {
      url = kDebugMode ? baseUrlSandbox : 'https://u6r2va1rc1.execute-api.ap-southeast-1.amazonaws.com/dev';
    }
    if (path.contains('sales')) {
      url = baseUrlSandbox;
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
