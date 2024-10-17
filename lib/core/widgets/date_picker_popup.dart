import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_shared/medglobal_shared.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerPopup extends StatefulWidget {
  const DatePickerPopup({
    super.key,
    this.selectedDate,
    this.isInput = false,
    required this.selectionMode,
    this.onSelect,
    this.onSelectRange,
    this.onRemoveSelected,
  });

  final bool isInput;
  final DateTime? selectedDate;
  final void Function(DateTime)? onSelect;
  final void Function(List<DateTime?>)? onSelectRange;
  final DateRangePickerSelectionMode selectionMode;
  final VoidCallback? onRemoveSelected;

  @override
  State<DatePickerPopup> createState() => _DatePickerPopupState();
}

class _DatePickerPopupState extends State<DatePickerPopup> {
  DateTime? _selectedDate;
  List<DateTime?> _selectedDateRange = [];

  @override
  void initState() {
    super.initState();
    if (widget.selectedDate != null) _selectedDate = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Dialog(
          backgroundColor: UIColors.background,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 320,
            width: 600,
            child: SfDateRangePicker(
              selectionShape: DateRangePickerSelectionShape.rectangle,
              headerStyle: const DateRangePickerHeaderStyle(
                backgroundColor: UIColors.background,
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 18,
                  color: UIColors.textRegular,
                ),
              ),
              view: DateRangePickerView.month,
              selectionMode: widget.selectionMode,
              enableMultiView: true,
              navigationDirection: DateRangePickerNavigationDirection.horizontal,
              viewSpacing: 20,
              headerHeight: 60,
              allowViewNavigation: false,
              showActionButtons: true,
              backgroundColor: UIColors.background,
              selectionColor: UIColors.primary,
              showNavigationArrow: true,
              rangeSelectionColor: UIColors.secondary,
              endRangeSelectionColor: UIColors.primary,
              startRangeSelectionColor: UIColors.primary,
              todayHighlightColor: UIColors.primary,
              onSubmit: (value) {
                if (value is PickerDateRange) {
                  DateTime? rangeStartDate = value.startDate;
                  DateTime? rangeEndDate = value.endDate;
                  setState(() =>
                      _selectedDateRange = [rangeStartDate, rangeEndDate]..where((date) => date != null).toList());

                  if (widget.onSelectRange != null) widget.onSelectRange!(_selectedDateRange);
                } else if (value is DateTime) {
                  DateTime selectedDate = value;
                  setState(() => _selectedDate = selectedDate);
                  if (widget.onSelect != null) widget.onSelect!(selectedDate);
                }

                Navigator.pop(context);
              },
              onCancel: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      child: HoverBuilder(
        builder: (isHover) => Container(
          constraints: const BoxConstraints(minWidth: 150),
          padding: const EdgeInsets.symmetric(vertical: 7.2, horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isHover ? UIColors.whiteBg : UIColors.background,
            border: Border.all(color: UIColors.borderRegular),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              _selectedDate != null || _selectedDateRange.isNotEmpty
                  ? Text(
                      widget.selectionMode == DateRangePickerSelectionMode.range
                          ? _selectedDateRange
                              .map((value) => value != null ? DateFormat('MMMM dd, yyyy').format(value) : '')
                              .join(' - ')
                          : DateFormat('MMMM dd, yyyy').format(_selectedDate!),
                      style: UIStyleText.labelMedium,
                    )
                  : Text(
                      widget.isInput ? 'Select date' : 'All Time',
                      style: UIStyleText.hint.copyWith(
                        color: widget.isInput ? UIColors.textMuted : UIColors.textRegular,
                        fontWeight: widget.isInput ? FontWeight.w400 : FontWeight.w500,
                      ),
                    ),
              const UIHorizontalSpace(10),
              _selectedDate != null || _selectedDateRange.isNotEmpty
                  ? SizedBox(
                      height: 18,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          setState(() => _selectedDate = null);
                          if (widget.onRemoveSelected != null) widget.onRemoveSelected!();
                        },
                        child: Assets.icons.close.svg(height: 22),
                      ),
                    )
                  : Assets.icons.arrowDown.svg(height: 10),
            ],
          ),
        ),
      ),
      // child: Text(_sinceDate != null ? DateFormat('EEEE, d MMMM yyyy').format(_sinceDate!) : 'Select date'),
    );
    // return Theme(
    //   data: ThemeData(
    //     hoverColor: UIColors.transparent,
    //     highlightColor: UIColors.transparent,
    //     splashColor: UIColors.transparent,
    //   ),
    //   child: PopupMenuButton(
    //     color: UIColors.background,
    //     position: PopupMenuPosition.under,
    //     tooltip: Strings.empty,
    //     itemBuilder: (BuildContext context) => [
    //       PopupMenuItem(
    //         enabled: false,
    //         child: SizedBox(
    //           width: 1000,
    //           height: 350,
    //           child: SfDateRangePicker(
    //             view: DateRangePickerView.month,
    //             selectionMode: DateRangePickerSelectionMode.single,
    //             enableMultiView: false,
    //             navigationDirection: DateRangePickerNavigationDirection.horizontal,
    //             viewSpacing: 20,
    //             headerHeight: 60,
    //             allowViewNavigation: false,
    //             showActionButtons: true,
    //             headerStyle: const DateRangePickerHeaderStyle(backgroundColor: UIColors.background),
    //             backgroundColor: UIColors.background,
    //             selectionColor: UIColors.primary,
    //             showNavigationArrow: true,
    //             onSelectionChanged: (args) {
    //               if (widget.isInput) {
    //                 // TODO: Input dates vs. Select dates (as filter)
    //                 setState(() => _selectedDate = args.value);
    //                 widget.onSelect(args.value);
    //               }
    //               Navigator.pop(context);
    //             },
    //           ),
    //         ),
    //       ),
    //     ],
    //     child: HoverBuilder(
    //       builder: (isHover) => Container(
    //         padding: const EdgeInsets.symmetric(vertical: 7.2, horizontal: 10.0),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: isHover ? UIColors.whiteBg : UIColors.background,
    //           border: Border.all(color: UIColors.borderRegular),
    //         ),
    //         child: Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             UIText.labelMedium(
    //               _selectedDate != null
    //                   ? DateFormat('MMMM dd, yyyy').format(_selectedDate!)
    //                   : widget.isInput
    //                       ? 'Select date'
    //                       : 'All Time',
    //               color: UIColors.textLight,
    //             ),
    //             const Spacer(),
    //             Assets.icons.arrowDown.svg(height: 10),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

