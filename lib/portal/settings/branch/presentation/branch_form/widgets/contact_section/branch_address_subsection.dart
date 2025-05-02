import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/cubit/branch_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchAddressSubsection extends StatefulWidget {
  const BranchAddressSubsection({super.key});

  @override
  State<BranchAddressSubsection> createState() => _BranchAddressSubsectionState();
}

class _BranchAddressSubsectionState extends State<BranchAddressSubsection> {
  late TextEditingController _streetController;
  late TextEditingController _barangayController;
  late TextEditingController _cityController;
  late TextEditingController _provinceController;
  late TextEditingController _postalCodeController;
  late BranchFormCubit _formCubit;

  @override
  void initState() {
    super.initState();

    _formCubit = context.read<BranchFormCubit>();

    _streetController = TextEditingController(text: _formCubit.state.street);
    _barangayController = TextEditingController(text: _formCubit.state.barangay);
    _cityController = TextEditingController(text: _formCubit.state.city);
    _provinceController = TextEditingController(text: _formCubit.state.province);
    _postalCodeController = TextEditingController(text: _formCubit.state.postalCode);
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
                label: 'Street',
                hint: 'Enter street address',
                isRequired: true,
                controller: _streetController,
                onChanged: (value) => _formCubit.setStreet(value),
              ),
            ),
            const UIHorizontalSpace(16),
            Expanded(
              child: UITextFormField.vertical(
                label: 'Barangay',
                hint: 'Enter barangay',
                isRequired: true,
                controller: _barangayController,
                onChanged: (value) => _formCubit.setBarangay(value),
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
                isRequired: true,
                controller: _cityController,
                onChanged: (value) => _formCubit.setCity(value),
              ),
            ),
            const UIHorizontalSpace(16),
            Expanded(
              child: UITextFormField.vertical(
                label: 'Province',
                hint: 'Enter province',
                isRequired: true,
                controller: _provinceController,
                onChanged: (value) => _formCubit.setProvince(value),
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
                isRequired: true,
                controller: _postalCodeController,
                onChanged: (value) => _formCubit.setPostalCode(value),
              ),
            ),
            const UIHorizontalSpace(16),
            Expanded(
              child: UITextFormField.vertical(
                label: 'Country',
                hint: '',
                controller: TextEditingController(),
              ),
            ),
          ],
        ),
        const UIVerticalSpace(30),
      ],
    );
  }

  @override
  void dispose() {
    _streetController.dispose();
    _barangayController.dispose();
    _cityController.dispose();
    _provinceController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }
}
