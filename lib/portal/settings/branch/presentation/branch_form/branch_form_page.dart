import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/bloc/branch_bloc/branch_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/branch_form/widgets/branch_business_section.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/branch_form/widgets/contact_section/branch_contact_section.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/branch_form/widgets/branch_general_section.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/bloc/cubit/branch_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchFormPage extends StatelessWidget {
  const BranchFormPage({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BranchFormCubit()),
        BlocProvider.value(value: context.read<BranchBloc>()),
      ],
      child: BranchForm(id: id),
    );
  }
}

class BranchForm extends StatefulWidget {
  const BranchForm({super.key, this.id});

  final String? id;

  @override
  State<BranchForm> createState() => _BranchFormState();
}

class _BranchFormState extends State<BranchForm> with DialogMixin {
  @override
  void initState() {
    super.initState();

    if (widget.id != null) {
      final branchId = int.parse(widget.id!);
      context.read<BranchBloc>().add(BranchEvent.getBranchById(branchId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BranchBloc, BranchState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (branch, message) {
            // When getById success
            context.read<BranchFormCubit>().initBranch(branch);
          },
          orElse: () {},
        );
      },
      child: Column(
        children: [
          PageHeader(title: widget.id == null ? Strings.branchAdd : Strings.branchEdit),
          const BranchGeneralSection(),
          const BranchContactSection(),
          const BranchBusinessSection(),
          Row(
            children: [
              if (widget.id != null) UIButton.text('Delete', onClick: () => _onDelete(context)),
              const Spacer(),
              UIButton.outlined('Cancel', onClick: () => _onCancel(context)),
              const UIHorizontalSpace(8),
              UIButton.filled('Save', onClick: () => _onSave),
            ],
          ),
        ],
      ),
    );
  }

  void _onDelete(BuildContext context) => showDeleteDialog(
        context,
        subject: context.read<BranchFormCubit>().state.name!, // Get name from cubit
        onDelete: () {}, // Delete event from bloc, then navigate to BranchListPage on success
      );

  void _onCancel(BuildContext context) => Navigator.pop(context);

  // toBranch from cubit
  void _onSave() {}
}
