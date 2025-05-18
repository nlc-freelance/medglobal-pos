import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/register_dropdown.dart';
import 'package:medglobal_admin_portal/portal/settings/register/domain/entity/register.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class RegisterSelectionDialog extends StatefulWidget {
  final void Function(Register) onConfirm;

  const RegisterSelectionDialog({super.key, required this.onConfirm});

  @override
  State<RegisterSelectionDialog> createState() => _RegisterSelectionDialogState();
}

class _RegisterSelectionDialogState extends State<RegisterSelectionDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Register? _register;

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: Dialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
        backgroundColor: UIColors.background,
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.35,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                UIText.heading5('POS Register'),
                const Divider(color: UIColors.borderMuted),
                const UIVerticalSpace(16),
                Text('Please choose the register you need to use', style: UIStyleText.bodyRegular),
                const UIVerticalSpace(30),
                RegisterDropdown(onChanged: (register) => setState(() => _register = register)),
                const UIVerticalSpace(30),
                Align(
                  alignment: Alignment.bottomRight,
                  child: UIButton.filled(
                    'Confirm',
                    onClick: () {
                      if (_formKey.currentState?.validate() == true) widget.onConfirm(_register!);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
