import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/bloc/tax/tax_bloc.dart';
import 'package:medglobal_admin_portal/portal/settings/tax/presentation/cubit/tax_form_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TaxFormDialog extends StatelessWidget {
  const TaxFormDialog({super.key, required this.cubit, required this.bloc});

  final TaxFormCubit cubit;
  final TaxBloc bloc;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: cubit),
          BlocProvider.value(value: bloc),
        ],
        child: const TaxForm(),
      );
}

class TaxForm extends StatefulWidget {
  const TaxForm({super.key});

  @override
  State<TaxForm> createState() => _TaxFormState();
}

class _TaxFormState extends State<TaxForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TaxFormCubit _formCubit;
  late TextEditingController _codeController;
  late TextEditingController _rateController;

  @override
  void initState() {
    super.initState();

    _formCubit = context.read<TaxFormCubit>();

    _codeController = TextEditingController(text: _formCubit.state.code);
    _rateController = TextEditingController(text: _formCubit.state.rate?.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaxBloc, TaxState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (tax, message) => _onDismiss(),
          orElse: () {},
        );
      },
      builder: (context, state) => Dialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
        backgroundColor: UIColors.background,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(child: UIText.heading5(_formCubit.state.id != null ? 'Edit Tax Code' : 'Add Tax Code')),
                    IconButton(
                      onPressed: _onDismiss,
                      visualDensity: VisualDensity.compact,
                      padding: const EdgeInsets.all(2),
                      icon: Assets.icons.close.svg(),
                    ),
                  ],
                ),
                const Divider(color: UIColors.borderMuted),
                const UIVerticalSpace(16),
                UITextFormField.vertical(
                  label: 'Tax Code Name',
                  isRequired: true,
                  controller: _codeController,
                  hint: 'Enter tax code name',
                  onChanged: (value) => _formCubit.setCode(value),
                  validation: 'Please enter a tax code name.',
                ),
                const UIVerticalSpace(16),
                UITextFormField.vertical(
                  label: 'Tax Rate (%)',
                  isRequired: true,
                  controller: _rateController,
                  formatter: [FilteringTextInputFormatter.digitsOnly],
                  hint: 'Enter tax rate',
                  onChanged: (value) => _formCubit.setRate(double.parse(value)),
                  validation: 'Please enter the tax rate.',
                ),
                const UIVerticalSpace(16),
                BlocBuilder<TaxFormCubit, TaxFormState>(
                  builder: (context, state) => UICheckboxListTile(
                    'Set as default',
                    subtitle:
                        'When set as default, this tax will be automatically applied to product pricing when applicable.',
                    value: state.isDefault,
                    onToggle: (value) => _formCubit.setIsDefault(value),
                  ),
                ),
                const UIVerticalSpace(16),
                state.maybeWhen(
                  failure: (message) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: UIText.labelMedium(message, color: UIColors.buttonDanger),
                  ),
                  orElse: () => const SizedBox(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UIButton.outlined('Cancel', onClick: _onDismiss),
                    const UIHorizontalSpace(8),
                    UIButton.filled('Save', onClick: _onSave),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSave() {
    if (_formKey.currentState?.validate() == true) {
      final tax = _formCubit.toTax();
      final event = _formCubit.state.id == null ? TaxEvent.createTaxCode(tax) : TaxEvent.updateTaxCode(tax);

      context.read<TaxBloc>().add(event);
    }
  }

  void _onDismiss() {
    Navigator.pop(context);
    context.read<TaxBloc>().add(const TaxEvent.reset());
  }

  @override
  void dispose() {
    _codeController.dispose();
    _rateController.dispose();

    // Reset form cubit upon dialog dismiss
    _formCubit.reset();

    super.dispose();
  }
}
