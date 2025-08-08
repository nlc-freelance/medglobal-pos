import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class AppCustomDialog extends StatefulWidget {
  /// A customizable dialog container with a [title],
  /// a [content] section that supports scrolling if its content overflows,
  /// and [actions] section at the bottom for buttons (e.g. Cancel, Save).
  const AppCustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.subtitle,
    this.onClose,
    this.maxWidth,
    this.maxHeight,
    this.contentPadding,
  });

  final String title;
  final String? subtitle;
  final Widget content;
  final Widget actions;

  /// Optional callback triggered when the dialog is closed via the close icon on the top right.
  final VoidCallback? onClose;

  /// Optional maximum width constraint for the dialog.
  final double? maxWidth;

  /// Optional maximum height constraint for the dialog.
  final double? maxHeight;

  /// Optional padding inside the content area.
  /// Defaults to standard symmetric spacing (horizontal, 20) if not provided.
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<AppCustomDialog> createState() => _AppCustomDialogState();
}

class _AppCustomDialogState extends State<AppCustomDialog> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
      backgroundColor: UIColors.background,
      child: Container(
        constraints: BoxConstraints(maxWidth: widget.maxWidth ?? 500, maxHeight: widget.maxHeight ?? 600),
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title, style: UIStyleText.heading5),
                        if (widget.subtitle?.isNotEmpty ?? false) Text(widget.subtitle!, style: UIStyleText.hint),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      widget.onClose?.call();
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Assets.icons.close.svg(colorFilter: UIColors.textLight.toColorFilter),
                  ),
                ],
              ),
            ),
            const UIVerticalSpace(8),
            const Divider(color: UIColors.borderMuted),
            const UIVerticalSpace(10),
            Flexible(
              child: Scrollbar(
                thumbVisibility: true,
                controller: _scrollController,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  primary: false,
                  child: Padding(
                    padding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
                    child: widget.content,
                  ),
                ),
              ),
            ),
            const UIVerticalSpace(10),
            const Divider(color: UIColors.borderMuted),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: widget.actions,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
