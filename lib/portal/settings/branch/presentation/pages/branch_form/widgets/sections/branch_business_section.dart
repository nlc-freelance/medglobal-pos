import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/bloc/branch_bloc/branch_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/presentation/cubit/branch_form_cubit/branch_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/receipt_template/domain/entity/receipt_template.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class BranchBusinessSection extends StatefulWidget {
  const BranchBusinessSection({super.key});

  @override
  State<BranchBusinessSection> createState() => _BranchBusinessSectionState();
}

class _BranchBusinessSectionState extends State<BranchBusinessSection> with DialogMixin {
  late TextEditingController _brnController;
  late TextEditingController _vatIdController;
  late BranchFormCubit _formCubit;

  @override
  void initState() {
    super.initState();

    _formCubit = context.read<BranchFormCubit>();

    _brnController = TextEditingController(text: _formCubit.state.businessRegistrationNumber);
    _vatIdController = TextEditingController(text: _formCubit.state.vatIdNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PageSectionTitle(title: 'Business Information'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  AppTextFormField.top(
                    label: 'Business Registration Number (BRN)',
                    hint: 'Enter business registration number',
                    controller: _brnController,
                    isRequired: true,
                    validator: FormValidators.required('Please enter the BRN.'),
                    onChanged: (value) => _formCubit.setBusinessRegistrationNumber(value),
                  ),
                  const UIVerticalSpace(16),
                  BlocConsumer<BranchBloc, BranchState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        newBranch: (template) => _formCubit.setReceiptTemplate(template),
                        orElse: () {},
                      );
                    },
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IgnorePointer(
                            ignoring: state.maybeWhen(
                              initializingNewBranch: () => true,
                              orElse: () => false,
                            ),
                            child: AppDropdownFormField<ReceiptTemplate>.lazy(
                              label: 'Receipt Template',
                              hint: state.maybeWhen(
                                initializingNewBranch: () => 'Loading Default...',
                                orElse: () => 'Select receipt template',
                              ),
                              isRequired: true,
                              getName: (ReceiptTemplate item) => item.name,
                              onChanged: (ReceiptTemplate item) => _formCubit.setReceiptTemplate(item),
                              value: state.maybeWhen(
                                newBranch: (template) => template,
                                orElse: () => _formCubit.state.receiptTemplate,
                              ),
                              anchor: const Aligned(
                                target: Alignment.topCenter,
                                follower: Alignment.topCenter,
                              ),
                            ),
                          ),
                          BlocBuilder<BranchFormCubit, BranchFormState>(
                            builder: (context, state) => !state.isReceiptTemplateValid
                                ? UIText.dataGridText(
                                    'Please select a receipt template.',
                                    color: UIColors.buttonDanger,
                                  )
                                : const SizedBox(),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const UIHorizontalSpace(16),
            Expanded(
              child: AppTextFormField.top(
                label: 'GST/VAT Id. No.',
                hint: 'Enter GST/VAT Id. No.',
                controller: _vatIdController,
                onChanged: (value) => _formCubit.setVatIdNumber(value),
              ),
            ),
          ],
        ),
        const UIVerticalSpace(16),
      ],
    );
  }

  @override
  void dispose() {
    _brnController.dispose();
    _vatIdController.dispose();
    super.dispose();
  }
}
