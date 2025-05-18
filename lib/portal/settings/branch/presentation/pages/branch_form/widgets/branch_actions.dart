import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/extensions/extensions.dart';
import 'package:medglobal_admin_portal/core/mixins/dialog_mixin.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/bloc/branch_bloc/branch_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/cubit/branch_form_cubit/branch_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchActions extends StatelessWidget with DialogMixin {
  const BranchActions({
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
          BlocBuilder<BranchBloc, BranchState>(
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
    final formCubit = context.read<BranchFormCubit>();

    showDeleteDialog(
      context,
      subject: 'Branch',
      item: formCubit.state.name!,
      onDelete: () => context.read<BranchBloc>().add(BranchEvent.deleteBranch(formCubit.toBranch())),
    );
  }

  void _onCancel(BuildContext context) => Navigator.pop(context);

  void _onSave(BuildContext context) {
    if (formKey.currentState?.validate() == true) {
      final formCubit = context.read<BranchFormCubit>();
      final branch = formCubit.toBranch();

      if (formCubit.state.id == null) {
        context.read<BranchBloc>().add(BranchEvent.createBranch(branch));
      } else {
        context.read<BranchBloc>().add(BranchEvent.updateBranch(branch));
      }
    }
  }
}
