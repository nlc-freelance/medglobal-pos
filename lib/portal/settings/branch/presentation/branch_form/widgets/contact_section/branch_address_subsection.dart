import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/bloc/cubit/branch_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchAddressSubsection extends StatefulWidget {
  const BranchAddressSubsection({super.key});

  @override
  State<BranchAddressSubsection> createState() => _BranchAddressSubsectionState();
}

class _BranchAddressSubsectionState extends State<BranchAddressSubsection> {
  late TextEditingController _street1Controller;
  late TextEditingController _street2Controller;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _postalCodeController;
  late TextEditingController _countryController;

  late BranchFormCubit _formCubit;

  @override
  void initState() {
    super.initState();

    _formCubit = context.read<BranchFormCubit>();

    _street1Controller = TextEditingController(text: _formCubit.state.street1);
    _street2Controller = TextEditingController(text: _formCubit.state.street2);
    _cityController = TextEditingController(text: _formCubit.state.city);
    _stateController = TextEditingController(text: _formCubit.state.state);
    _postalCodeController = TextEditingController(text: _formCubit.state.postalCode);
    _countryController = TextEditingController(text: _formCubit.state.country);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageSectionTitle.subsection(title: 'Address'),
        Row(
          children: [
            Expanded(
              child: UITextFormField.vertical(
                label: 'Street Addess 1',
                hint: 'Enter street address 1',
                controller: _street1Controller,
                isRequired: true,
                validator: FormValidators.required(''),
                onChanged: (value) => _formCubit.setStreet1(value),
              ),
            ),
            const UIHorizontalSpace(16),
            Expanded(
              child: UITextFormField.vertical(
                label: 'Street Address 2',
                hint: 'Enter street address 2',
                controller: _street2Controller,
                isRequired: true,
                validator: FormValidators.required(''),
                onChanged: (value) => _formCubit.setStreet2(value),
              ),
            ),
          ],
        ),
        const UIVerticalSpace(16),
        Row(
          children: [
            Expanded(
              child: UITextFormField.vertical(
                label: 'City',
                hint: 'Enter city',
                controller: _cityController,
                isRequired: true,
                validator: FormValidators.required(''),
                onChanged: (value) => _formCubit.setCity(value),
              ),
            ),
            const UIHorizontalSpace(16),
            Expanded(
              child: UITextFormField.vertical(
                label: 'Province',
                hint: 'Enter province',
                controller: _stateController,
                isRequired: true,
                validator: FormValidators.required(''),
                onChanged: (value) => _formCubit.setState(value),
              ),
            ),
          ],
        ),
        const UIVerticalSpace(16),
        Row(
          children: [
            Expanded(
              child: UITextFormField.vertical(
                label: 'Postal Code',
                hint: 'Enter postal code',
                controller: _postalCodeController,
                isRequired: true,
                validator: FormValidators.required(''),
                onChanged: (value) => _formCubit.setPostalCode(value),
              ),
            ),
            const UIHorizontalSpace(16),
            CountryCodePicker(
              countryList: countries
                  .map((c) => {
                        "name": c.name,
                        "code": c.code,
                        "dial_code": c.dialCode,
                      })
                  .toList(),
              onChanged: (c) => _formCubit.setCountry(c.name!),
              dialogSize: const Size(500, 500),
              favorite: const ['PH'],
              showCountryOnly: true,
              dialogTextStyle: UIStyleText.heading6,
              builder: (_) => UIDropdownButton.topLabelReadOnly(
                controller: _countryController,
                suffixIcon: Assets.icons.arrowDown.setSize(12),
                label: 'Country',
                hint: 'Select Country',
              ),
            )
          ],
        ),
        const UIVerticalSpace(30),
      ],
    );
  }

  @override
  void dispose() {
    _street1Controller.dispose();
    _street2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }
}
