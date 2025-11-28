import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/cubit/receipt_template_form_cubit/receipt_template_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/page/receipt_template_form/widgets/receipt_template_actions.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/page/receipt_template_form/widgets/sections/receipt_template_general_section.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/presentation/page/receipt_template_form/widgets/sections/receipt_template_setting_section.dart';

class ReceiptTemplateFormView extends StatefulWidget {
  const ReceiptTemplateFormView({super.key, this.isEditMode = false});

  final bool isEditMode;

  @override
  State<ReceiptTemplateFormView> createState() => _ReceiptTemplateFormViewState();
}

class _ReceiptTemplateFormViewState extends State<ReceiptTemplateFormView> {
  final GlobalKey<FormState> _receiptTemplateFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _receiptTemplateFormKey,
      child: Column(
        children: [
          PageHeader(title: title),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReceiptTemplateGeneralSection(),
                  ReceiptTemplateSettingSection(),
                ],
              ),
            ),
          ),
          if (isNotSystemDefault)
            ReceiptTemplateActions(
              isEditMode: widget.isEditMode,
              formKey: _receiptTemplateFormKey,
            ),
        ],
      ),
    );
  }

  bool get isNotSystemDefault => !context.read<ReceiptTemplateFormCubit>().state.isSystemDefault;

  String get title {
    if (isNotSystemDefault) {
      return widget.isEditMode ? 'Edit Receipt Template' : 'Add Receipt Template';
    } else {
      return 'System Default Receipt Template (Read-only)';
    }
  }
}
