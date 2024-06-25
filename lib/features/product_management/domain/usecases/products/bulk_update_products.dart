import 'package:medglobal_admin_portal/core/utils/typedefs.dart';

class BulkUpdateProductsParams {
  final List<int> ids;
  // {'property': value}
  final JSON data;

  BulkUpdateProductsParams({required this.ids, required this.data});
}
