import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/features/product_management/domain/entities/product/variant.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product/product_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_form/product_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/cubit/product_form/variant_form/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/general/general_information.dart';
import 'package:medglobal_admin_portal/features/product_management/presentation/pages/product_details/widgets/inventory/inventory_information.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, this.id});

  final String? id;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late ProductCubit _productCubit;
  late ProductFormCubit _productFormCubit;
  late VariantFormCubit _variantFormCubit;

  @override
  void initState() {
    super.initState();
    _productCubit = BlocProvider.of<ProductCubit>(context);
    _productFormCubit = BlocProvider.of<ProductFormCubit>(context);
    _variantFormCubit = BlocProvider.of<VariantFormCubit>(context);

    if (widget.id != null) {
      final id = int.parse(widget.id!);
      _productCubit.getProductById(id);
    } else {
      _productFormCubit.setProduct(const Product());
      _variantFormCubit.setVariant(const Variant());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (_, state) {
        if (state is ProductByIdSuccess) _productFormCubit.setProduct(state.product);
      },
      builder: (_, state) {
        if (state is ProductByIdError) {
          return Center(child: Text(state.message));
        }
        if (state is ProductByIdSuccess || widget.id == null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageHeader(
                title: widget.id != null ? 'Edit Product' : 'Add Product',
                subtitle: Strings.subtitlePlaceholder,
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GeneralInformation(),
                      InventoryInformation(),
                    ],
                  ),
                ),
              ),
              CancelActionButton(
                onCancel: () => AppRouter.router.pushReplacementNamed(SideMenuTreeItem.manageProducts.name),
                onAction: () {
                  print(BlocProvider.of<ProductFormCubit>(context).state.product);

                  /// Move to VariantForm, in Add Variant button.  Get the variant ther and add it on the variants list of the product.
                  print(BlocProvider.of<VariantFormCubit>(context).state.variant);
                  // TODO: Add Product
                },
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2));
      },
    );
  }
}
