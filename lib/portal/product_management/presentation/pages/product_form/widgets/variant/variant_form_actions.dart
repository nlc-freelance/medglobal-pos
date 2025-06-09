import 'package:flutter/widgets.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class VariantFormActions extends StatelessWidget {
  const VariantFormActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // if (_hasMissingRequiredFieldsError != null) ...[
        //   UIText.labelSemiBold(_hasMissingRequiredFieldsError!, color: UIColors.buttonDanger),
        //   const Spacer(),
        // ],
        UIButton.outlined(
          'Cancel',
          onClick: () {
            // context.read<VariantFormUiCubit>().hideVariantFormUi();

            /// If variant name is default, meaning the product has no variant initially
            /// Therefore if user decides to try and add a variant and change his mind,
            /// the values will still exist outside the variant form
            // if (widget.nameController.text.isNotEmpty) _variantFormCubit.resetForm();

            Navigator.pop(context);
          },
        ),
        const UIHorizontalSpace(8),
        UIButton.filled(
          'Save variant',
          onClick: () {
            // final variant = _variantFormCubit.state.variant;

            // if (_formKey.currentState?.validate() == true &&
            //     variant?.hasSuppliers == true &&
            //     variant?.hasBranchInventories == true) {
            //   if (variant?.id == null) {
            //     final newVariant = variant?.copyWith(id: -(const Uuid().v4().hashCode));
            //     context.read<ProductFormCubit>().addVariant(newVariant!);
            //   } else {
            //     context.read<ProductFormCubit>().updateVariant(variant!.id!, variant);
            //   }

            //   setState(() => _hasMissingRequiredFieldsError = null);

            //   _variantFormCubit.resetForm();
            //   context.read<VariantFormUiCubit>().hideVariantFormUi();
            //   Navigator.pop(context);
            // } else {
            //   setState(() =>
            //       _hasMissingRequiredFieldsError = 'One or more required fields are empty. Please check your inputs.');
            // }
          },
        ),
      ],
    );
  }
}
