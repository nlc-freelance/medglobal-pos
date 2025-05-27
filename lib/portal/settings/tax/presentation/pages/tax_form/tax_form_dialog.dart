import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/form_validators.dart';
import 'package:medglobal_admin_portal/core/widgets/dialog/app_custom_dialog.dart';
import 'package:medglobal_admin_portal/core/widgets/form/form.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/cubit/tax_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/bloc/tax_bloc/tax_bloc.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TaxFormDialog extends StatefulWidget {
  const TaxFormDialog({super.key});

  @override
  State<TaxFormDialog> createState() => _TaxFormDialogState();
}

class _TaxFormDialogState extends State<TaxFormDialog> {
  final GlobalKey<FormState> _taxFormKey = GlobalKey<FormState>();

  late TaxFormCubit _taxFormCubit;
  late TaxBloc _taxBloc;
  late TextEditingController _codeController;
  late TextEditingController _rateController;

  @override
  void initState() {
    super.initState();

    _taxFormCubit = context.read<TaxFormCubit>();
    _taxBloc = context.read<TaxBloc>();

    _taxBloc.add(const TaxEvent.reset()); // For when an error occured during deletion

    _codeController = TextEditingController(text: _taxFormCubit.state.code);
    _rateController = TextEditingController(text: _taxFormCubit.state.rate?.toString());
  }

  @override
  Widget build(BuildContext context) {
    return AppCustomDialog(
      title: _taxFormCubit.state.id != null ? Strings.taxEdit : Strings.taxAdd,
      content: Form(
        key: _taxFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFormField.top(
              label: 'Tax Code Name',
              hint: 'Enter tax code name',
              controller: _codeController,
              isRequired: true,
              validator: FormValidators.required('Please enter a tax code name.'),
              onChanged: (value) => _taxFormCubit.setCode(value),
            ),
            const UIVerticalSpace(16),
            AppTextFormField.top(
              label: 'Tax Rate (%)',
              hint: 'Enter tax rate',
              controller: _rateController,
              isRequired: true,
              validator: (value) => FormValidators.run(
                value,
                [
                  FormValidators.required('Please enter the tax rate.'),
                  FormValidators.numberReachMaximum(
                    max: 100,
                    message: 'Tax rate cannot be equal or greater than 100%.',
                  ),
                ],
              ),
              formatter: [NumberInputFormatter()],
              onChanged: (value) => _taxFormCubit.setRate(double.parse(value)),
            ),
            const UIVerticalSpace(16),
            BlocBuilder<TaxFormCubit, TaxFormState>(
              builder: (context, state) => AppCheckboxListTile(
                label: 'Set as default',
                subtitle: 'When set as default, this tax will be auto-selected when tax is enabled in product pricing.',
                value: state.isDefault,
                onToggle: (value) => _taxFormCubit.setIsDefault(value),
              ),
            ),
            const UIVerticalSpace(16),
            BlocBuilder<TaxBloc, TaxState>(
              builder: (context, state) {
                return state.maybeWhen(
                  failure: (message) => PageErrorNotice(message: message),
                  orElse: () => const SizedBox(),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UIButton.outlined('Cancel', onClick: () => Navigator.pop(context)),
                const UIHorizontalSpace(8),
                UIButton.filled('Save', onClick: _onSave),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onSave() {
    if (_taxFormKey.currentState?.validate() == true) {
      final tax = _taxFormCubit.toTax();

      if (tax.isDefault) {
        // If isDefault is true, check if there's already a default tax code
        _taxBloc.add(const TaxEvent.getDefaultTaxCode());
      } else {
        final event = _taxFormCubit.state.id == null ? TaxEvent.createTaxCode(tax) : TaxEvent.updateTaxCode(tax);
        _taxBloc.add(event);
      }
    }
  }

  @override
  void dispose() {
    _codeController.dispose();
    _rateController.dispose();

    // Reset cubit and bloc upon dialog dispose,
    // as they are not automatically reset since the context is different when opened in a dialog.
    // The cubit and bloc are only using the existing instance passed using BlocProvider.value,
    // and that does not automatically reset the state.
    _taxFormCubit.reset();
    _taxBloc.add(const TaxEvent.reset());

    super.dispose();
  }
}
