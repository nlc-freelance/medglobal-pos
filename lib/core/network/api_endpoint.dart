import 'package:medglobal_admin_portal/core/configs/config.dart';

class ApiEndpoint {
  static const baseUrl = Config.baseUrl;

  /// Supplier
  static String suppliers([int? id]) {
    const path = '/suppliers';
    return id != null ? '$path/$id' : path;
  }

  /// Products
  static String products([int? id]) {
    const path = '/products';
    return id != null ? '$path/$id' : path;
  }
}
