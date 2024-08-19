import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/branch_transaction_list_cubit.dart';
import 'package:medglobal_admin_portal/shared/cubit/transaction_cubit.dart';
import 'package:medglobal_admin_portal/shared/entities/transaction.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    context.read<BranchTransactionListCubit>().getTransactionsByBranch();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Map<DateTime, List<Transaction>> _groupTransactionsByDate(List<Transaction> transactions) {
    Map<DateTime, List<Transaction>> groupedItems = {};

    for (var item in transactions) {
      DateTime date = DateTime(item.createdAt!.year, item.createdAt!.month, item.createdAt!.day);
      if (groupedItems[date] == null) {
        groupedItems[date] = [];
      }
      groupedItems[date]!.add(item);
    }

    return groupedItems;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: UIColors.background,
          border: Border.all(color: UIColors.borderMuted, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: [
            UISearchField(
              fieldWidth: 500.0,
              hint: 'Search',
              icon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Assets.icons.search.svg(),
              ),
              controller: _searchController,
              onChanged: (_) => {},
            ),
            const UIVerticalSpace(24),
            BlocBuilder<BranchTransactionListCubit, BranchTransactionListState>(
              builder: (context, state) {
                if (state is BranchTransactionListError) {
                  return Text(state.message);
                }
                if (state is BranchTransactionListLoaded) {
                  final groupedTransactionsByDate = _groupTransactionsByDate(state.transactions);

                  return Expanded(
                    child: LazyLoadScrollView(
                      onEndOfPage: () {
                        if (!state.hasReachedMax) {
                          context.read<BranchTransactionListCubit>().getTransactionsByBranch();
                        }
                      },
                      child: ListView.separated(
                        separatorBuilder: (_, __) => const UIVerticalSpace(8),
                        itemCount: groupedTransactionsByDate.length,
                        itemBuilder: (context, index) {
                          DateTime date = groupedTransactionsByDate.keys.elementAt(index);
                          List<Transaction> items = groupedTransactionsByDate[date]!;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                dense: true,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                                title: UIText.labelMedium(
                                  DateFormat('E, d MMMM yyyy').format(date),
                                  color: UIColors.textLight,
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  final item = items[index];

                                  return Container(
                                    decoration: UIStyleContainer.topBorder,
                                    child: BlocSelector<TransactionCubit, TransactionState, Transaction?>(
                                      selector: (state) {
                                        if (state is TransactionByIdSuccess) return state.transaction;
                                        return null;
                                      },
                                      builder: (context, currentTransaction) {
                                        return Container(
                                          color:
                                              currentTransaction?.id == item.id ? UIColors.buttonSecondaryHover : null,
                                          child: ListTile(
                                            onTap: () => context.read<TransactionCubit>().getTransactionById(item.id!),
                                            hoverColor: UIColors.buttonSecondaryHover,
                                            dense: true,
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                            title: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                UIText.bodyRegular(item.receiptId!),
                                                Container(
                                                  margin: const EdgeInsets.only(top: 0),
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: (item.type == TransactionType.SALE
                                                            ? UIColors.completedBg
                                                            : UIColors.cancelledBg)
                                                        .withOpacity(0.4),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      item.type == TransactionType.REFUND
                                                          ? Assets.icons.import
                                                              .svg(colorFilter: UIColors.buttonDanger.toColorFilter)
                                                          : Assets.icons.received.svg(
                                                              colorFilter: UIColors.completed.toColorFilter, width: 10),
                                                      const UIHorizontalSpace(8),
                                                      Text(
                                                        item.type!.label,
                                                        style: UIStyleText.hint.copyWith(
                                                          color: item.type == TransactionType.SALE
                                                              ? UIColors.completed
                                                              : UIColors.buttonDanger,
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(top: 6),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    DateFormat('h:mm a').format(item.createdAt!.toLocal()),
                                                    style: UIStyleText.hint.copyWith(color: UIColors.textMuted),
                                                  ),
                                                  const Spacer(),
                                                  if (item.type == TransactionType.REFUND) UIText.label('-'),
                                                  UIText.label('₱${item.total.toPesoString()} '),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }
                return const Expanded(
                    child: Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
