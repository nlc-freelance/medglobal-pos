import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/refund_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ReasonForRefundDetails extends StatefulWidget {
  const ReasonForRefundDetails({super.key});

  @override
  State<ReasonForRefundDetails> createState() => _ReasonForRefundDetailsState();
}

class _ReasonForRefundDetailsState extends State<ReasonForRefundDetails> {
  ReasonForRefund? _reasonForRefund;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UIVerticalSpace(40),
        UIText.heading6('Reason for Refund'),
        const UIVerticalSpace(20),
        Wrap(
          spacing: 16,
          children: [
            ...ReasonForRefund.values.map((reason) => ChoiceChip(
                  label: Text(reason.label, style: UIStyleText.chip),
                  selected: _reasonForRefund == reason,
                  onSelected: (bool selected) {
                    setState(() => _reasonForRefund = selected ? reason : null);
                    if (reason != ReasonForRefund.OTHER) context.read<RefundFormCubit>().setReason(reason.label);
                  },
                  color: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected)
                      ? UIColors.buttonSecondaryHover.withOpacity(0.18)
                      : UIColors.whiteBg),
                  backgroundColor: UIColors.whiteBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: const BorderSide(color: UIColors.borderMuted), // Remove border
                  ),
                ))
          ],
        ),
        if (_reasonForRefund != null && _reasonForRefund == ReasonForRefund.OTHER) ...[
          const UIVerticalSpace(16),
          UITextField.noLabel(
            hint: 'Other reason',
            onChanged: (value) => context.read<RefundFormCubit>().setReason(value),
          ),
        ],
      ],
    );
  }
}
