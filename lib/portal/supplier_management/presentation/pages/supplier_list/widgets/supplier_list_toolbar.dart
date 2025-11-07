import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/gen/assets.gen.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list_filter/supplier_list_filter_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class SupplierListToolbar extends StatefulWidget {
  const SupplierListToolbar({super.key});

  @override
  State<SupplierListToolbar> createState() => _SupplierListToolbarState();
}

class _SupplierListToolbarState extends State<SupplierListToolbar> {
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return UISearchField(
      fieldWidth: 450.0,
      hint: 'Search supplier name',
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Assets.icons.search.svg(),
      ),
      onChanged: (value) => _debouncer.run(
        (() {
          final filterCubit = context.read<SupplierListFilterCubit>();
          filterCubit.setSearch(value);

          final query = filterCubit.state.toPageQuery;
          context.read<PaginatedListBloc<Supplier>>().add(PaginatedListEvent.fetch(query: query));
        }),
      ),
    );
  }

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }
}
