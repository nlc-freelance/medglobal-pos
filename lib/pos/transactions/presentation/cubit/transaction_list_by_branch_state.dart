// part of 'transaction_list_by_branch_cubit.dart';

// class TransactionListByBranchState extends Equatable {
//   const TransactionListByBranchState({
//     required this.transactions,
//     required this.hasReachedMax,
//     required this.hasNoData,
//     this.isInitLoading = false,
//     this.isLoadingMore = false,
//     this.error,
//   });

//   final List<Transaction> transactions;
//   final bool hasNoData;
//   final bool hasReachedMax;
//   final bool isInitLoading;
//   final bool isLoadingMore;
//   final String? error;

//   @override
//   List<Object?> get props => [transactions, hasNoData, hasReachedMax, isInitLoading, isLoadingMore, error];

//   factory TransactionListByBranchState.initial() => const TransactionListByBranchState(
//         transactions: [],
//         hasNoData: false,
//         hasReachedMax: false,
//       );

//   TransactionListByBranchState copyWith({
//     List<Transaction>? transactions,
//     bool? hasReachedMax,
//     bool? hasNoData,
//     bool? isInitLoading,
//     bool? isLoadingMore,
//     String? error,
//   }) {
//     return TransactionListByBranchState(
//       transactions: transactions ?? this.transactions,
//       hasNoData: hasNoData ?? this.hasNoData,
//       hasReachedMax: hasReachedMax ?? this.hasReachedMax,
//       isInitLoading: isInitLoading ?? this.isInitLoading,
//       isLoadingMore: isLoadingMore ?? this.isLoadingMore,
//       error: error ?? this.error,
//     );
//   }

//   bool get LOADING => isInitLoading;

//   bool get EMPTY => hasNoData;

//   bool get ERROR => error != null;
// }
