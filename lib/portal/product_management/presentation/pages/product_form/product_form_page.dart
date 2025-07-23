import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_form_cubit/product_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_cubit/variant_form_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/variant_form_ui/variant_form_ui_cubit.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_form/widgets/product_form_view.dart';

class ProductFormPage extends StatelessWidget {
  const ProductFormPage({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductFormCubit()),
        BlocProvider(create: (context) => VariantFormCubit()),
        BlocProvider(create: (context) => VariantFormUiCubit()),
        BlocProvider(create: (context) => GetIt.I<ProductBloc>()),
      ],
      child: ProductForm(id: id),
    );
  }
}

class ProductForm extends StatefulWidget {
  const ProductForm({super.key, this.id});

  final String? id;

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  late final ProductFormCubit _productFormCubit;
  late final VariantFormCubit _variantFormCubit;

  @override
  void initState() {
    super.initState();
    _productFormCubit = context.read<ProductFormCubit>();
    _variantFormCubit = context.read<VariantFormCubit>();

    if (_isEditMode) {
      final productId = int.parse(widget.id!);
      context.read<ProductBloc>().add(ProductEvent.getProductById(productId));
    } else {
      /// If we are in create mode, we need to initialize a default variant in our VariantFormCubit
      _variantFormCubit.initDefaultVariant();

      /// Then add the default variant to the product form state.
      /// This is necessary because a product expects at least one variant (default) to be always present.
      final defaultVariant = _variantFormCubit.state.variant;
      _productFormCubit.addVariant(defaultVariant);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) => state.maybeWhen(
        loaded: (product) => _productFormCubit.loadProduct(product),
        processing: () => PageLoader.show(context),
        success: (message) => _onSuccess(context, message),
        failure: (message) => _onFailure(context, message),
        orElse: () => {},
      ),
      builder: (_, state) => state.maybeWhen(
        initial: () => _isEditMode ? const LoadingView() : const ProductFormView(),
        loading: () => const LoadingView(),
        loadFailed: (message) => FailureView(message),
        orElse: () => ProductFormView(isEditMode: _isEditMode),
      ),
    );
  }

  bool get _isEditMode => widget.id != null;

  void _onSuccess(BuildContext context, String message) {
    PageLoader.close();
    SnackbarUtil.success(context, message);
    context.read<PaginatedListBloc<Product>>().add(const PaginatedListEvent.fetch());
    context.goNamed(SideMenuTreeItem.PRODUCTS.name);
  }

  void _onFailure(BuildContext context, String message) {
    PageLoader.close();
    SnackbarUtil.error(context, message);
  }
}
