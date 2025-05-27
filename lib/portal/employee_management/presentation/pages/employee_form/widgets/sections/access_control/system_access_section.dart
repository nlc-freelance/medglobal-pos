import 'package:flutter/widgets.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SystemAccessSection extends StatelessWidget {
  const SystemAccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText.heading6('System Access'),
        const UIVerticalSpace(12),
        Wrap(
          spacing: 16,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: AppCheckboxListTile(
                label: SystemAccess.pos.label,
                labelStyle: UIStyleText.bodyRegular,
                onToggle: (value) {},
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: AppCheckboxListTile(
                label: SystemAccess.portal.label,
                labelStyle: UIStyleText.bodyRegular,
                onToggle: (value) {},
              ),
            ),
          ],
        ),
        const UIVerticalSpace(30),
      ],
    );
  }
}

enum SystemAccess {
  pos('POS Register'),
  portal('Portal');

  const SystemAccess(this.label);
  final String label;
}
