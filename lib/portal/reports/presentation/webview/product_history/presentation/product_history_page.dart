import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/branch_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/core/widgets/typeahead_search/variant_typeahead_search.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/cubit/product_history_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/cubit/product_history_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_history/presentation/product_history_paginated_data_grid.dart';
import 'package:medglobal_admin_portal/portal/reports/shared/product_history_detail_bloc/product_history_detail_bloc.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/domain/entities/purchase_order.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_return/domain/entities/stock_return.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_take/domain/entities/stock_take.dart';
import 'package:medglobal_admin_portal/portal/stock_management/stock_transfer/domain/entities/stock_transfer.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProductHistoryPage extends StatefulWidget {
  const ProductHistoryPage({super.key});

  @override
  State<ProductHistoryPage> createState() => _ProductHistoryPageState();
}

class _ProductHistoryPageState extends State<ProductHistoryPage> {
  int? _productVariantId;
  int? _branchId;
  DateTime? _sinceDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductHistoryListFilterCubit, ProductHistoryListFilterState>(
          listener: (context, state) {
            if (state.variantId == null || state.branchId == null || state.startDate == null) {
              context.read<ProductHistoryListCubit>().reset();
            }
          },
        ),
        BlocListener<ProductHistoryDetailBloc, ProductHistoryDetailState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () => PageLoader.show(context),
              loaded: (data, action) {
                switch (action) {
                  case ProductHistoryAction.PURCHASE:
                    context.pushNamed(
                      'purchaseOrderDetails',
                      pathParameters: {'id': (data as PurchaseOrder).id.toString()},
                    );
                    break;
                  case ProductHistoryAction.RETURN:
                    context.pushNamed(
                      'stockReturnDetails',
                      pathParameters: {'id': (data as StockReturn).id.toString()},
                    );
                    break;
                  case ProductHistoryAction.TAKE:
                    context.pushNamed(
                      'stockTakeDetails',
                      pathParameters: {'id': (data as StockTake).id.toString()},
                    );
                    break;
                  case ProductHistoryAction.TRANSFER:
                    context.pushNamed(
                      'stockTransferDetails',
                      pathParameters: {'id': (data as StockTransfer).id.toString()},
                    );
                    break;
                  case ProductHistoryAction.SALE:
                    context.pushNamed(
                      'saleTransactionDetails',
                      pathParameters: {'id': (data as Transaction).id.toString()},
                    );
                    break;
                  default:
                    return;
                }
                PageLoader.close();
              },
              failure: (message) {
                PageLoader.close();
                SnackbarUtil.error(context, message);
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            title: 'Product History',
            subtitle: 'View product history to track and analyze changes and events in the product\'s lifecycle.',
          ),
          const UIVerticalSpace(20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              UIText.labelMedium('Product'),
              UIText.labelMedium('Product'),
              const UIHorizontalSpace(8),
              SizedBox(
                width: 400,
                child: VariantTypeAheadSearch(
                  onSelected: (value) {
                    setState(() => _productVariantId = value.id);
                    context.read<ProductHistoryListFilterCubit>().setVariantId(value.id!);
                  },
                  onClear: () {
                    setState(() => _productVariantId = null);
                    context.read<ProductHistoryListFilterCubit>().setVariantId(null);
                  },
                ),
              ),
              const UIHorizontalSpace(16),
              UIText.labelMedium('Branch'),
              UIText.labelMedium('Branch'),
              const UIHorizontalSpace(8),
              BranchDropdown.select(
                isSelectInputType: true,
                onSelectItem: (branch) {
                  setState(() => _branchId = branch.id);
                  context.read<ProductHistoryListFilterCubit>().setBranchId(branch.id!);
                },
                onRemoveSelectedItem: () {
                  setState(() => _branchId = null);
                  context.read<ProductHistoryListFilterCubit>().setBranchId(null);
                },
              ),
              const UIHorizontalSpace(16),
              UIText.labelMedium('Since'),
              const UIHorizontalSpace(8),
              DatePickerPopup(
                isInput: true,
                selectionMode: DateRangePickerSelectionMode.single,
                onSelect: (date) {
                  setState(() => _sinceDate = date);
                  context.read<ProductHistoryListFilterCubit>().setStartDate(DateFormat('MM-dd-yyyy').format(date));
                },
                onRemoveSelected: () {
                  setState(() => _sinceDate = null);
                  context.read<ProductHistoryListFilterCubit>().setStartDate(null);
                },
              ),
              const UIHorizontalSpace(16),
              if ([_productVariantId, _branchId, _sinceDate].every((param) => param != null) == true)
                UIButton.filled(
                  'Search',
                  onClick: () => context.read<ProductHistoryListCubit>().getProductHistory(
                        variantId: _productVariantId!,
                        branchId: _branchId!,
                        startDate: DateFormat('MM-dd-yyyy').format(_sinceDate!),
                        size: context.read<ProductHistoryListFilterCubit>().state.size!,
                      ),
                ),
              if ([_productVariantId, _branchId, _sinceDate].every((param) => param != null) == true) ...[
                const Spacer(),
                ExportButton(
                  ReportType.productHistory,
                  filters: {
                    'variantId': _productVariantId,
                    'startDate': DateFormat('MM-dd-yyyy').format(_sinceDate!),
                    'branchId': _branchId,
                  },
                ),
              ],
            ],
          ),
          const UIVerticalSpace(20),
          const Expanded(child: ProductHistoryPaginatedDataGrid()),
        ],
      ),
    );
  }
}
