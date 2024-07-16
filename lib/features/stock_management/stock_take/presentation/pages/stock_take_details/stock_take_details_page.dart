import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/pages/stock_take_details/widgets/completed_stock_take_data_grid.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/pages/stock_take_details/widgets/counted_items_data_grid.dart';
import 'package:medglobal_admin_portal/features/stock_management/stock_take/presentation/pages/stock_take_details/widgets/uncounted_items_data_grid.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class StockTakeDetailsPage extends StatelessWidget {
  const StockTakeDetailsPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeader(
          // if completed -> 'Stock Take Details'
          title: 'Edit Stock Take',
          subtitle: Strings.subtitlePlaceholder,
          titleTrailings: [
            // if (status == 'completed')
            // Chip(
            //   label: Text(
            //     'Completed',
            //     style: UIStyleText.chip.copyWith(color: UIColors.completed),
            //   ),
            //   backgroundColor: UIColors.completedBg,
            //   padding: const EdgeInsets.symmetric(horizontal: 8),
            //   visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4),
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //     side: const BorderSide(color: UIColors.transparent),
            //   ),
            // ),
            // const UIHorizontalSpace(12),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const PageSectionTitle(title: 'General Information'),
                GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 60,
                  ),
                  shrinkWrap: true,
                  children: [
                    LabelValue.text(
                      label: 'Start Time',
                      value: DateFormat('MM/dd/yyyy HH:mm').format(DateTime.now()),
                    ),
                    LabelValue.text(
                      label: 'Completed Time',
                      value: DateFormat('MM/dd/yyyy HH:mm').format(DateTime.now()),
                    ),
                    LabelValue.text(
                      label: 'Target Branch',
                      value: 'Manila Branch',
                    ),
                    LabelValue.text(
                      label: 'Target Supplier',
                      value: 'All Suppliers',
                    ),
                    LabelValue.status(
                      label: 'Status',
                      status: StockActionStatus.IN_PROGRESS,
                    ),
                    // if status is Completed
                    ...[
                      LabelValue.chip(
                        label: 'Total Quantity Difference',
                        chip: 1200,
                      ),
                      LabelValue.chip(
                        label: 'Total Cost Difference',
                        chip: -500,
                      ),
                    ],
                  ],
                ),
                const UIVerticalSpace(30),
                const PageSectionTitle(title: 'Description'),
                UITextField.noLabel(hint: 'Enter description here'),
                const UIVerticalSpace(48),
                // Uncounted Items -> if status != completed
                ...[
                  const UncountedItemsDataGrid(),
                  const UIVerticalSpace(60),
                  const CountedItemsDataGrid(),
                  const UIVerticalSpace(30),
                ],
                // else
                const CompletedStockTakeDataGrid(),
              ],
            ),
          ),
        ),
        const UIVerticalSpace(60),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            UIButton.filled(
              'Cancel Stock Take',
              style: UIStyleButton.danger,
              onClick: () {},
            ),
            const Spacer(),
            UIButton.secondary('Save changes', onClick: () {}),
            const UIHorizontalSpace(12),
            UIButton.filled(
              'Mark as Completed',
              onClick: () => showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Dialog(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.35,
                    color: UIColors.background,
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIText.heading6('Please select an action for uncounted items'),
                        const Divider(color: UIColors.borderMuted),
                        const UIVerticalSpace(16),
                        UIRadioGroup<StockTakeItemAction>(
                          direction: Axis.vertical,
                          items: StockTakeItemAction.values,
                          onSelect: (value) {},
                          itemAsString: (item) => item.label,
                        ),
                        // const UIVerticalSpace(30),
                        CancelActionButton(
                          actionLabel: 'Continue',
                          onCancel: () => Navigator.pop(context),
                          onAction: () {
                            /// PUT Request for Stock take
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
