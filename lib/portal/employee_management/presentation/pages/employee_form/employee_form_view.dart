import 'package:flutter/material.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/employee_actions.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/employee_general_section.dart';
import 'package:medglobal_admin_portal/portal/employee_management/presentation/pages/employee_form/widgets/sections/employee_role_access_section.dart';

class EmployeeFormView extends StatefulWidget {
  const EmployeeFormView({super.key, this.isEditMode = false});

  final bool isEditMode;

  @override
  State<EmployeeFormView> createState() => _EmployeeFormViewState();
}

class _EmployeeFormViewState extends State<EmployeeFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const PageHeader(title: 'Add Employee'),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EmployeeGeneralSection(),
                  EmployeeRoleAccessSection(),
                ],
              ),
            ),
          ),
          EmployeeActions(
            isEditMode: widget.isEditMode,
            formKey: _formKey,
          ),
        ],
      ),
    );
  }
}
