import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
        PageSectionTitle.subsection(title: 'Contact Information'),
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
            IntlPhoneField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              initialCountryCode: 'PH',
              showDropdownIcon: false,
              flagsButtonMargin: const EdgeInsets.only(left: 8),
              decoration: const InputDecoration(hintText: 'Enter phone number'),
              cursorHeight: 14,
              style: UIStyleText.bodyRegular,
              pickerDialogStyle: PickerDialogStyle(
                width: 500,
                searchFieldInputDecoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Assets.icons.search.setSize(16),
                  ),
                  prefixIconConstraints: const BoxConstraints(maxHeight: 48),
                  suffixIcon: null,
                  hintText: 'Search country',
                ),
                backgroundColor: UIColors.background,
                padding: const EdgeInsets.all(16),
                countryCodeStyle: UIStyleText.labelMedium,
                countryNameStyle: UIStyleText.labelSemiBold,
                listTileDivider: const Divider(color: UIColors.borderMuted),
              ),
            ),
          ],
        ),
        const UIVerticalSpace(30.0),
      ],
    );
  }
}
