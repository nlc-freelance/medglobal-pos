import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ContactInformation extends StatelessWidget {
  final TextEditingController mainContactNameController;
  final TextEditingController faxController;
  final TextEditingController emailController;
  final TextEditingController websiteController;
  final TextEditingController phoneController;

  const ContactInformation({
    super.key,
    required this.mainContactNameController,
    required this.faxController,
    required this.emailController,
    required this.websiteController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageSectionTitle.subsection('Contact Information'),
        GridView(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 16,
            mainAxisExtent: 60,
          ),
          shrinkWrap: true,
          children: [
            UITextField.topLabel(
              label: 'Main Contact Name',
              controller: mainContactNameController,
            ),
            UITextField.topLabel(
              label: 'Fax',
              controller: faxController,
            ),
            UITextField.topLabel(
              label: 'Email',
              controller: emailController,
            ),
            UITextField.topLabel(
              label: 'Website',
              controller: websiteController,
            ),
            UITextField.topLabel(
              label: 'Phone',
              formatter: FilteringTextInputFormatter.digitsOnly,
              controller: phoneController,
            ),
          ],
        ),
        const UIVerticalSpace(30.0),
      ],
    );
  }
}
