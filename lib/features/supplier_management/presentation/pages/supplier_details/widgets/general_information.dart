import 'package:flutter/widgets.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class GeneralInformation extends StatelessWidget {
  const GeneralInformation(this.isNewSupplier, {super.key, required this.supplierNameController});

  final bool isNewSupplier;
  final TextEditingController supplierNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UIVerticalSpace(20.0),
        UIText.heading4(isNewSupplier ? 'Add Supplier' : 'Edit Supplier'),
        const UIVerticalSpace(30.0),
        PageSectionTitle.subsection('General'),
        UITextField.leftLabel(
          width: 300.0,
          label: 'Supplier Name',
          showRequired: true,
          controller: supplierNameController,
        ),
        const UIVerticalSpace(30.0),
      ],
    );
  }
}
