import 'package:flutter/widgets.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class EmployeeGeneralSection extends StatefulWidget {
  const EmployeeGeneralSection({super.key});

  @override
  State<EmployeeGeneralSection> createState() => _EmployeeGeneralSectionState();
}

class _EmployeeGeneralSectionState extends State<EmployeeGeneralSection> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();

    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageSectionTitle(title: 'General Information'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextFormField.top(
                    label: 'First Name',
                    hint: 'Enter first name',
                    controller: _firstNameController,
                    isRequired: true,
                    validator: FormValidators.required('Please enter a first name.'),
                  ),
                  const UIVerticalSpace(16),
                  AppTextFormField.top(
                    label: 'Email Address',
                    hint: 'Enter email address',
                    controller: _emailController,
                    isRequired: true,
                    validator: (value) => FormValidators.run(value, [
                      FormValidators.required('Please enter an email address.'),
                      FormValidators.email(),
                    ]),
                  ),
                  const UIVerticalSpace(4),
                  Text(
                    'You can only set the email when creating the employee — it can\'t be changed afterward.',
                    style: UIStyleText.hint.copyWith(color: UIColors.textMuted),
                  ),
                  const UIVerticalSpace(16),
                  AppDropdownFormField<Branch>.labelTop(
                    label: 'Assigned Branch',
                    hint: 'Select branch',
                    isRequired: true,
                    getName: (Branch item) => item.name,
                    onChanged: (Branch item) {},
                  ),
                ],
              ),
            ),
            const UIHorizontalSpace(16),
            Expanded(
              child: Column(
                children: [
                  AppTextFormField.top(
                    label: 'Last Name',
                    hint: 'Enter last name',
                    controller: _lastNameController,
                    isRequired: true,
                    validator: FormValidators.required('Please enter a last name.'),
                  ),
                  const UIVerticalSpace(16),
                  AppTextFormField.top(
                    label: 'Phone',
                    hint: 'Enter contact number',
                    controller: _phoneController,
                    isRequired: true,
                    validator: FormValidators.required('Please enter a contact number.'),
                  ),
                ],
              ),
            ),
          ],
        ),
        const UIVerticalSpace(30),
      ],
    );
  }
}
