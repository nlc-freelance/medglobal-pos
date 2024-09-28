import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
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
    return Theme(
      data: ThemeData(
        hoverColor: UIColors.transparent,
        highlightColor: UIColors.transparent,
        splashColor: UIColors.transparent,
      ),
      child: PopupMenuButton(
        color: UIColors.background,
        position: PopupMenuPosition.under,
        tooltip: Strings.empty,
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            enabled: false,
            child: SizedBox(
              width: 1000,
              height: 350,
              child: SfDateRangePicker(
                view: DateRangePickerView.month,
                selectionMode: DateRangePickerSelectionMode.single,
                enableMultiView: true,
                navigationDirection: DateRangePickerNavigationDirection.horizontal,
                viewSpacing: 20,
                headerHeight: 60,
                allowViewNavigation: false,
                showActionButtons: true,
                headerStyle: const DateRangePickerHeaderStyle(backgroundColor: UIColors.background),
                backgroundColor: UIColors.background,
                selectionColor: UIColors.primary,
                showNavigationArrow: true,
                onSelectionChanged: (args) {
                  // setState(() => _selectedDate = args.value);
                  // widget.onSelect(args.value);
                  // Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
        child: HoverBuilder(
          builder: (isHover) => Container(
            padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isHover ? UIColors.whiteBg : UIColors.background,
              border: Border.all(color: UIColors.borderRegular),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Date   ',
                    style: UIStyleText.labelMedium.copyWith(color: UIColors.textMuted),
                    children: [
                      TextSpan(
                        text: _selectedDate != null ? DateFormat('MMMM dd, yyyy').format(_selectedDate!) : 'All Time',
                        style: (UIStyleText.labelMedium),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Assets.icons.arrowDown.svg(),
              ],
            ),
          ),
        ),
      ),
    );
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
