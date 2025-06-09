import 'package:flutter/widgets.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/app_custom_dialog.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/variant/variant_form_actions.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/variant/variant_form_view.dart';

class VariantFormDialog extends StatelessWidget {
  const VariantFormDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCustomDialog(
      title: 'Add Variant',
      content: Column(
        children: [
          VariantFormView(isDialog: true),
          VariantFormActions(),
        ],
      ),
    );
  }
}