// class FilterPopup extends StatefulWidget {
//   const FilterPopup({super.key});
//
//   @override
//   State<FilterPopup> createState() => _FilterPopupState();
// }
//
// class _FilterPopupState extends State<FilterPopup> {
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData(
//         hoverColor: UIColors.transparent,
//         highlightColor: UIColors.transparent,
//         splashColor: UIColors.transparent,
//       ),
//       child: PopupMenuButton(
//         color: UIColors.background,
//         position: PopupMenuPosition.under,
//         tooltip: Strings.empty,
//         itemBuilder: (BuildContext context) => [
//           PopupMenuItem(
//             enabled: false,
//             child: Container(
//               color: UIColors.background,
//               padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Theme(
//                     data: UITheme.theme,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         UIText.label('Add Filters'),
//                         UIButton.text(
//                           'Clear All',
//                           onClick: () {
//                             context.read<StockTransferListFilterCubit>().setSourceBranch(null);
//                             context.read<StockTransferListFilterCubit>().setDestinationBranch(null);
//
//                             final size = context.read<StockTransferListFilterCubit>().state.size;
//                             final status = context.read<StockTransferListFilterCubit>().state.status;
//                             context.read<StockTransferListRemoteCubit>().getStockTransfers(
//                                   size: size!,
//                                   status: status,
//                                   sourceBranchId: null,
//                                   destinationBranchId: null,
//                                 );
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   const UIVerticalSpace(20),
//                   UIText.labelRegular('Source Branch'),
//                   const UIVerticalSpace(4),
//                   BranchDropdown.select(
//                     selectedItem: context.read<StockTransferListFilterCubit>().state.sourceBranch,
//                     onSelectItem: (branch) {
//                       final size = context.read<StockTransferListFilterCubit>().state.size;
//                       final status = context.read<StockTransferListFilterCubit>().state.status;
//                       final sourceBranchId = context.read<StockTransferListFilterCubit>().state.sourceBranch?.id;
//                       final destinationBranchId =
//                           context.read<StockTransferListFilterCubit>().state.destinationBranch?.id;
//
//                       if (branch.id == -1) {
//                         context.read<StockTransferListRemoteCubit>().getStockTransfers(
//                               size: size!,
//                               status: status,
//                               sourceBranchId: null,
//                               destinationBranchId: null,
//                             );
//                         context.read<StockTransferListFilterCubit>().setSourceBranch(null);
//                       } else {
//                         context.read<StockTransferListRemoteCubit>().getStockTransfers(
//                               size: size!,
//                               status: status,
//                               sourceBranchId: sourceBranchId,
//                               destinationBranchId: destinationBranchId,
//                             );
//                       }
//                     },
//                   ),
//                   const UIVerticalSpace(20),
//                   UIText.labelRegular('Destination Branch'),
//                   const UIVerticalSpace(4),
//                   BranchDropdown.select(
//                     selectedItem: context.read<StockTransferListFilterCubit>().state.destinationBranch,
//                     onSelectItem: (branch) {
//                       final size = context.read<StockTransferListFilterCubit>().state.size;
//                       final status = context.read<StockTransferListFilterCubit>().state.status;
//                       final sourceBranchId = context.read<StockTransferListFilterCubit>().state.sourceBranch?.id;
//                       final destinationBranchId =
//                           context.read<StockTransferListFilterCubit>().state.destinationBranch?.id;
//
//                       if (branch.id == -1) {
//                         context.read<StockTransferListRemoteCubit>().getStockTransfers(
//                               size: size!,
//                               status: status,
//                               sourceBranchId: null,
//                               destinationBranchId: null,
//                             );
//                         context.read<StockTransferListFilterCubit>().setDestinationBranch(null);
//                       } else {
//                         context.read<StockTransferListRemoteCubit>().getStockTransfers(
//                               size: size!,
//                               status: status,
//                               sourceBranchId: sourceBranchId,
//                               destinationBranchId: destinationBranchId,
//                             );
//                       }
//                     },
//                   ),
//                   const UIVerticalSpace(24),
//                   // Theme(
//                   //   data: UITheme.theme,
//                   //   child: Row(
//                   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //     children: [
//                   //       UIButton.text(
//                   //         'Reset',
//                   //         onClick: () {
//                   //           context.read<StockTransferListFilterCubit>().setSourceBranch(null);
//                   //           context.read<StockTransferListFilterCubit>().setDestinationBranch(null);
//                   //
//                   //           final size = context.read<StockTransferListFilterCubit>().state.size;
//                   //           final status = context.read<StockTransferListFilterCubit>().state.status;
//                   //           context.read<StockTransferListRemoteCubit>().getStockTransfers(
//                   //                 size: size!,
//                   //                 status: status,
//                   //                 sourceBranchId: null,
//                   //                 destinationBranchId: null,
//                   //               );
//                   //           Navigator.pop(context);
//                   //         },
//                   //       ),
//                   //       UIButton.text(
//                   //         'Apply',
//                   //         onClick: () {
//                   //           final size = context.read<StockTransferListFilterCubit>().state.size;
//                   //           final status = context.read<StockTransferListFilterCubit>().state.status;
//                   //           final sourceBranchId = context.read<StockTransferListFilterCubit>().state.sourceBranch?.id;
//                   //           final destinationBranchId =
//                   //               context.read<StockTransferListFilterCubit>().state.destinationBranch?.id;
//                   //
//                   //           // if (branch.id == -1) {
//                   //           /// No filter, get all stock transfers
//                   //           context.read<StockTransferListRemoteCubit>().getStockTransfers(
//                   //                 size: size!,
//                   //                 status: status,
//                   //                 sourceBranchId: sourceBranchId,
//                   //                 destinationBranchId: destinationBranchId,
//                   //               );
//                   //           Navigator.pop(context);
//                   //         },
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//         child: BlocBuilder<StockTransferListFilterCubit, StockTransferListFilterState>(
//           builder: (context, state) => HoverBuilder(
//             builder: (isHover) {
//               final highlight = state.filterCount != 0;
//               return Container(
//                 padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 8.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: highlight
//                       ? UIColors.secondary
//                       : isHover
//                           ? UIColors.whiteBg
//                           : UIColors.background,
//                   border: Border.all(color: highlight ? UIColors.primary.withOpacity(0.2) : UIColors.borderRegular),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Assets.icons.filter1.setColorOnHover(highlight),
//                     const UIHorizontalSpace(10),
//                     UIText.labelMedium(
//                       'Filter',
//                       color: highlight ? UIColors.primary : UIColors.textRegular,
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
