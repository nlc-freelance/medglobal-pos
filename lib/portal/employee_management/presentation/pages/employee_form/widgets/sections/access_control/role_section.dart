import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

enum EmployeeRole { cashier, supervisor, administrator }

class RoleSection extends StatelessWidget {
  const RoleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText.heading6('Role'),
        const UIVerticalSpace(12),
        Row(
          children: [
            AppRadioGroup<EmployeeRole>(
              items: EmployeeRole.values,
              onChanged: (role) {},
              itemAsString: (role) => role.name.capitalized,
              labelStyle: UIStyleText.bodyRegular,
              spacing: 16,
            ),
          ],
        ),
        const UIVerticalSpace(30),
      ],
    );
  }
}
