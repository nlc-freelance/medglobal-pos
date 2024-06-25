import 'package:medglobal_admin_portal/core/utils/typedefs.dart';

class UpdateProductParams {
  final int id;
  final JSON data;

  UpdateProductParams(this.id, {required this.data});
}
