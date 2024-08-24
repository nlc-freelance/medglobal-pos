import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReturnTransactionPaginatedDataGrid extends StatefulWidget {
  const ReturnTransactionPaginatedDataGrid({super.key});

  @override
  State<ReturnTransactionPaginatedDataGrid> createState() => _ReturnTransactionPaginatedDataGridState();
}

class _ReturnTransactionPaginatedDataGridState extends State<ReturnTransactionPaginatedDataGrid> {
  late DataGridController _dataGridController;
  late ReturnTransactionDataSource _returnTransactionDataSource;

  List<Transaction> returns = [];
  int _rowsPerPage = 20;

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
    context.read<ReturnTransactionListCubit>().getTransactions();
  }

  @override
  void dispose() {
    _dataGridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReturnTransactionListCubit, ReturnTransactionListState>(
      listenWhen: (previous, current) {
        if (previous is ReturnTransactionListLoading && current is ReturnTransactionListLoaded) {
          return ((current.data.currentPage! <= current.data.totalPages!) == true);
        }
        // if (current is ReturnListNoResultFound) return true;
        return false;
      },
      listener: (context, state) {
        if (state is ReturnTransactionListLoaded) {
          returns = state.data.transactions ?? [];
          _returnTransactionDataSource = ReturnTransactionDataSource(returns, _rowsPerPage);
        }
        // if (state is TransactionListNoResultFound) {
        //   _returnTransactionDataSource = ReturnTransactionDataSource([], _rowsPerPage);
        // }
      },
      builder: (context, state) {
        if (state is ReturnTransactionListError) {
          return Text(state.message);
        }
        // if (state is ReturnListNoResultFound) {
        //   return DataGridNoData.search(
        //     message: state.message,
        //     columns: DataGridUtil.getColumns(DataGridColumn.RETURN_TRANSACTIONS),
        //     source: _returnTransactionDataSource,
        //   );
        // }
        if (state is ReturnTransactionListLoaded) {
          return Column(
            children: [
              Expanded(
                child: Container(
                  decoration: UIStyleContainer.horizontalBorder,
                  child: ClipRect(
                    clipper: HorizontalBorderClipper(),
                    child: SfDataGridTheme(
                      data: DataGridUtil.rowNavigationStyle,
                      child: SfDataGrid(
                        source: _returnTransactionDataSource,
                        columns: DataGridUtil.getColumns(DataGridColumn.RETURN_TRANSACTIONS),
                        controller: _dataGridController,
                        shrinkWrapRows: true,
                        navigationMode: GridNavigationMode.row,
                        columnWidthMode: ColumnWidthMode.fill,
                        headerGridLinesVisibility: GridLinesVisibility.none,
                        gridLinesVisibility: GridLinesVisibility.none,
                        headerRowHeight: 46,
                        footerHeight: 100,
                        footer: _returnTransactionDataSource.rows.isEmpty
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
                        onCellTap: (details) {},
                      ),
                    ),
                  ),
                ),
              ),
              const UIVerticalSpace(16),
              if (state.data.transactions?.isNotEmpty == true)

                /// TODO: Extract pager to its own widget
                Row(
                  children: [
                    UIPopupMenuButton.textIcon(
                      title: '$_rowsPerPage rows',
                      iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
                      onSelect: (value) {
                        setState(() => _rowsPerPage = value);
                        // context.read<ProductListSearchCubit>().setSize(value);
                        if (state.data.totalCount! <= value) {
                          context.read<ReturnTransactionListCubit>().getTransactions(
                                page: 1,
                                size: _rowsPerPage,
                                // search: context.read<TransactionSearchCubit>().state.search,
                              );
                        } else {
                          context.read<ReturnTransactionListCubit>().getTransactions(
                                page: state.data.currentPage!,
                                size: _rowsPerPage,
                                // search: context.read<TransactionSearchCubit>().state.search,
                              );
                        }
                      },
                      menu: const [20, 50, 100],
                      menuAsString: (menu) => menu.toString(),
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
                          context.read<ReturnTransactionListCubit>().getTransactions(
                                page: 1,
                                size: _rowsPerPage,
                                // search: context.read<TransactionSearchCubit>().state.search,
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
                          context.read<ReturnTransactionListCubit>().getTransactions(
                                page: state.data.currentPage! - 1,
                                size: _rowsPerPage,
                                // search: context.read<TransactionSearchCubit>().state.search,
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
                          context.read<ReturnTransactionListCubit>().getTransactions(
                                page: state.data.currentPage! + 1,
                                size: _rowsPerPage,
                                // search: context.read<TransactionSearchCubit>().state.search,
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
                          context.read<ReturnTransactionListCubit>().getTransactions(
                                page: state.data.totalPages!,
                                size: _rowsPerPage,
                                // search: context.read<TransactionSearchCubit>().state.search,
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
          columns: DataGridUtil.getColumns(DataGridColumn.RETURN_TRANSACTIONS),
          source: _returnTransactionDataSource = ReturnTransactionDataSource([], _rowsPerPage),
        );
      },
    );
  }
}

class ReturnTransactionDataSource extends DataGridSource {
  ReturnTransactionDataSource(List<Transaction> returns, int rowsPerPage) {
    _rowsPerPage = rowsPerPage;
    _returns = returns;
    _paginatedReturns = _returns.getRange(0, returns.length).toList(growable: false);
    buildDataGridRows(_returns);
  }

  late int _rowsPerPage;

  List<Transaction> _returns = [];

  List<Transaction> _paginatedReturns = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * _rowsPerPage;
    int endIndex = startIndex + _rowsPerPage;

    if (startIndex < _returns.length && endIndex <= _returns.length) {
      _paginatedReturns = _returns.getRange(startIndex, endIndex).toList(growable: false);
      buildDataGridRows(_paginatedReturns);
      notifyListeners();
    } else {
      _paginatedReturns = [];
    }

    return true;
  }

  void buildDataGridRows(List<Transaction> returns) =>
      dataGridRows = returns.map((transaction) => transaction.toReturnTransactionRow()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    Color getRowBackgroundColor() {
      final int index = effectiveRows.indexOf(row);
      if (index % 2 != 0) {
        return UIColors.transparent;
      }

      return UIColors.whiteBg.withOpacity(0.5);
    }

    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          color: getRowBackgroundColor(),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildCell(cell.columnName, cell, row.getCells().first.value),
        );
      }).toList(),
    );
  }

  Widget _buildCell(String column, DataGridCell cell, int id) {
    return switch (column) {
      'receipt_id' => HoverBuilder(
          builder: (isHover) => InkWell(
            onTap: () => AppRouter.router.goNamed('Return Details', pathParameters: {'id': id.toString()}),
            hoverColor: UIColors.transparent,
            child: UIText.dataGridText(
              cell.value.toString(),
              color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
              textDecoration: TextDecoration.underline,
            ),
          ),
        ),
      'status' => Chip(
          label: UIText.labelRegular(
            (cell.value as ReturnStatus).label,
            color: (cell.value as ReturnStatus) == ReturnStatus.AWAITING_ACTION
                ? UIColors.awaitingAction
                : UIColors.completed,
          ),
          backgroundColor: (cell.value as ReturnStatus) == ReturnStatus.AWAITING_ACTION
              ? UIColors.awaitingActionBg
              : UIColors.completedBg,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: UIColors.transparent),
          ),
        ),
      _ => UIText.dataGridText(
          cell.runtimeType.toString().contains('double')
              ? (cell.value as double).toPesoString()
              : cell.value.toString(),
        ),
    };
  }
}
