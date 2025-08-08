import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/extensions/extensions.dart';
import 'package:medglobal_admin_portal/core/mixins/dialog_mixin.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form_cubit/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/form_models/variant_form_model.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:uuid/uuid.dart';

class ProductFormActions extends StatelessWidget with DialogMixin {
  const ProductFormActions({
    super.key,
    required this.isEditMode,
    required this.formKey,
  });

  final bool isEditMode;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ProductBloc, ProductState>(
            builder: (builderContext, state) => state.maybeWhen(
              failure: (message) => PageErrorBanner(message: message),
              orElse: () => const SizedBox(),
            ),
          ),
          Row(
            children: [
              if (isEditMode)
                UIButton.text(
                  'Delete',
                  iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
                  onClick: () => _onDelete(context),
                ),
              const Spacer(),
              UIButton.outlined('Cancel', onClick: () => _onCancel(context)),
              const UIHorizontalSpace(8),
              UIButton.filled('Save', onClick: () => _onSave(context)),
            ],
          ),
        ],
      ),
    );
  }

  void _onDelete(BuildContext context) {
    final formState = context.read<ProductFormCubit>().state;

    final productId = formState.id;
    final productName = formState.name;

    if (productId == null || productName == null || productName.isEmpty) {
      SnackbarUtil.error(context, 'Product ID or name is missing.');
      return;
    }

    showDeleteDialog(
      context,
      subject: 'Product',
      item: productName,
      onDelete: () => context.read<ProductBloc>().add(ProductEvent.deleteProduct(productId, productName)),
    );
  }

  void _onCancel(BuildContext context) => Navigator.pop(context);

  void _onSave(BuildContext context) {
    final productFormCubit = context.read<ProductFormCubit>();
    final variantFormState = context.read<VariantFormCubit>();

    if (productFormCubit.state.hasOnlyDefaultVariant) {
      final isDefaultVariantValid = variantFormState.state.isValid;
      if (isDefaultVariantValid) {
        final variant = variantFormState.state.variant;
        productFormCubit.replaceDefaultVariant(variant);
      }
    }

    final isValid = productFormCubit.validate();

    if (formKey.currentState?.validate() == true && isValid) {
      final product = productFormCubit.state.toProduct();

      if (product.id == null) {
        context.read<ProductBloc>().add(ProductEvent.createProduct(product));
      } else {
        context.read<ProductBloc>().add(ProductEvent.updateProduct(product));
      }
    }
  }
}
