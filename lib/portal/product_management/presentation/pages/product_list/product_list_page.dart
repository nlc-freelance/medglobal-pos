import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/app_gap.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/bloc/product_bulk_bloc/product_bulk_bloc.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/widgets/data_grid/product_data_grid.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/widgets/product_list_toolbar.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/widgets/product_list_header.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/pages/product_list/widgets/product_bulk_select_toolbar.dart';

class ProductListPage extends StatelessWidget {
  static String route = '/products';

  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBulkBloc, ProductBulkState>(
      listener: (context, state) => state.maybeWhen(
        processing: () => PageLoader.show(context),
        success: (message) => _onSuccess(context, message),
        failure: (message) => _onFailure(context, message),
        orElse: () => {},
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductListHeader(),
          AppGap.v(20),
          ProductListToolbar(),
          AppGap.v(20),
          ProductBulkSelectToolbar(),
          Expanded(child: ProductDataGrid()),
        ],
      ),
    );
  }

  void _onSuccess(BuildContext context, String message) {
    PageLoader.close();
    SnackbarUtil.success(context, message);
    context.read<PaginatedListBloc<Product>>().add(const PaginatedListEvent.fetch());
  }

  void _onFailure(BuildContext context, String message) {
    PageLoader.close();
    SnackbarUtil.error(context, message);
  }
}
