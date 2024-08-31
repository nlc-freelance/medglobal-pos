import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/scaffold_layout/pos/lazy_load_dropdown.dart';
import 'package:medglobal_admin_portal/portal/branches/data/branch_api.dart';
import 'package:medglobal_admin_portal/portal/branches/domain/branch.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/returns/presentation/cubit/return_transaction_list_filter_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/cubit/sale_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/portal/transactions/sales/presentation/cubit/sale_transaction_list_filter_cubit.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerPopup extends StatefulWidget {
  const DatePickerPopup({
    super.key,
    this.selectedDate,
    required this.onSelect,
  });

  final DateTime? selectedDate;
  final void Function(DateTime value) onSelect;

  @override
  State<DatePickerPopup> createState() => _DatePickerPopupState();
}

class _DatePickerPopupState extends State<DatePickerPopup> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.selectedDate != null) _selectedDate = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      tooltip: Strings.empty,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          enabled: false,
          child: SizedBox(
            width: 500,
            height: 350,
            child: SfDateRangePicker(
              initialDisplayDate: _selectedDate,
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.single,
              todayHighlightColor: UIColors.primary,
              headerHeight: 60,
              headerStyle: const DateRangePickerHeaderStyle(backgroundColor: UIColors.background),
              allowViewNavigation: false,
              backgroundColor: UIColors.background,
              selectionColor: UIColors.primary,
              showNavigationArrow: true,
              onSelectionChanged: (args) {
                setState(() => _selectedDate = args.value);
                widget.onSelect(args.value);
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
      child: HoverBuilder(
        builder: (isHover) => Container(
          // height: 38,
          padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: UIColors.background,
            border: Border.all(color: isHover ? UIColors.buttonPrimaryHover : UIColors.borderRegular),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.icons.calendar.setColorOnHover(isHover),
              const UIHorizontalSpace(10),
              UIText.labelMedium(
                _selectedDate != null ? DateFormat('MMMM dd, yyyy').format(_selectedDate!) : 'Date',
                color: isHover ? UIColors.primary : UIColors.textRegular,
              ),
              const Spacer(),
              Assets.icons.arrowDown.setColorOnHover(isHover)
            ],
          ),
        ),
      ),
    );
  }
}

/// TODO: For dropdown refactoring
class BranchFilter extends StatefulWidget {
  const BranchFilter(this.type, {super.key});

  final TransactionType type;

  @override
  State<BranchFilter> createState() => _BranchFilterState();
}

class _BranchFilterState extends State<BranchFilter> {
  late List<Branch> _branches = [];
  Branch? _branch;

  @override
  void initState() {
    super.initState();
    _getBranches();
  }

  /// TODO: Refactor to use custom dropdown implementation
  Future<void> _getBranches() async {
    try {
      final branches = await DataFetcher<Branch>((page) => GetIt.I<BranchApi>().getBranches()).fetchItems(1);
      if (branches.isNotEmpty) {
        setState(() => _branches = branches);
      }
    } catch (e) {
      // Handle the error here
      print('Error fetching items: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      tooltip: Strings.empty,
      onSelected: (branch) {
        final saleSize = context.read<SaleTransactionListFilterCubit>().state.size;
        final returnSize = context.read<ReturnTransactionListFilterCubit>().state.size;

        if (branch.id == -1) {
          setState(() => _branch = null);

          if (widget.type == TransactionType.SALE) {
            context.read<SaleTransactionListCubit>().getTransactions(size: saleSize!);
            context.read<SaleTransactionListFilterCubit>().setBranch(null);
          } else {
            context.read<ReturnTransactionListCubit>().getTransactions(size: returnSize!);
            context.read<ReturnTransactionListFilterCubit>().setBranch(null);
          }
        } else {
          setState(() => _branch = branch);

          if (widget.type == TransactionType.SALE) {
            context.read<SaleTransactionListCubit>().getTransactions(size: saleSize!, branchId: branch.id);
            context.read<SaleTransactionListFilterCubit>().setBranch(branch.id);
          } else {
            context.read<ReturnTransactionListCubit>().getTransactions(size: saleSize!, branchId: branch.id);
            context.read<ReturnTransactionListFilterCubit>().setBranch(null);
          }
        }
      },
      itemBuilder: (_) => [
        PopupMenuItem(
          value: const Branch(id: -1, name: ''),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: UIText.bodyRegular('All Branches'),
        ),
        ..._branches.map(
          (branch) => PopupMenuItem(
            value: branch,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: UIText.bodyRegular('${branch.name} Branch'),
          ),
        ),
      ],
      child: HoverBuilder(
        builder: (isHover) => Container(
          // height: 38,
          padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: UIColors.background,
            border: Border.all(color: isHover ? UIColors.buttonPrimaryHover : UIColors.borderRegular),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.icons.bagHappy.setColorOnHover(isHover),
              const UIHorizontalSpace(10),
              UIText.labelMedium(_branch?.name ?? 'All Branches'),
              const Spacer(),
              Assets.icons.arrowDown.setColorOnHover(isHover)
            ],
          ),
        ),
      ),
    );
  }
}
