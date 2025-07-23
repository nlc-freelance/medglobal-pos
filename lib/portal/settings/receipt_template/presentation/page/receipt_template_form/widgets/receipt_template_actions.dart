import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/extensions/extensions.dart';
import 'package:medglobal_admin_portal/core/mixins/dialog_mixin.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/bloc/receipt_template_bloc/receipt_template_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/cubit/receipt_template_form_cubit/receipt_template_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ReceiptTemplateActions extends StatelessWidget with DialogMixin {
  const ReceiptTemplateActions({
    super.key,
    required this.isEditMode,
    required this.formKey,
  });

  final bool isEditMode;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ReceiptTemplateBloc, ReceiptTemplateState>(
            builder: (builderContext, state) => state.maybeWhen(
              failure: (message) => PageErrorBanner(message: message),
              orElse: () => const SizedBox(),
            ),
          ),
          Row(
            children: [
              if (isEditMode)
                UIButton.text(
                  'Delete',
                  iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
                  onClick: () => _onDelete(context),
                ),
              const Spacer(),
              UIButton.outlined('Cancel', onClick: () => _onCancel(context)),
              const UIHorizontalSpace(8),
              UIButton.filled('Save', onClick: () => _onSave(context)),
            ],
          ),
        ],
      ),
    );
  }

  void _onDelete(BuildContext context) {
    final formState = context.read<ReceiptTemplateFormCubit>().state;

    showDeleteDialog(
      context,
      subject: 'Receipt Template',
      item: formState.name!,
      onDelete: () => context
          .read<ReceiptTemplateBloc>()
          .add(ReceiptTemplateEvent.deleteReceiptTemplate(formState.toReceiptTemplate())),
    );
  }

  void _onCancel(BuildContext context) => Navigator.pop(context);

  void _onSave(BuildContext context) {
    final formCubit = context.read<ReceiptTemplateFormCubit>();
    final formState = formCubit.state;

    formCubit.validateConfiguration();

    if (formKey.currentState?.validate() == true && formState.isConfigurationValid) {
      final template = formState.toReceiptTemplate();

      if (template.id == null) {
        context.read<ReceiptTemplateBloc>().add(ReceiptTemplateEvent.createReceiptTemplate(template));
      } else {
        context.read<ReceiptTemplateBloc>().add(ReceiptTemplateEvent.updateReceiptTemplate(template));
      }
    }
  }
}
