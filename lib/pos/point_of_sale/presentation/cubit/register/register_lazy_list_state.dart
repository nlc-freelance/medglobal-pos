part of 'register_lazy_list_cubit.dart';

class RegisterLazyListState extends Equatable {
  const RegisterLazyListState({
    required this.registers,
    required this.hasReachedMax,
    required this.hasNoData,
    this.isInitLoading = false,
    this.isLoadingMore = false,
    this.error,
  });

  final List<Register> registers;
  final bool hasNoData;
  final bool hasReachedMax;
  final bool isInitLoading;
  final bool isLoadingMore;
  final String? error;

  @override
  List<Object?> get props => [registers, hasNoData, hasReachedMax, isInitLoading, isLoadingMore, error];

  factory RegisterLazyListState.initial() => const RegisterLazyListState(
        registers: [],
        hasNoData: false,
        hasReachedMax: false,
      );

  RegisterLazyListState copyWith({
    List<Register>? registers,
    bool? hasReachedMax,
    bool? hasNoData,
    bool? isInitLoading,
    bool? isLoadingMore,
    String? error,
  }) {
    return RegisterLazyListState(
      registers: registers ?? this.registers,
      hasNoData: hasNoData ?? this.hasNoData,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isInitLoading: isInitLoading ?? this.isInitLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: error,
    );
  }

  bool get INITIAL_LOADING => isInitLoading;

  bool get EMPTY => hasNoData;

  bool get ERROR => error != null;

  @override
  String toString() {
    return 'RegisterLazyListState{registers: $registers, hasNoData: $hasNoData, hasReachedMax: $hasReachedMax, isInitLoading: $isInitLoading, isLoadingMore: $isLoadingMore, error: $error}';
  }
}
