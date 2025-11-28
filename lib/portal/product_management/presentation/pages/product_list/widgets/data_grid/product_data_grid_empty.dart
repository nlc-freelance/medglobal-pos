import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_empty.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list_filter_cubit/product_list_filter_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductDataGridEmpty extends StatelessWidget {
  const ProductDataGridEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final isSearching = context.read<ProductListFilterCubit>().state.search?.isNotEmpty == true;

    return DataGridEmpty(
      title: isSearching ? Strings.productSearchNotFoundTitle : Strings.productEmptyTitle,
      subtitle: isSearching ? Strings.productSearchNotFoundSubtitle : Strings.productEmptySubtitle,
      action: isSearching
          ? null
          : UIButton.filled(
              Strings.newProduct,
              icon: Assets.icons.add.setSize(12.0),
              onClick: () {},
            ),
    );
  }
}
