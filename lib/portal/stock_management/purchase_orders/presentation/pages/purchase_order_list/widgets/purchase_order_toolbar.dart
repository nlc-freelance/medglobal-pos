import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/enums/enums.dart';
import 'package:medglobal_admin_portal/core/widgets/data_grid/data_grid.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/core/widgets/dropdowns/app_dropdown.dart';
import 'package:medglobal_admin_portal/portal/settings/branch/domain/entity/branch.dart';
import 'package:medglobal_admin_portal/portal/stock_management/purchase_orders/presentation/cubit/purchase_order_list_filter/purchase_order_list_filter_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class PurchaseOrderToolbar extends StatelessWidget {
  const PurchaseOrderToolbar({super.key, required this.onFetch});

  final VoidCallback onFetch;

  @override
  Widget build(BuildContext context) {
    final filterCubit = context.read<PurchaseOrderListFilterCubit>();

    return DataGridToolbar(
      reportType: ReportType.purchaseOrder,
      reportFilters: {
        'status': filterCubit.state.status?.label.toLowerCase(),
        'branch': filterCubit.state.branchId,
        'startDate': filterCubit.state.startDate,
        'endDate': filterCubit.state.endDate,
      },
      filters: [
        DatePickerPopup(
          onRemoveSelected: () {
            filterCubit.setStartDate(null);
            filterCubit.setEndDate(null);
            onFetch();
          },
          onSelectRange: (dates) {
            String? endDate;
            final startDate = DateFormat('MM-dd-yyyy').format(dates[0]!);
            if (dates.length == 2) endDate = DateFormat('MM-dd-yyyy').format(dates[1]!);

            filterCubit.setStartDate(startDate);
            filterCubit.setEndDate(endDate);
            onFetch();
          },
          selectionMode: DateRangePickerSelectionMode.range,
        ),
        const UIHorizontalSpace(8),
        AppDropdown<Branch>.lazy(
          hasInlineLabel: true,
          inlineLabel: 'Branch',
          hint: 'All Branches',
          getName: (branch) => branch.name,
          onSelectItem: (branch) {
            filterCubit.setBranch(branch.id);
            onFetch();
          },
          onRemoveSelectedItem: () {
            filterCubit.setBranch(null);
            onFetch();
          },
        ),
      ],
    );
  }
}
