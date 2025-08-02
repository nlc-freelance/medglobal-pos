import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/constants/constants.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/pages/branch_form/widgets/branch_actions.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/pages/branch_form/widgets/sections/branch_business_section.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/pages/branch_form/widgets/sections/branch_general_section.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/pages/branch_form/widgets/sections/branch_contact_section.dart';

class BranchFormView extends StatefulWidget {
  const BranchFormView({super.key, this.isEditMode = false});

  final bool isEditMode;

  @override
  State<BranchFormView> createState() => _BranchFormViewState();
}

class _BranchFormViewState extends State<BranchFormView> {
  final GlobalKey<FormState> _branchFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _branchFormKey,
      child: Column(
        children: [
          PageHeader(title: widget.isEditMode ? Strings.branchDetails : Strings.branchAdd),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BranchGeneralSection(),
                  BranchContactSection(),
                  BranchBusinessSection(),
                ],
              ),
            ),
          ),
          BranchActions(
            isEditMode: widget.isEditMode,
            formKey: _branchFormKey,
          ),
        ],
      ),
    );
  }
}
