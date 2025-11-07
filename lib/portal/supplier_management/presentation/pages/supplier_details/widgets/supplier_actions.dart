import 'package:flutter/cupertino.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SupplierActions extends StatelessWidget {
  const SupplierActions({
    super.key,
    required this.onDelete,
    required this.onCancel,
    required this.onSave,
    required this.isSupplierExisting,
    required this.isSupplierValid,
  });

  final VoidCallback onDelete;
  final VoidCallback onCancel;
  final VoidCallback onSave;
  final bool isSupplierExisting;
  final bool isSupplierValid;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (isSupplierExisting) ...[
            Row(
              children: [
                UIButton.text(
                  'Delete',
                  iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
                  onClick: onDelete,
                ),

                // if (state is SupplierDeleteLoading) ...[
                //   const UIHorizontalSpace(16),
                //   const CupertinoActivityIndicator(),
                // ],
              ],
            ),
            const Spacer(),
          ],
          CancelActionButton(
            onCancel: onCancel,
            onAction: onSave,
            // isLoading: state is SupplierSaveLoading || state is SupplierDeleteLoading,
          ),
        ],
      );
}
