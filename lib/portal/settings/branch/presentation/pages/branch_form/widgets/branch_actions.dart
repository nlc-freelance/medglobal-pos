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
    final formState = context.read<BranchFormCubit>().state;

    final branchId = formState.id!;
    final branchName = formState.name!;

    showDeleteDialog(
      context,
      subject: 'Branch',
      item: branchName,
      onDelete: () => context.read<BranchBloc>().add(BranchEvent.deleteBranch(branchId, branchName)),
    );
  }

  void _onCancel(BuildContext context) => Navigator.pop(context);

  void _onSave(BuildContext context) {
    final formCubit = context.read<BranchFormCubit>();
    final formState = formCubit.state;

    formCubit.validate();

    if (formKey.currentState?.validate() == true && formState.isFormValid) {
      final branch = formState.toBranch();

      if (branch.id == null) {
        context.read<BranchBloc>().add(BranchEvent.createBranch(branch));
      } else {
        context.read<BranchBloc>().add(BranchEvent.updateBranch(branch));
      }
    }
  }
}
