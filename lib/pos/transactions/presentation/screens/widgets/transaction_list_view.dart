import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medglobal_admin_portal/core/core.dart';
import 'package:medglobal_admin_portal/core/utils/debouncer.dart';
import 'package:medglobal_admin_portal/pos/syncing/connectivity/connectivity_cubit.dart';
import 'package:medglobal_admin_portal/pos/transactions/domain/entities/transaction.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/register_transaction_bloc/register_transaction_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/bloc/transaction_list_bloc/transaction_list_bloc.dart';
import 'package:medglobal_admin_portal/pos/transactions/presentation/screens/widgets/transaction_type_badge.dart';
import 'package:medglobal_shared/medglobal_shared.dart';

class TransactionListView extends StatefulWidget {
  const TransactionListView({super.key});

  @override
  State<TransactionListView> createState() => _TransactionListSectionState();
}

class _TransactionListSectionState extends State<TransactionListView> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    // if (context.read<TransactionListBloc>().state.transactions.isEmpty) {
    context.read<TransactionListBloc>().add(const TransactionListEvent.fetch());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: UIColors.background,
        border: Border.all(color: UIColors.borderMuted, width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: BlocBuilder<ConnectivityCubit, bool>(
        builder: (context, isOnline) {
          return isOnline
              ? BlocConsumer<TransactionListBloc, TransactionListState>(
                  listener: (context, state) {
                    // For offline refund
                    // if (state.newTransactionAdded) {
                    //   _scrollController.animateTo(
                    //     0.0,
                    //     duration: const Duration(milliseconds: 400),
                    //     curve: Curves.easeInOut,
                    //   );
                    // }
                  },
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: UISearchField(
                                fieldWidth: 500.0,
                                hint: 'Search',
                                icon: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Assets.icons.search.svg(),
                                ),
                                controller: _searchController,
                                onChanged: (value) => _debouncer.run(
                                  (() => context
                                      .read<TransactionListBloc>()
                                      .add(TransactionListEvent.fetch(search: value))),
                                ),
                              ),
                            ),
                            const UIHorizontalSpace(8),
                            InkWell(
                              onTap: () => context
                                  .read<TransactionListBloc>()
                                  .add(const TransactionListEvent.fetch(forceRefresh: true)),
                              child: const Tooltip(
                                message: 'Refresh',
                                child: Icon(
                                  Icons.sync,
                                  size: 18,
                                  color: UIColors.textRegular,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const UIVerticalSpace(24),
                        if (state.isLoadingInitial)
                          const Padding(
                            padding: EdgeInsets.all(30),
                            child: SizedBox(
                              width: 12,
                              height: 12,
                              child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
                            ),
                          )
                        else if (state.error != null)
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: [
                                if (state.error?.toLowerCase().contains('internet') == true) ...[
                                  UIText.label(
                                    'No Internet Connection',
                                    align: TextAlign.center,
                                  ),
                                  const UIVerticalSpace(10),
                                  Text(
                                    'You need to be online to view your transactions. Please connect to the internet and try again.',
                                    textAlign: TextAlign.center,
                                    style: UIStyleText.hint,
                                  ),
                                ] else
                                  UIText.labelMedium(state.error!, align: TextAlign.center),
                              ],
                            ),
                          )
                        else if (state.transactions.isEmpty)
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: UIText.labelMedium(
                              _searchController.text.isNotEmpty
                                  ? 'No results found for \'${_searchController.text}\''
                                  : 'No data available',
                            ),
                          )
                        else
                          Expanded(
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: _groupTransactionsByDate(state.transactions).length,
                              itemBuilder: (context, index) {
                                final date = _groupTransactionsByDate(state.transactions).keys.elementAt(index);
                                final transactions = _groupTransactionsByDate(state.transactions)[date]!;

                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      dense: true,
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                                      title: UIText.labelMedium(
                                        date.toFormattedDayAndFullDate(),
                                        color: UIColors.textLight,
                                      ),
                                    ),
                                    if (transactions.isNotEmpty)
                                      ...transactions.map(
                                        (transaction) {
                                          return BlocSelector<RegisterTransactionBloc, RegisterTransactionState,
                                              Transaction?>(
                                            selector: (state) => state.maybeWhen(
                                              loaded: (transaction) => transaction,
                                              orElse: () => null,
                                            ),
                                            builder: (context, currentTransaction) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: currentTransaction?.id == transaction.id
                                                      ? UIColors.buttonSecondaryHover
                                                      : null,
                                                  border: const Border(
                                                      top: BorderSide(width: 0.8, color: UIColors.borderMuted)),
                                                ),
                                                child: ListTile(
                                                  onTap: () {
                                                    context.read<RegisterTransactionBloc>().add(
                                                          RegisterTransactionEvent.getById(transaction.id),
                                                        );
                                                  },
                                                  hoverColor: UIColors.buttonSecondaryHover,
                                                  contentPadding:
                                                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                  title: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        transaction.receiptId,
                                                        style: UIStyleText.hintRegular
                                                            .copyWith(color: UIColors.textRegular),
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      const UIVerticalSpace(8),
                                                      TransactionTypeBadge(transaction.type)
                                                    ],
                                                  ),
                                                  subtitle: Padding(
                                                    padding: const EdgeInsets.only(top: 16),
                                                    child: Wrap(
                                                      alignment: WrapAlignment.spaceBetween,
                                                      runSpacing: 8,
                                                      spacing: 16,
                                                      children: [
                                                        Text(
                                                          transaction.createdAt.toFormattedDateTime12Hr(),
                                                          style: UIStyleText.hint.copyWith(color: UIColors.textMuted),
                                                        ),
                                                        UIText.label(
                                                          '${transaction.type == TransactionType.refund ? '-' : ''}₱${transaction.total.toPesoString()}',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                        if (!state.hasReachedEnd && state.isLoadingMore)
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: SizedBox(
                              width: 12,
                              height: 12,
                              child: CircularProgressIndicator(color: UIColors.primary, strokeWidth: 2),
                            ),
                          )
                      ],
                    );
                  },
                )
              : Column(
                  children: [
                    const Icon(Icons.wifi_off_rounded),
                    const UIVerticalSpace(8),
                    UIText.labelMedium(
                      'No internet connection',
                      align: TextAlign.center,
                      color: UIColors.textRegular,
                    ),
                  ],
                );
        },
      ),
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
        !context.read<TransactionListBloc>().state.isLoadingMore &&
        !context.read<TransactionListBloc>().state.hasReachedEnd) {
      context.read<TransactionListBloc>().add(const TransactionListEvent.fetch());
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  Map<DateTime, List<Transaction>> _groupTransactionsByDate(List<Transaction> transactions) {
    Map<DateTime, List<Transaction>> groupedItems = {};

    for (var item in transactions) {
      DateTime date = DateTime(item.createdAt.year, item.createdAt.month, item.createdAt.day);
      if (groupedItems[date] == null) {
        groupedItems[date] = [];
      }
      groupedItems[date]!.add(item);
    }

    /// Sort dates from latest to oldest
    var sortedGroupedItems = Map.fromEntries(groupedItems.entries.toList()..sort((a, b) => b.key.compareTo(a.key)));

    /// Sort transactions within each date from latest to oldest
    sortedGroupedItems.forEach((key, value) {
      value.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    });

    return sortedGroupedItems;
  }
}
