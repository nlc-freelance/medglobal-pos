import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/toast_notification.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product/product_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_details/widgets/general/general_information.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_details/widgets/inventory_and_variants/inventory_and_variants_information.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, this.id});

  final String? id;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _productNameController;

  late ProductCubit _productCubit;
  late ProductFormCubit _productFormCubit;
  late VariantFormCubit _variantFormCubit;

  late int _id;

  String? _hasMissingRequiredFieldsError;

  @override
  void initState() {
    super.initState();
    _productCubit = BlocProvider.of<ProductCubit>(context);
    _productFormCubit = BlocProvider.of<ProductFormCubit>(context);
    _variantFormCubit = BlocProvider.of<VariantFormCubit>(context);

    _productNameController = TextEditingController();

    if (isEditingProduct) {
      setState(() => _id = int.parse(widget.id!));
      _productCubit.getProductById(_id);

      /// Clear variant state
      _variantFormCubit.setVariant(const Variant());
    } else {
      _productCubit.reset();
      _productFormCubit.setProduct(const Product());
      _variantFormCubit.setVariant(const Variant(name: 'default'));
    }

    /// Close variant form UI
    BlocProvider.of<VariantFormUiCubit>(context).hideVariantFormUi();
  }

  @override
  void dispose() {
    _productNameController.dispose();
    super.dispose();
  }

  bool get isEditingProduct => widget.id != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageHeader(
          title: isEditingProduct ? 'Edit Product' : 'Add Product',
          subtitle: Strings.subtitlePlaceholder,
        ),
        Expanded(
          child: BlocConsumer<ProductCubit, ProductState>(
            listener: (_, state) {
              if (state is ProductByIdSuccess) {
                _productFormCubit.setProduct(state.product);
                _productNameController.text = state.product.name ?? '';
              }
              if (state is ProductSuccess) {
                AppRouter.router.pushReplacementNamed(SideMenuTreeItem.PRODUCTS.name);
                ToastNotification.success(context, state.message);
              }
            },
            builder: (_, state) {
              if (state is ProductByIdError && isEditingProduct) {
                return Center(child: Text(state.message));
              }
              if (state is ProductByIdLoading) {
                return const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2));
              }

              return Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GeneralInformation(productNameController: _productNameController),
                            const InventoryAndVariantsInformation(),
                          ],
                        ),
                      ),
                    ),
                    const UIVerticalSpace(30),
                    if (state is ProductError)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Assets.icons.infoCircle.svg(),
                          const UIHorizontalSpace(8),
                          UIText.labelSemiBold(state.message, color: UIColors.buttonDanger),
                        ],
                      ),
                    if (_hasMissingRequiredFieldsError != null) ...[
                      UIText.labelSemiBold(_hasMissingRequiredFieldsError!, color: UIColors.buttonDanger),
                      const UIVerticalSpace(8),
                    ],
                    Row(
                      children: [
                        if (isEditingProduct)
                          UIButton.text(
                            'Delete',
                            iconBuilder: (isHover) => Assets.icons.trash.setColorOnHover(isHover),
                            onClick: () => context.read<ProductCubit>().delete(_id),
                          ),
                        const Spacer(),
                        CancelActionButton(
                          onCancel: () => AppRouter.router.pop(),
                          isLoading: state is ProductLoading,
                          onAction: () {
                            if (_formKey.currentState?.validate() == true) {
                              final initialProduct = _productFormCubit.state.product;

                              /// If product has no variants, add the default one
                              if (initialProduct?.hasVariants != true) {
                                final variant = _variantFormCubit.state.variant;
                                if (variant != null) _productFormCubit.setDefaultVariant(variant);
                              }

                              /// Else, call the product as is. The variants should already been added inside the Variant Form
                              final product =
                                  _productFormCubit.state.product!.copyWith(name: _productNameController.text);

                              if (widget.id == null) {
                                _productCubit.create(product);
                              } else {
                                _productCubit.update(product.id!, product);
                              }
                              setState(() => _hasMissingRequiredFieldsError = null);
                            } else {
                              setState(() => _hasMissingRequiredFieldsError =
                                  'One or more required fields are empty. Please check your inputs.');
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
