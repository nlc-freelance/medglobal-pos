import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/portal/product_management/domain/entities/product/product.dart';
import 'package:medglobal_admin_portal/portal/product_management/presentation/cubit/product_list_filter_cubit/product_list_filter_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class ProductFilters extends StatefulWidget {
  const ProductFilters({super.key});

  @override
  State<ProductFilters> createState() => _ProductFiltersState();
}

class _ProductFiltersState extends State<ProductFilters> {
  final _debouncer = Debouncer(milliseconds: 500);
  late final ProductListFilterCubit _filterCubit;

  @override
  void initState() {
    super.initState();
    _filterCubit = context.read<ProductListFilterCubit>();
    _filterCubit.reset();
  }

  @override
  Widget build(BuildContext context) {
    return DataGridToolbar(
      reportType: ReportType.products,
      search: UISearchField(
        fieldWidth: 500.0,
        hint: 'Search product name',
        icon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Assets.icons.search.svg(),
        ),
        onChanged: (value) => _debouncer.run(
          (() {
            _filterCubit.setSearch(value);
            final query = _filterCubit.state.toPageQuery;
            context.read<PaginatedListBloc<Product>>().add(PaginatedListEvent.fetch(query: query));
          }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }
}
