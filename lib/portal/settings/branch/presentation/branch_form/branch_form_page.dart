import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/branch1.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/branch_form/widgets/branch_business_section.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/branch_form/widgets/contact_section/branch_contact_section.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/branch_form/widgets/branch_general_section.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/cubit/branch_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchFormPage extends StatelessWidget {
  const BranchFormPage({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Also create BranchBloc here and fetch branch by given id
      // When fetched, initialize the branch to the BranchFormCubit
      create: (context) {
        final formCubit = BranchFormCubit();
        if (id != null) {
          formCubit.initBranch(const Branch1(
            id: 1,
            name: 'Martinez',
            street: '5 Street Emerald',
            barangay: 'Ortigas Avenue',
            city: 'Pasig City',
            province: 'Pasig',
            postalCode: '1101',
            country: 'Philippines',
            phone: '09368434557',
            businessRegistrationNumber: '123456',
          ));
        }
        return formCubit;
      },
      child: BranchForm(id: id),
    );
  }
}

class BranchForm extends StatelessWidget with DialogMixin {
  const BranchForm({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageHeader(title: id == null ? Strings.branchAdd : Strings.branchEdit),
        const BranchGeneralSection(),
        const BranchContactSection(),
        const BranchBusinessSection(),
        Row(
          children: [
            if (id != null) UIButton.text('Delete', onClick: () => _onDelete(context)),
            const Spacer(),
            UIButton.outlined('Cancel', onClick: () => _onCancel(context)),
            const UIHorizontalSpace(8),
            UIButton.filled('Save', onClick: () => _onSave),
          ],
        ),
      ],
    );
  }

  void _onDelete(BuildContext context) => showDeleteDialog(
        context,
        subject: context.read<BranchFormCubit>().state.name!, // Get name from cubit
        onDelete: () {}, // Delete event from bloc, then navigate to BranchListPage on success
      );

  void _onCancel(BuildContext context) => Navigator.pop(context);

  // toBranch from cubit
  // Create event from bloc
  void _onSave() {}
}
