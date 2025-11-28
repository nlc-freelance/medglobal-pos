import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/blocs/paginated_list_bloc/paginated_list_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/bloc/supplier_bloc.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list_filter/supplier_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_details/supplier_details_dialog.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_list/widgets/supplier_data_grid_empty.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SupplierDataGrid extends StatefulWidget {
  const SupplierDataGrid({super.key});

  @override
  State<SupplierDataGrid> createState() => _SupplierPaginatedDataGridState();
}

class _SupplierPaginatedDataGridState extends State<SupplierDataGrid> {
  late DataGridController _dataGridController;
  late SupplierDataGridSource _supplierDataGridSource;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedListBloc<Supplier>, PaginatedListState<Supplier>>(
      // listener: (context, state) {
      //   if (state is SupplierListLoaded) {
      //     suppliers = state.data.items;
      //     _supplierDataSource = SupplierDataSource(suppliers);
      //   }
      //   if (state is SupplierSearchNoResult) {
      //     _supplierDataSource = SupplierDataSource([]);
      //   }
      // },
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (data) {
            final paginatedData = data;
            _supplierDataGridSource = SupplierDataGridSource(suppliers: paginatedData.items);

            return Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: DataGridUtil.verticalBorder,
                    child: SfDataGridTheme(
                      data: DataGridUtil.rowNavigationStyle,
                      child: SfDataGrid(
                        source: _supplierDataGridSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.suppliers),
                        controller: _dataGridController,
                        shrinkWrapRows: true,
                        navigationMode: GridNavigationMode.row,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerRowHeight: 38,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        gridLinesVisibility: GridLinesVisibility.none,
                        footerHeight: 280,
                        footer: _supplierDataGridSource.rows.isEmpty ? const SupplierDataGridEmpty() : null,
                        onCellTap: (details) {
                          if (details.rowColumnIndex.rowIndex != 0) {
                            final id = _supplierDataGridSource.rows[details.rowColumnIndex.rowIndex - 1]
                                .getCells()
                                .first
                                .value;

                            // TODO: Refactor supplier form
                            showGeneralDialog(
                              // barrierLabel: create(context).toString(),
                              barrierDismissible: false,
                              transitionDuration: const Duration(milliseconds: 300),
                              context: context,
                              pageBuilder: (_, animation1, animation2) => BlocProvider.value(
                                value: context.read<SupplierBloc>(),
                                child: SupplierFormDialog(
                                    supplier: (data.items).firstWhere((supplier) => supplier.id == id)),
                              ),
                              transitionBuilder: (context, animation1, animation2, child1) {
                                return SlideTransition(
                                  position:
                                      Tween(begin: const Offset(1, 0), end: const Offset(0, 0)).animate(animation1),
                                  child: child1,
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const UIVerticalSpace(12),
                if (paginatedData.hasItems)
                  DataGridPagination<Supplier>(
                    paginatedData,
                    onPageChanged: ({required page, required size}) {
                      final filterCubit = context.read<SupplierListFilterCubit>();

                      filterCubit.setPageAndSize(page, size);

                      context
                          .read<PaginatedListBloc<Supplier>>()
                          .add(PaginatedListEvent<Supplier>.fetch(query: filterCubit.state.toPageQuery));
                    },
                  ),
              ],
            );
          },
          failure: (message) => FailureView(message),
          orElse: () => DataGridLoading(
            columns: DataGridUtil.getColumns(DataGridColumn.suppliers),
            source: _supplierDataGridSource = SupplierDataGridSource(suppliers: []),
          ),
        );
        //   if (state is SupplierListError) {
        //     return Text(state.message);
        //   }
        //   if (state is SupplierSearchNoResult) {
        //     return DataGridNoData.custom(
        //       message: state.message,
        //       columns: DataGridUtil.getColumns(DataGridColumn.suppliers),
        //       source: _supplierDataSource,
        //     );
        //   }
        //   if (state is SupplierListLoaded) {
        //     return Column(
        //       children: [
        //         Expanded(
        //           child: Container(
        //             decoration: UIStyleContainer.topBorder,
        //             child: ClipRect(
        //               clipper: HorizontalBorderClipper(),
        //               child: SfDataGridTheme(
        //                 data: DataGridUtil.rowNavigationStyle,
        //                 child: SfDataGrid(
        //                   source: _supplierDataSource,
        //                   columns: DataGridUtil.getColumns(DataGridColumn.suppliers),
        //                   controller: _dataGridController,
        //                   shrinkWrapRows: true,
        //                   navigationMode: GridNavigationMode.row,
        //                   columnWidthMode: ColumnWidthMode.fill,
        //                   headerGridLinesVisibility: GridLinesVisibility.none,
        //                   gridLinesVisibility: GridLinesVisibility.horizontal,
        //                   headerRowHeight: 38,
        //                   footerHeight: 100,
        //                   footer: _supplierDataSource.rows.isEmpty
        //                       ? Padding(
        //                           padding: const EdgeInsets.all(8.0),
        //                           child: Column(
        //                             children: [
        //                               Assets.icons.cube.svg(),
        //                               const UIVerticalSpace(12),
        //                               UIText.labelMedium('No data available'),
        //                             ],
        //                           ),
        //                         )
        //                       : null,
        //                   onCellTap: (details) {
        //                     if (details.rowColumnIndex.rowIndex != 0) {
        //                       final id =
        //                           _supplierDataSource.rows[details.rowColumnIndex.rowIndex - 1].getCells().first.value;
        //                       SupplierDetailsDialog((state.data.items).firstWhere((supplier) => supplier.id == id))
        //                           .showSidePeek(context);
        //                     }
        //                   },
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //         const UIVerticalSpace(16),
        //         if (state.data.items.isNotEmpty == true)

        //           /// TODO: Extract pager to its own widget
        //           Row(
        //             children: [
        //               BlocListener<SupplierListFilterCubit, SupplierListFilterState>(
        //                 listenWhen: (previous, current) => previous.size != current.size,
        //                 listener: (context, filter) {
        //                   setState(() => _rowsPerPage = filter.size!);
        //                 },
        //                 child: UIPopupMenuButton.textIcon(
        //                   title: '$_rowsPerPage rows',
        //                   iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
        //                   onSelect: (value) {
        //                     setState(() => _rowsPerPage = value);
        //                     context.read<SupplierListFilterCubit>().setSize(value);

        //                     /// Go back to page 1 when:
        //                     ///  - total count is greater than the requested rows per page
        //                     ///  - requested rows per page will not have data anymore in the upcoming page to request
        //                     /// Example:
        //                     /// Previous list is 20 rows per page and have a total of 5 pages,
        //                     ///  when user now requests to have 100 rows per page, and the total page becomes less than 5,
        //                     ///  the next response will be an empty list.
        //                     /// To avoid, use the [totalPage], [totalCount] and the [rowsPerPage] selected to check
        //                     ///  if the page to pass in the request will be greater than the [totalPage] of our data.
        //                     /// If it is greater than the actual total page, then reset it to 1.
        //                     if (state.data.totalCount <= value ||
        //                         state.data.totalPages + 1 >
        //                             ((state.data.totalCount + (_rowsPerPage - 1)) / _rowsPerPage)) {
        //                       context.read<SupplierListCubit>().getSuppliers(
        //                             page: 1,
        //                             size: _rowsPerPage,
        //                             search: context.read<SupplierListFilterCubit>().state.search,
        //                           );
        //                     } else {
        //                       context.read<SupplierListCubit>().getSuppliers(
        //                             page: state.data.currentPage,
        //                             size: _rowsPerPage,
        //                             search: context.read<SupplierListFilterCubit>().state.search,
        //                           );
        //                     }
        //                   },
        //                   menu: const [20, 50, 100],
        //                   menuAsString: (menu) => menu.toString(),
        //                 ),
        //               ),
        //               const UIHorizontalSpace(16),
        //               UIText.labelMedium(
        //                 'Viewing ${(state.data.currentPage - 1) * _rowsPerPage + 1} - ${state.data.currentPage * _rowsPerPage > state.data.totalCount ? state.data.totalCount : state.data.currentPage * _rowsPerPage} of ${state.data.totalCount} records',
        //                 color: UIColors.textLight,
        //               ),
        //               const Spacer(),
        //               UIText.labelMedium(
        //                 'Page ${state.data.currentPage} of ${state.data.totalPages}',
        //                 color: UIColors.textLight,
        //               ),
        //               const UIHorizontalSpace(16),
        //               IconButton(
        //                 onPressed: () {
        //                   if (state.data.currentPage != 1) {
        //                     context.read<SupplierListCubit>().getSuppliers(
        //                           page: 1,
        //                           size: _rowsPerPage,
        //                           search: context.read<SupplierListFilterCubit>().state.search,
        //                         );
        //                   }
        //                 },
        //                 icon: Assets.icons.firstPage.svg(
        //                   colorFilter:
        //                       (state.data.currentPage == 1 ? UIColors.textMuted : UIColors.textRegular).toColorFilter,
        //                 ),
        //               ),
        //               IconButton(
        //                 onPressed: () {
        //                   if (state.data.currentPage != 1) {
        //                     context.read<SupplierListCubit>().getSuppliers(
        //                           page: state.data.currentPage - 1,
        //                           size: _rowsPerPage,
        //                           search: context.read<SupplierListFilterCubit>().state.search,
        //                         );
        //                   }
        //                 },
        //                 icon: Assets.icons.arrowLeft.svg(
        //                   colorFilter:
        //                       (state.data.currentPage == 1 ? UIColors.textMuted : UIColors.textRegular).toColorFilter,
        //                 ),
        //               ),
        //               IconButton(
        //                 onPressed: () {
        //                   if (state.data.currentPage != state.data.totalPages) {
        //                     context.read<SupplierListCubit>().getSuppliers(
        //                           page: state.data.currentPage + 1,
        //                           size: _rowsPerPage,
        //                           search: context.read<SupplierListFilterCubit>().state.search,
        //                         );
        //                   }
        //                 },
        //                 icon: Assets.icons.arrowRight.svg(
        //                   colorFilter: (state.data.currentPage == state.data.totalPages
        //                           ? UIColors.textMuted
        //                           : UIColors.textRegular)
        //                       .toColorFilter,
        //                 ),
        //               ),
        //               IconButton(
        //                 onPressed: () {
        //                   if (state.data.currentPage != state.data.totalPages) {
        //                     context.read<SupplierListCubit>().getSuppliers(
        //                           page: state.data.totalPages,
        //                           size: _rowsPerPage,
        //                           search: context.read<SupplierListFilterCubit>().state.search,
        //                         );
        //                   }
        //                 },
        //                 icon: Assets.icons.lastPage.svg(
        //                   colorFilter: (state.data.currentPage == state.data.totalPages
        //                           ? UIColors.textMuted
        //                           : UIColors.textRegular)
        //                       .toColorFilter,
        //                 ),
        //               ),
        //             ],
        //           ),
        //       ],
        //     );
        //   }
        //   return DataGridLoading(
        //     columns: DataGridUtil.getColumns(DataGridColumn.suppliers),
        //     source: _supplierDataSource = SupplierDataSource([]),
        //   );
      },
    );
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }
}

class SupplierDataGridSource extends DataGridSource {
  SupplierDataGridSource({required List<Supplier> suppliers}) {
    _suppliers = suppliers;
    buildDataGridRows();
  }

  List<Supplier> _suppliers = [];
  List<DataGridRow> dataGridRows = [];

  void buildDataGridRows() => dataGridRows = _suppliers.map((supplier) => supplier.toDataGridRow()).toList();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: cell.columnName == 'name'
              ? HoverBuilder(
                  builder: (isHover) => UIText.dataGridText(
                    cell.value.toString(),
                    color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
                    textDecoration: TextDecoration.underline,
                  ),
                )
              :
              // Container(
              //         alignment: Alignment.centerLeft,
              //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //         child:
              UIText.dataGridText(cell.value.toString()),
        );
        // );
      }).toList(),
    );
  }
}
