import 'package:medglobal_admin_portal/core/utils/typedefs.dart';

class AddCategoryParams {
  final String name;

  AddCategoryParams(this.name);

  JSON get data => {'name': name};
}
