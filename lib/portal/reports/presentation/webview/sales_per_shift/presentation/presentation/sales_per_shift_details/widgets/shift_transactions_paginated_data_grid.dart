import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid_loading.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/shift_transactions/shift_transaction_page_size_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/sales_per_shift/presentation/cubit/shift_transactions/shift_transactions_cubit.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ShiftTransactionPaginatedDataGrid extends StatefulWidget {
  const ShiftTransactionPaginatedDataGrid(this.shiftId, {super.key});

  final int shiftId;

  @override
  State<ShiftTransactionPaginatedDataGrid> createState() => _ShiftTransactionPaginatedDataGridState();
}

class _ShiftTransactionPaginatedDataGridState extends State<ShiftTransactionPaginatedDataGrid> {
  late ShiftTransactionsDataSource _shiftTransactions;

  List<Transaction> transactions = [];
  int _rowsPerPage = 20;

  @override
  void initState() {
    super.initState();
    context.read<ShiftTransactionsCubit>().getTransactions(shiftId: widget.shiftId);
  }

  @override
  Widget build(BuildContext context) {
    final shiftId = widget.shiftId;

    return BlocConsumer<ShiftTransactionsCubit, ShiftTransactionsState>(
      listener: (context, state) {
        if (state is ShiftTransactionsLoaded) {
          transactions = state.data.items ?? [];
          _shiftTransactions = ShiftTransactionsDataSource(transactions, context);
        }
      },
      builder: (context, state) {
        if (state is ShiftTransactionsError) {
          return Text(state.message);
        }
        if (state is ShiftTransactionsLoaded) {
          return Column(
            children: [
              Container(
                decoration: UIStyleContainer.topBorder,
                child: ClipRect(
                  clipper: HorizontalBorderClipper(),
                  child: SfDataGridTheme(
                    data: DataGridUtil.rowNavigationStyle,
                    child: SfDataGrid(
                      source: _shiftTransactions,
                      columns: DataGridUtil.getColumns(DataGridColumn.SHIFT_TRANSACTIONS),
                      shrinkWrapRows: true,
                      navigationMode: GridNavigationMode.row,
                      columnWidthMode: ColumnWidthMode.fill,
                      headerGridLinesVisibility: GridLinesVisibility.none,
                      gridLinesVisibility: GridLinesVisibility.horizontal,
                      headerRowHeight: 38,
                      footerHeight: 100,
                      footer: _shiftTransactions.rows.isEmpty
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
                    ),
                  ),
                ),
              ),
              const UIVerticalSpace(16),
              if (state.data.items?.isNotEmpty == true)

                /// TODO: Extract pager to its own widget
                Row(
                  children: [
                    BlocListener<ShiftTransactionPageSizeCubit, int>(
                      listenWhen: (previous, current) => previous != current,
                      listener: (context, size) {
                        setState(() => _rowsPerPage = size);
                      },
                      child: UIPopupMenuButton.textIcon(
                        title: '$_rowsPerPage rows',
                        iconBuilder: (isHover) => Assets.icons.arrowDown.setColorOnHover(isHover),
                        onSelect: (value) {
                          setState(() => _rowsPerPage = value);
                          context.read<ShiftTransactionPageSizeCubit>().setSize(value);

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
                            context.read<ShiftTransactionsCubit>().getTransactions(
                                  page: 1,
                                  size: _rowsPerPage,
                                  shiftId: shiftId,
                                );
                          } else {
                            context.read<ShiftTransactionsCubit>().getTransactions(
                                  page: state.data.currentPage!,
                                  size: _rowsPerPage,
                                  shiftId: shiftId,
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
                          context.read<ShiftTransactionsCubit>().getTransactions(
                                page: 1,
                                size: _rowsPerPage,
                                shiftId: shiftId,
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
                          context.read<ShiftTransactionsCubit>().getTransactions(
                                page: state.data.currentPage! - 1,
                                size: _rowsPerPage,
                                shiftId: shiftId,
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
                          context.read<ShiftTransactionsCubit>().getTransactions(
                                page: state.data.currentPage! + 1,
                                size: _rowsPerPage,
                                shiftId: shiftId,
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
                          context.read<ShiftTransactionsCubit>().getTransactions(
                                page: state.data.totalPages!,
                                size: _rowsPerPage,
                                shiftId: shiftId,
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
          columns: DataGridUtil.getColumns(DataGridColumn.SHIFT_TRANSACTIONS),
          source: _shiftTransactions = ShiftTransactionsDataSource([], context),
        );
      },
    );
  }
}

class ShiftTransactionsDataSource extends DataGridSource {
  ShiftTransactionsDataSource(List<Transaction> transactions, BuildContext context) {
    _transactions = transactions;
    _context = context;
    buildDataGridRows();
  }

  late BuildContext _context;
  List<Transaction> _transactions = [];

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRows() =>
      dataGridRows = _transactions.map((transaction) => transaction.toShiftTransactionRow()).toList();

  void updateDataGridSource() => notifyListeners();

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildCell(cell.columnName, cell, row.getCells().first.value, row.getCells()[4].value),
        );
      }).toList(),
    );
  }

  Widget _buildCell(String column, DataGridCell cell, int id, String type) {
    return switch (column) {
      'receipt_id' => HoverBuilder(
          builder: (isHover) => InkWell(
            onTap: () {
              _context.read<TransactionBloc>().add(TransactionEvent.getTransactionById(id));

              AppRouter.router.goNamed(
                type.toLowerCase() == 'sale' ? 'Sale Details' : 'Return Details',
                pathParameters: {'id': id.toString()},
              );
            },
            hoverColor: UIColors.transparent,
            child: UIText.dataGridText(
              cell.value.toString(),
              color: isHover ? UIColors.buttonPrimaryHover : UIColors.textRegular,
              textDecoration: TextDecoration.underline,
            ),
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
