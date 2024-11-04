import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_no_data.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/domain/entities/supplier.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list/supplier_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/cubit/supplier_list_filter/supplier_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/supplier_management/presentation/pages/supplier_details/supplier_details_dialog.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SupplierPaginatedDataGrid extends StatefulWidget {
  const SupplierPaginatedDataGrid({super.key});

  @override
  State<SupplierPaginatedDataGrid> createState() => _SupplierPaginatedDataGridState();
}

class _SupplierPaginatedDataGridState extends State<SupplierPaginatedDataGrid> {
  late DataGridController _dataGridController;
  late SupplierDataSource _supplierDataSource;

  List<Supplier> suppliers = [];
  int _rowsPerPage = 20;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    context.read<SupplierListCubit>().getSuppliers();
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SupplierListCubit, SupplierListState>(
      listener: (context, state) {
        if (state is SupplierListLoaded) {
          suppliers = state.data.suppliers ?? [];
          _supplierDataSource = SupplierDataSource(suppliers);
        }
        if (state is SupplierSearchNoResult) {
          _supplierDataSource = SupplierDataSource([]);
        }
      },
      builder: (context, state) {
        if (state is SupplierListError) {
          return Text(state.message);
        }
        if (state is SupplierSearchNoResult) {
          return DataGridNoData.custom(
            message: state.message,
            columns: DataGridUtil.getColumns(DataGridColumn.PRODUCTS),
            source: _supplierDataSource,
          );
        }
        if (state is SupplierListLoaded) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  decoration: UIStyleContainer.topBorder,
                  child: ClipRect(
                    clipper: HorizontalBorderClipper(),
                    child: SfDataGridTheme(
                      data: DataGridUtil.rowNavigationStyle,
                      child: SfDataGrid(
                        source: _supplierDataSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.SUPPLIERS),
                        controller: _dataGridController,
                        shrinkWrapRows: true,
                        navigationMode: GridNavigationMode.row,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        gridLinesVisibility: GridLinesVisibility.horizontal,
                        headerRowHeight: 38,
                        footerHeight: 100,
                        footer: _supplierDataSource.rows.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Assets.icons.cube.svg(),
                                    const UIVerticalSpace(12),
                                    UIText.labelMedium('No data available'),
                                  ],
                                ),
                              )
                            : null,
                        onCellTap: (details) {
                          if (details.rowColumnIndex.rowIndex != 0) {
                            final id =
                                _supplierDataSource.rows[details.rowColumnIndex.rowIndex - 1].getCells().first.value;
                            SupplierDetailsDialog(
                                    (state.data.suppliers ?? []).firstWhere((supplier) => supplier.id == id))
                                .showSidePeek(context);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const UIVerticalSpace(16),
              if (state.data.suppliers?.isNotEmpty == true)

                /// TODO: Extract pager to its own widget
                Row(
                  children: [
                    BlocListener<SupplierListFilterCubit, SupplierListFilterState>(
                      listenWhen: (previous, current) => previous.size != current.size,
                      listener: (context, filter) {
                        setState(() => _rowsPerPage = filter.size!);
                      },
                      child: UIPopupMenuButton.textIcon(
                        title: '$_rowsPerPage rows',
                        iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
                        onSelect: (value) {
                          setState(() => _rowsPerPage = value);
                          context.read<SupplierListFilterCubit>().setSize(value);

                          /// Go back to page 1 when:
                          ///  - total count is greater than the requested rows per page
                          ///  - requested rows per page will not have data anymore in the upcoming page to request
                          /// Example:
                          /// Previous list is 20 rows per page and have a total of 5 pages,
                          ///  when user now requests to have 100 rows per page, and the total page becomes less than 5,
                          ///  the next response will be an empty list.
                          /// To avoid, use the [totalPage], [totalCount] and the [rowsPerPage] selected to check
                          ///  if the page to pass in the request will be greater than the [totalPage] of our data.
                          /// If it is greater than the actual total page, then reset it to 1.
                          if (state.data.totalCount! <= value ||
                              state.data.totalPages! + 1 >
                                  ((state.data.totalCount! + (_rowsPerPage - 1)) / _rowsPerPage)) {
                            context.read<SupplierListCubit>().getSuppliers(
                                  page: 1,
                                  size: _rowsPerPage,
                                  search: context.read<SupplierListFilterCubit>().state.search,
                                );
                          } else {
                            context.read<SupplierListCubit>().getSuppliers(
                                  page: state.data.currentPage!,
                                  size: _rowsPerPage,
                                  search: context.read<SupplierListFilterCubit>().state.search,
                                );
                          }
                        },
                        menu: const [20, 50, 100],
                        menuAsString: (menu) => menu.toString(),
                      ),
                    ),
                    const UIHorizontalSpace(16),
                    UIText.labelMedium(
                      'Viewing ${(state.data.currentPage! - 1) * _rowsPerPage + 1} - ${state.data.currentPage! * _rowsPerPage > state.data.totalCount! ? state.data.totalCount! : state.data.currentPage! * _rowsPerPage} of ${state.data.totalCount} records',
                      color: UIColors.textLight,
                    ),
                    const Spacer(),
                    UIText.labelMedium(
                      'Page ${state.data.currentPage} of ${state.data.totalPages}',
                      color: UIColors.textLight,
                    ),
                    const UIHorizontalSpace(16),
                    IconButton(
                      onPressed: () {
                        if (state.data.currentPage != 1) {
                          context.read<SupplierListCubit>().getSuppliers(
                                page: 1,
                                size: _rowsPerPage,
                                search: context.read<SupplierListFilterCubit>().state.search,
                              );
                        }
                      },
                      icon: Assets.icons.firstPage.svg(
                        colorFilter:
                            (state.data.currentPage == 1 ? UIColors.textMuted : UIColors.textRegular).toColorFilter,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (state.data.currentPage != 1) {
                          context.read<SupplierListCubit>().getSuppliers(
                                page: state.data.currentPage! - 1,
                                size: _rowsPerPage,
                                search: context.read<SupplierListFilterCubit>().state.search,
                              );
                        }
                      },
                      icon: Assets.icons.arrowLeft.svg(
                        colorFilter:
                            (state.data.currentPage == 1 ? UIColors.textMuted : UIColors.textRegular).toColorFilter,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (state.data.currentPage != state.data.totalPages) {
                          context.read<SupplierListCubit>().getSuppliers(
                                page: state.data.currentPage! + 1,
                                size: _rowsPerPage,
                                search: context.read<SupplierListFilterCubit>().state.search,
                              );
                        }
                      },
                      icon: Assets.icons.arrowRight.svg(
                        colorFilter: (state.data.currentPage == state.data.totalPages
                                ? UIColors.textMuted
                                : UIColors.textRegular)
                            .toColorFilter,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (state.data.currentPage != state.data.totalPages) {
                          context.read<SupplierListCubit>().getSuppliers(
                                page: state.data.totalPages!,
                                size: _rowsPerPage,
                                search: context.read<SupplierListFilterCubit>().state.search,
                              );
                        }
                      },
                      icon: Assets.icons.lastPage.svg(
                        colorFilter: (state.data.currentPage == state.data.totalPages
                                ? UIColors.textMuted
                                : UIColors.textRegular)
                            .toColorFilter,
                      ),
                    ),
                  ],
                ),
            ],
          );
        }
        return DataGridLoading(
          columns: DataGridUtil.getColumns(DataGridColumn.SUPPLIERS),
          source: _supplierDataSource = SupplierDataSource([]),
        );
      },
    );
  }
}

class SupplierDataSource extends DataGridSource {
  SupplierDataSource(List<Supplier> suppliers) {
    _suppliers = suppliers;
    buildDataGridRows();
  }

  List<Supplier> _suppliers = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRows() => dataGridRows = _suppliers.map((supplier) => supplier.toDataGridRow()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: UIText.bodyRegular(cell.value.toString()),
        );
      }).toList(),
    );
  }
}
