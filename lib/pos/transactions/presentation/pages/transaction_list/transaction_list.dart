import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/cubit/transaction_list_by_branch_cubit.dart';
import 'package:medglobal_admin_portal/shared/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/shared/transactions/presentation/cubit/transaction_cubit.dart';
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
    context.read<TransactionListByBranchCubit>().getTransactionsByBranch();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Map<DateTime, List<Transaction>> _groupTransactionsByDate(List<Transaction> transactions) {
    Map<DateTime, List<Transaction>> groupedItems = {};

    for (var item in transactions) {
      DateTime date =
          DateTime(item.createdAt!.toLocal().year, item.createdAt!.toLocal().month, item.createdAt!.toLocal().day);
      if (groupedItems[date] == null) {
        groupedItems[date] = [];
      }
      groupedItems[date]!.add(item);
    }

    /// Sort dates from latest to oldest
    var sortedGroupedItems = Map.fromEntries(groupedItems.entries.toList()..sort((a, b) => b.key.compareTo(a.key)));

    /// Sort transactions within each date from latest to oldest
    sortedGroupedItems.forEach((key, value) {
      value.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    });

    return sortedGroupedItems;
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
        child: BlocBuilder<TransactionListByBranchCubit, TransactionListByBranchState>(
          builder: (context, state) {
            return Column(
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
                if (state.LOADING)
                  const Padding(
                    padding: EdgeInsets.all(30),
                    child: SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
                    ),
                  )
                else if (state.EMPTY)
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: UIText.labelMedium(_searchController.text.isNotEmpty
                        ? 'No results found for \'${_searchController.text}\''
                        : 'No data available'),
                  )
                else if (state.ERROR)
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: UIText.labelMedium(state.error!),
                  )
                else
                  Expanded(
                    child: LazyLoadScrollView(
                      onEndOfPage: () {
                        if (!state.hasReachedMax) {
                          context.read<TransactionListByBranchCubit>().getTransactionsByBranch();
                        }
                      },
                      child: ListView.separated(
                        separatorBuilder: (_, __) => const UIVerticalSpace(8),
                        itemCount: _groupTransactionsByDate(state.transactions).length,
                        itemBuilder: (context, index) {
                          DateTime date = _groupTransactionsByDate(state.transactions).keys.elementAt(index);
                          List<Transaction> items = _groupTransactionsByDate(state.transactions)[date]!;

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
                                                Text(
                                                  item.receiptId!,
                                                  style: UIStyleText.hintRegular.copyWith(color: UIColors.textRegular),
                                                ),
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
                                                      UIText.labelRegular(
                                                        item.type!.label,
                                                        color: item.type == TransactionType.SALE
                                                            ? UIColors.completed
                                                            : UIColors.buttonDanger,
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
                              if (index == _groupTransactionsByDate(state.transactions).length - 1 &&
                                  !state.hasReachedMax)
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 4),
                                  child: Center(
                                    child: SizedBox(
                                      width: 12,
                                      height: 12,
                                      child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        // BlocBuilder<TransactionListByBranchCubit, TransactionListByBranchState>(
        //   builder: (context, state) {
        //     // if (state is TransactionListByBranchError) {
        //     //   return Text(state.message);
        //     // }
        //     // if (state is TransactionListByBranchLoaded) {
        //     //   final groupedTransactionsByDate = _groupTransactionsByDate(state.transactions);
        //
        //        Expanded(
        //         child: LazyLoadScrollView(
        //           onEndOfPage: () {
        //             if (!state.hasReachedMax) {
        //               context.read<TransactionListByBranchCubit>().getTransactionsByBranch();
        //             }
        //           },
        //           child: ListView.separated(
        //             separatorBuilder: (_, __) => const UIVerticalSpace(8),
        //             itemCount: groupedTransactionsByDate.length,
        //             itemBuilder: (context, index) {
        //               DateTime date = groupedTransactionsByDate.keys.elementAt(index);
        //               List<Transaction> items = groupedTransactionsByDate[date]!;
        //
        //               if (index == state.transactions.length - 1 && !state.hasReachedMax) {
        //                 return const Padding(
        //                   padding: EdgeInsets.only(bottom: 4),
        //                   child: Center(
        //                     child: SizedBox(
        //                       width: 12,
        //                       height: 12,
        //                       child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
        //                     ),
        //                   ),
        //                 );
        //               }
        //
        //               return Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: <Widget>[
        //                   ListTile(
        //                     dense: true,
        //                     contentPadding: const EdgeInsets.symmetric(horizontal: 2),
        //                     title: UIText.labelMedium(
        //                       DateFormat('E, d MMMM yyyy').format(date),
        //                       color: UIColors.textLight,
        //                     ),
        //                   ),
        //                   ListView.builder(
        //                     shrinkWrap: true,
        //                     physics: const NeverScrollableScrollPhysics(),
        //                     itemCount: items.length,
        //                     itemBuilder: (context, index) {
        //                       final item = items[index];
        //
        //                       return Container(
        //                         decoration: UIStyleContainer.topBorder,
        //                         child: BlocSelector<TransactionCubit, TransactionState, Transaction?>(
        //                           selector: (state) {
        //                             if (state is TransactionByIdSuccess) return state.transaction;
        //
        //                             return null;
        //                           },
        //                           builder: (context, currentTransaction) {
        //                             return Container(
        //                               color:
        //                                   currentTransaction?.id == item.id ? UIColors.buttonSecondaryHover : null,
        //                               child: ListTile(
        //                                 onTap: () => context.read<TransactionCubit>().getTransactionById(item.id!),
        //                                 hoverColor: UIColors.buttonSecondaryHover,
        //                                 dense: true,
        //                                 contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        //                                 title: Row(
        //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                                   children: [
        //                                     Text(
        //                                       item.receiptId!,
        //                                       style: UIStyleText.hintRegular.copyWith(color: UIColors.textRegular),
        //                                     ),
        //                                     Container(
        //                                       margin: const EdgeInsets.only(top: 0),
        //                                       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        //                                       decoration: BoxDecoration(
        //                                         borderRadius: BorderRadius.circular(8),
        //                                         color: (item.type == TransactionType.SALE
        //                                                 ? UIColors.completedBg
        //                                                 : UIColors.cancelledBg)
        //                                             .withOpacity(0.4),
        //                                       ),
        //                                       child: Row(
        //                                         children: [
        //                                           item.type == TransactionType.REFUND
        //                                               ? Assets.icons.import
        //                                                   .svg(colorFilter: UIColors.buttonDanger.toColorFilter)
        //                                               : Assets.icons.received.svg(
        //                                                   colorFilter: UIColors.completed.toColorFilter, width: 10),
        //                                           const UIHorizontalSpace(8),
        //                                           UIText.labelRegular(
        //                                             item.type!.label,
        //                                             color: item.type == TransactionType.SALE
        //                                                 ? UIColors.completed
        //                                                 : UIColors.buttonDanger,
        //                                           ),
        //                                         ],
        //                                       ),
        //                                     )
        //                                   ],
        //                                 ),
        //                                 subtitle: Padding(
        //                                   padding: const EdgeInsets.only(top: 6),
        //                                   child: Row(
        //                                     children: [
        //                                       Text(
        //                                         DateFormat('h:mm a').format(item.createdAt!.toLocal()),
        //                                         style: UIStyleText.hint.copyWith(color: UIColors.textMuted),
        //                                       ),
        //                                       const Spacer(),
        //                                       if (item.type == TransactionType.REFUND) UIText.label('-'),
        //                                       UIText.label('₱${item.total.toPesoString()} '),
        //                                     ],
        //                                   ),
        //                                 ),
        //                               ),
        //                             );
        //                           },
        //                         ),
        //                       );
        //                     },
        //                   ),
        //                 ],
        //               );
        //             },
        //           ),
        //         ),
        //       );
        //     }
        // return const Expanded(
        //     child: Center(child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2)));
        // },
        // ),
        // ],
        // ),
      ),
    );
  }
}
