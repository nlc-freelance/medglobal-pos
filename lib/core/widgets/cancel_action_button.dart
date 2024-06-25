import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class CancelActionButton extends StatelessWidget {
  const CancelActionButton({
    super.key,
    required this.onCancel,
    required this.onAction,
    this.enabled = true,
    this.isLoading = false,
    this.actionLabel = 'Save',
    this.actionStyle,
  });

  final VoidCallback onCancel;
  final VoidCallback onAction;
  final String actionLabel;
  final ButtonStyle? actionStyle;
  final bool enabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            UIButton.outlined('Cancel', onClick: onCancel),
            const UIHorizontalSpace(8.0),
            UIButton.filled(
              actionLabel,
              style: actionStyle,
              onClick: onAction,
              enabled: enabled,
            ),
            if (isLoading) ...[
              const UIHorizontalSpace(16),
              const CupertinoActivityIndicator(),
            ],
          ],
        ),
      );
}
