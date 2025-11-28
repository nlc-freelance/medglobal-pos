import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:intl_phone_field/countries.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AddressInformation extends StatelessWidget {
  final TextEditingController address1Controller;
  final TextEditingController address2Controller;
  final TextEditingController cityController;
  final TextEditingController provinceController;
  final TextEditingController postalCodeController;
  final TextEditingController countryController;

  const AddressInformation({
    super.key,
    required this.address1Controller,
    required this.address2Controller,
    required this.cityController,
    required this.provinceController,
    required this.postalCodeController,
    required this.countryController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageSectionTitle.subsection(title: 'Address'),
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
              label: 'Street 1',
              controller: address1Controller,
            ),
            UITextField.topLabel(
              label: 'Street 2',
              controller: address2Controller,
            ),
            UITextField.topLabel(
              label: 'City',
              controller: cityController,
            ),
            UITextField.topLabel(
              label: 'Province',
              controller: provinceController,
            ),
            UITextField.topLabel(
              label: 'Postal Code',
              controller: postalCodeController,
            ),
            CountryCodePicker(
              // countryList: countries
              //     .map((c) => {
              //           "name": c.name,
              //           "code": c.code,
              //           "dial_code": c.dialCode,
              //         })
              //     .toList(),
              onChanged: (c) => countryController.text = c.name!,
              dialogSize: const Size(500, 500),
              favorite: const ['PH'],
              showCountryOnly: true,
              dialogTextStyle: UIStyleText.heading6,
              builder: (_) => UIDropdownButton.topLabelReadOnly(
                controller: countryController,
                suffixIcon: Assets.icons.arrowDown.setSize(12),
                label: 'Country',
                hint: 'Select Country',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
