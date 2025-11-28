import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form_cubit/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:uuid/uuid.dart';

class VariantFormActions extends StatelessWidget {
  const VariantFormActions({
    super.key,
    required this.formKey,
    required this.onCancel,
  });

  final GlobalKey<FormState> formKey;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocSelector<VariantFormCubit, VariantFormState, bool>(
          selector: (state) => state.isValid,
          builder: (context, isValid) => isValid
              ? const SizedBox.shrink()
              : const PageErrorBanner(message: 'Please fill in all required fields before continuing.'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            UIButton.outlined(
              'Cancel',
              onClick: () {
                onCancel();
                Navigator.pop(context);
              },
            ),
            const UIHorizontalSpace(8),
            UIButton.filled(
              'Save variant',
              onClick: () {
                final productFormCubit = context.read<ProductFormCubit>();
                final variantFormUiCubit = context.read<VariantFormUiCubit>();
                final variantFormCubit = context.read<VariantFormCubit>();
                final variantFormState = variantFormCubit.state;

                final isValid = variantFormCubit.validate();

                if (formKey.currentState?.validate() == true && isValid) {
                  final variant = variantFormState.variant;

                  if (variant.id == null) {
                    final newVariant = variant.copyWith(id: -(const Uuid().v4().hashCode));

                    // -----
                    // if (context.read<ProductFormCubit>().state.variants?.length == 1 &&
                    //     context.read<ProductFormCubit>().state.variants!.first.name == 'default') {
                    // ---

                    /// If the user is editing the initial default variant to be a named (specific) variant,
                    /// replace that default variant in the state with the updated one.
                    ///
                    /// Otherwise, treat it as a new variant and add it normally.
                    if (productFormCubit.state.hasOnlyDefaultVariant) {
                      productFormCubit.replaceDefaultVariant(newVariant);
                    } else {
                      productFormCubit.addVariant(newVariant);
                    }
                  } else {
                    productFormCubit.updateVariant(variant);
                  }

                  variantFormCubit.reset();
                  variantFormUiCubit.hideVariantFormUi();
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
