import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list_filter/supplier_list_filter_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SupplierDataGridEmpty extends StatelessWidget {
  const SupplierDataGridEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final isSearching = context.read<SupplierListFilterCubit>().state.search?.isNotEmpty == true;

    return DataGridEmpty(
      title: isSearching ? Strings.productSearchNotFoundTitle : Strings.productEmptyTitle,
      subtitle: isSearching ? Strings.productSearchNotFoundSubtitle : Strings.productEmptySubtitle,
      action: isSearching
          ? null
          : UIButton.filled(
              'New Supplier',
              icon: Assets.icons.add.setSize(12.0),
              onClick: () {},
            ),
    );
  }
}
