import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/extensions/extensions.dart';
import 'package:medglobal_admin_portal/core/mixins/dialog_mixin.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductFormActions extends StatelessWidget with DialogMixin {
  const ProductFormActions({
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
          BlocBuilder<ProductBloc, ProductState>(
            builder: (builderContext, state) => state.maybeWhen(
              failure: (message) => PageErrorNotice(message: message),
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
    // final formCubit = context.read<ReceiptTemplateFormCubit>();

    // showDeleteDialog(
    //   context,
    //   subject: 'Receipt Template',
    //   item: formCubit.state.name!,
    //   onDelete: () => context
    //       .read<ReceiptTemplateBloc>()
    //       .add(ReceiptTemplateEvent.deleteReceiptTemplate(formCubit.toReceiptTemplate())),
    // );
  }

  void _onCancel(BuildContext context) => Navigator.pop(context);

  void _onSave(BuildContext context) {
    // final formCubit = context.read<ReceiptTemplateFormCubit>();
    // formCubit.validateConfiguration();

    // if (formKey.currentState?.validate() == true && formCubit.state.isConfigurationValid) {
    //   final template = formCubit.toReceiptTemplate();

    //   if (formCubit.state.id == null) {
    //     context.read<ReceiptTemplateBloc>().add(ReceiptTemplateEvent.createReceiptTemplate(template));
    //   } else {
    //     context.read<ReceiptTemplateBloc>().add(ReceiptTemplateEvent.updateReceiptTemplate(template));
    //   }
    // }
  }
}
