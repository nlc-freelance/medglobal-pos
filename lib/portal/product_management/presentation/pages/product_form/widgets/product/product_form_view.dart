import 'package:flutter/widgets.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/product/sections/product_general_section.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/product/product_form_actions.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/product/sections/product_variant_section.dart';

class ProductFormView extends StatefulWidget {
  const ProductFormView({super.key, this.isEditMode = false});

  final bool isEditMode;

  @override
  State<ProductFormView> createState() => _ProductFormViewState();
}

class _ProductFormViewState extends State<ProductFormView> {
  final GlobalKey<FormState> _productFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _productFormKey,
      child: Column(
        children: [
          PageHeader(title: widget.isEditMode ? 'Edit Product' : 'Add Product'),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductGeneralSection(),
                  ProductVariantSection(),
                ],
              ),
            ),
          ),
          ProductFormActions(
            isEditMode: widget.isEditMode,
            formKey: _productFormKey,
          ),
        ],
      ),
    );
  }
}
