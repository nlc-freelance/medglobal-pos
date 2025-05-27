import 'package:flutter/widgets.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class EmployeeActions extends StatelessWidget {
  const EmployeeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          // if (isEditMode)
          //   UIButton.text(
          //     'Delete',
          //     iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
          //     onClick: () => _onDelete(context),
          //   ),
          const Spacer(),
          UIButton.outlined('Cancel', onClick: () {}),
          const UIHorizontalSpace(8),
          UIButton.filled('Save', onClick: () {}),
        ],
      ),
    );
  }
}
