import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/page/receipt_template_list/widgets/receipt_template_data_grid.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/page/receipt_template_list/widgets/receipt_template_header.dart';

class ReceiptTemplateListPage extends StatelessWidget {
  const ReceiptTemplateListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ReceiptTemplateHeader(),
        Expanded(child: ReceiptTemplateDataGrid()),
      ],
    );
  }
}
