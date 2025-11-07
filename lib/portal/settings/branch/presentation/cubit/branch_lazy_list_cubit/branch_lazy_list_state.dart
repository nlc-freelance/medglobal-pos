// part of 'branch_lazy_list_cubit.dart';

// class BranchLazyListState extends Equatable {
//   const BranchLazyListState({
//     required this.branches,
//     required this.hasReachedMax,
//     required this.hasNoData,
//     this.isInitLoading = false,
//     this.isLoadingMore = false,
//     this.error,
//   });

//   final List<Branch> branches;
//   final bool hasNoData;
//   final bool hasReachedMax;
//   final bool isInitLoading;
//   final bool isLoadingMore;
//   final String? error;

//   @override
//   List<Object?> get props => [branches, hasNoData, hasReachedMax, isInitLoading, isLoadingMore, error];

//   factory BranchLazyListState.initial() => const BranchLazyListState(
//         branches: [],
//         hasNoData: false,
//         hasReachedMax: false,
//       );

//   BranchLazyListState copyWith({
//     List<Branch>? branches,
//     bool? hasReachedMax,
//     bool? hasNoData,
//     bool? isInitLoading,
//     bool? isLoadingMore,
//     String? error,
//   }) {
//     return BranchLazyListState(
//       branches: branches ?? this.branches,
//       hasNoData: hasNoData ?? this.hasNoData,
//       hasReachedMax: hasReachedMax ?? this.hasReachedMax,
//       isInitLoading: isInitLoading ?? this.isInitLoading,
//       isLoadingMore: isLoadingMore ?? this.isLoadingMore,
//       error: error,
//     );
//   }

//   bool get INITIAL_LOADING => isInitLoading;

//   bool get EMPTY => hasNoData;

//   bool get ERROR => error != null;

//   @override
//   String toString() {
//     return 'BranchLazyListState{branches: $branches, hasNoData: $hasNoData, hasReachedMax: $hasReachedMax, isInitLoading: $isInitLoading, isLoadingMore: $isLoadingMore, error: $error}';
//   }
// }
