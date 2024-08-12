import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/widgets/date_picker_popup.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionsPage extends StatefulWidget {
  static String route = '/point-of-sale/transactions';

  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<Transaction>> groupedItems = {};

    for (var item in mock) {
      DateTime date = DateTime(item.createdAt!.year, item.createdAt!.month, item.createdAt!.day);
      if (groupedItems[date] == null) {
        groupedItems[date] = [];
      }
      groupedItems[date]!.add(item);
    }

    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: UIColors.borderMuted, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3,
                      child: UISearchField(
                        fieldWidth: 500.0,
                        hint: 'Search',
                        icon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Assets.icons.search.svg(),
                        ),
                        controller: _searchController,
                        onChanged: (_) => {},
                      ),
                    ),
                    const UIHorizontalSpace(8),
                    Expanded(child: DatePickerPopup(onSelect: (_) {})),
                  ],
                ),
                const UIVerticalSpace(24),
                Expanded(
                  child: ListView.builder(
                    itemCount: groupedItems.length,
                    itemBuilder: (context, index) {
                      DateTime date = groupedItems.keys.elementAt(index);
                      List<Transaction> dateItems = groupedItems[date]!;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Date header
                          ListTile(
                            title: UIText.labelSemiBold(
                              DateFormat('E, d MMMM yyyy').format(date),
                              color: UIColors.textMuted,
                            ),
                            dense: true,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                          ),
                          // Items for the date
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dateItems.length,
                            itemBuilder: (context, index) {
                              final item = dateItems[index];
                              return Container(
                                decoration: UIStyleContainer.bottomBorder(color: UIColors.borderRegular),
                                child: ListTile(
                                  onTap: () {},
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      UIText.bodyRegular(item.id.toString()),
                                      if (item.type == TransactionType.REFUND)
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: UIColors.cancelledBg.withOpacity(0.4),
                                          ),
                                          child: Text(
                                            'Refund',
                                            style: UIStyleText.hint.copyWith(color: UIColors.cancelled, fontSize: 11),
                                          ),
                                        ),
                                    ],
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        UIText.labelMedium(DateFormat('h:mm a').format(date),
                                            color: UIColors.textMuted),
                                        UIText.labelSemiBold(
                                            '${item.type == TransactionType.REFUND ? '-' : ''} ${item.total.toString()} '),
                                      ],
                                    ),
                                  ),
                                  dense: true,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                ),
                              );
                            },
                          ),
                          const UIVerticalSpace(16),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const UIHorizontalSpace(16),
        Expanded(
          flex: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: UIColors.borderMuted, width: 1.0),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UIText.heading5('Total'),
                    UIButton.filled(
                      'Issue Refund',
                      style: UIStyleButton.danger,
                      onClick: () {
                        /// Issue Refund
                      },
                    ),
                  ],
                ),
                UIText.heading1('90.00', color: UIColors.completed),
                const UIVerticalSpace(30),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIText.heading6('Receipt'),
                        UIText.bodyRegular('0143873345'),
                      ],
                    ),
                    const UIHorizontalSpace(60),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIText.heading6('Date'),
                        UIText.bodyRegular(DateFormat('dd/MM/yyyy h:mm a').format(DateTime.now())),
                      ],
                    ),
                    const UIHorizontalSpace(60),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIText.heading6('Cashier'),
                        UIText.bodyRegular('John Doe'),
                      ],
                    ),
                  ],
                ),
                const UIVerticalSpace(30),
                const Divider(color: UIColors.borderRegular, thickness: 0.8),
                const UIVerticalSpace(30),
                UIText.heading5('Items Ordered'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List<Transaction> mock = [
  Transaction(id: 1, total: 90.00, type: TransactionType.SALE, createdAt: DateTime.now()),
  Transaction(id: 2, total: 90.00, type: TransactionType.SALE, createdAt: DateTime.now()),
  Transaction(id: 3, total: 90.00, type: TransactionType.REFUND, createdAt: DateTime.now()),
  Transaction(id: 4, total: 90.00, type: TransactionType.SALE, createdAt: DateTime(2024, 1, 2, 8, 23, 0, 0, 0)),
];
