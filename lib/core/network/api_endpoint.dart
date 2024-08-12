import 'package:flutter/foundation.dart';

class ApiEndpoint {
  final String path;

  ApiEndpoint(this.path);

  static String baseUrl(path) {
    String sandboxBaseUrl = 'https://rgg6sphmg6.execute-api.ap-southeast-1.amazonaws.com/sandbox/';
    String devBaseUrl = 'https://059iccwuk4.execute-api.ap-southeast-1.amazonaws.com/dev';

    // if (path.contains('/suppliers')) {
    //   url = kDebugMode ? sandboxBaseUrl : 'https://7ayvpkcn48.execute-api.ap-southeast-1.amazonaws.com/dev';
    // }
    // if (path.contains('/product') ||
    //     path.contains('/purchase-orders') ||
    //     path.contains('/stock-returns') ||
    //     path.contains('/stock-transfers') ||
    //     path.contains('/stock-takes')) {
    //   url = kDebugMode ? sandboxBaseUrl : 'https://i4pqwf8ek2.execute-api.ap-southeast-1.amazonaws.com/dev';
    // }
    // if (path.contains('/store') || path.contains('/registers')) {
    //   url = kDebugMode ? sandboxBaseUrl : 'https://im3929rlc9.execute-api.ap-southeast-1.amazonaws.com/dev';
    // }
    // if (path.contains('/shifts')) {
    //   url = kDebugMode ? sandboxBaseUrl : 'https://u6r2va1rc1.execute-api.ap-southeast-1.amazonaws.com/dev';
    // }
    // if (path.contains('sales')) {
    //   url = sandboxBaseUrl;
    // }

    return kDebugMode ? sandboxBaseUrl : devBaseUrl;
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
