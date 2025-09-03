import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/snackbar_util.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/app_dropdown.dart';
import 'package:medglobal_admin_portal/core/widgets/page/page.dart';
import 'package:medglobal_admin_portal/core/widgets/typeahead_search/variant_typeahead_search.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/shared/product_history_detail_bloc/product_history_detail_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/presentation/bloc/product_sales_history_bloc/product_sales_history_bloc.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/presentation/bloc/product_sales_history_filter_cubit/product_sales_history_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/reports/presentation/webview/product_sales_history/presentation/product_sales_history_data_grid.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProductSalesHistoryPage extends StatelessWidget {
  const ProductSalesHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductHistoryDetailBloc, ProductHistoryDetailState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () => PageLoader.show(context),
              loaded: (data, action) {
                switch (action) {
                  case ProductHistoryAction.SALE:
                    context.pushNamed(
                      'saleTransactionDetails',
                      pathParameters: {'id': (data as Transaction).id.toString()},
                    );
                    break;
                  case ProductHistoryAction.RETURN:
                    context.pushNamed(
                      'returnTransactionDetails',
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
        BlocListener<ProductSalesHistoryFilterCubit, ProductSalesHistoryFilterState>(
          listener: (context, state) {
            if (state.variantId == null || state.branch == null || state.startDate == null) {
              context.read<ProductSalesHistoryBloc>().add(const ProductSalesHistoryEvent.reset());
              context.read<ProductSalesHistoryFilterCubit>().resetPageAndSize();
            }
          },
        ),
        BlocListener<ProductSalesHistoryBloc, ProductSalesHistoryState>(
          listenWhen: (previous, current) {
            return previous.maybeWhen(
                  orElse: () => true,
                  loaded: (_) => false,
                ) &&
                context.read<ProductSalesHistoryFilterCubit>().state.isValid;
          },
          listener: (context, state) => state.maybeWhen(
            loading: () => PageLoader.show(context),
            orElse: () => PageLoader.close(),
          ),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            title: 'Product Sales History',
            subtitle: 'View product sales history, see transactions related to a product.',
          ),
          const UIVerticalSpace(20),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              SizedBox(
                width: 400,
                child: VariantTypeAheadSearch(onSelected: (variant) {
                  context.read<ProductSalesHistoryFilterCubit>().setVariant(variant.id);
                  // TODO: Fetch branches the product is assigned to
                }, onClear: () {
                  context.read<ProductSalesHistoryFilterCubit>().setVariant(null);
                  context.read<ProductSalesHistoryFilterCubit>().setBranch(null);
                }),
              ),
              BlocBuilder<ProductSalesHistoryFilterCubit, ProductSalesHistoryFilterState>(
                builder: (context, state) {
                  return AppDropdown<Branch>.lazy(
                    hasInlineLabel: true,
                    inlineLabel: 'Branch',
                    hint: 'Select branch',
                    getName: (branch) => branch.name,
                    onSelectItem: (branch) => context.read<ProductSalesHistoryFilterCubit>().setBranch(branch),
                    onRemoveSelectedItem: () => context.read<ProductSalesHistoryFilterCubit>().setBranch(null),
                    isEnabled: state.variantId != null,
                    value: state.branch,
                  );
                },
              ),
              DatePickerPopup(
                isInput: true,
                selectionMode: DateRangePickerSelectionMode.range,
                maxDate: DateTime.now(),
                onSelectRange: (dates) {
                  final startDate = dates[0];
                  final endDate = dates[1];
                  context.read<ProductSalesHistoryFilterCubit>().setStartDate(startDate?.toFormattedShortDate());
                  context.read<ProductSalesHistoryFilterCubit>().setEndDate(endDate?.toFormattedShortDate());
                },
                onRemoveSelected: () {
                  context.read<ProductSalesHistoryFilterCubit>().setStartDate(null);
                  context.read<ProductSalesHistoryFilterCubit>().setEndDate(null);
                },
              ),
              UIButton.filled(
                'Search',
                onClick: () {
                  final filterCubit = context.read<ProductSalesHistoryFilterCubit>();

                  filterCubit.validate();

                  if (filterCubit.state.isValid) {
                    context.read<ProductSalesHistoryBloc>().add(ProductSalesHistoryEvent.fetch(
                          filterCubit.state.variantId!,
                          filterCubit.state.toPageQuery,
                        ));
                  }
                },
              ),
            ],
          ),
          const UIVerticalSpace(16),
          BlocBuilder<ProductSalesHistoryBloc, ProductSalesHistoryState>(
            buildWhen: (prev, curr) {
              return prev.maybeWhen(
                loading: () => curr.maybeWhen(
                  loading: () => false,
                  orElse: () => true,
                ),
                loaded: (_) => curr.maybeWhen(orElse: () => false, initial: () => true),
                orElse: () => false,
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (data) => Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(color: UIColors.borderMuted),
                      const UIVerticalSpace(12),
                      Wrap(
                        runSpacing: 30,
                        spacing: 60,
                        children: [
                          LabelValue.text(
                            label: 'Display Name',
                            value: data.displayName,
                          ),
                          LabelValue.text(
                            label: 'SKU',
                            value: data.sku,
                          ),
                          LabelValue.text(
                            label: 'Category',
                            value: data.category,
                          ),
                        ],
                      ),
                      const UIVerticalSpace(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Transactions',
                            style: UIStyleText.labelSemiBold.copyWith(fontSize: 12.5),
                          ),
                          ExportButton(
                            ReportType.productSalesHistory,
                            payload: context.read<ProductSalesHistoryFilterCubit>().state.toReportFilter,
                          ),
                        ],
                      ),
                      const UIVerticalSpace(12),
                      const Expanded(child: ProductSalesHistoryDataGrid())
                    ],
                  ),
                ),
                failure: (message) => FailureView(message),
                orElse: () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<ProductSalesHistoryFilterCubit, ProductSalesHistoryFilterState>(
                      builder: (context, input) {
                        return input.isValid
                            ? const SizedBox.shrink()
                            : UIText.labelMedium(input.errorMessage!, color: UIColors.error);
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Center(
                        child: DataGridEmpty(
                          title: 'Set Up Your Sales History Search',
                          subtitle:
                              'Start by selecting a product to filter branches. Then pick a branch and date to see results.',
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
