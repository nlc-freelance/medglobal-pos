import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

enum LabelValueType { text, status, button, chip, type }

class LabelValue extends StatelessWidget {
  const LabelValue._({
    required this.labelType,
    required this.label,
    this.value,
    this.status,
    this.button,
    this.chip,
    this.type,
  });

  final LabelValueType labelType;
  final String label;
  final String? value;
  final StockOrderStatus? status;
  final TransactionType? type;
  final Widget? button;
  final double? chip;

  factory LabelValue.text({
    required String label,
    required String? value,
  }) =>
      LabelValue._(labelType: LabelValueType.text, label: label, value: value);

  factory LabelValue.status({
    required String label,
    required StockOrderStatus status,
  }) =>
      LabelValue._(labelType: LabelValueType.status, label: label, status: status);

  factory LabelValue.type({
    required String label,
    required TransactionType type,
  }) =>
      LabelValue._(labelType: LabelValueType.type, label: label, type: type);

  factory LabelValue.button({
    required String label,
    required Widget button,
  }) =>
      LabelValue._(labelType: LabelValueType.button, label: label, button: button);

  factory LabelValue.chip({
    required String label,
    required double chip,
  }) =>
      LabelValue._(labelType: LabelValueType.chip, label: label, chip: chip);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UIText.labelSemiBold(label),
        if (labelType == LabelValueType.text) UIText.bodyRegular(value ?? Strings.empty),
        if (labelType == LabelValueType.status) ...[
          const UIVerticalSpace(6),
          Chip(
            label: Text(
              status!.label,
              style: UIStyleText.chip.copyWith(color: StatusMapper.textColor(status!)),
            ),
            backgroundColor: StatusMapper.color(status!),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: UIColors.transparent),
            ),
          ),
        ],
        if (labelType == LabelValueType.type) ...[
          const UIVerticalSpace(6),
          Chip(
            label: Text(
              type!.label,
              style: UIStyleText.chip
                  .copyWith(color: type == TransactionType.SALE ? UIColors.completed : UIColors.cancelled),
            ),
            backgroundColor: type == TransactionType.SALE ? UIColors.completedBg : UIColors.cancelledBg,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: UIColors.transparent),
            ),
          ),
        ],
        if (labelType == LabelValueType.chip) ...[
          const UIVerticalSpace(6),
          Chip(
            label: Text(
              chip.toString(),
              style: UIStyleText.chip.copyWith(color: chip! > 0 ? UIColors.completed : UIColors.cancelled),
            ),
            backgroundColor: chip! > 0 ? UIColors.completedBg : UIColors.cancelledBg,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: UIColors.transparent),
            ),
          ),
        ],
        if (labelType == LabelValueType.button) ...[const UIVerticalSpace(4), button!],
      ],
    );
  }
}
