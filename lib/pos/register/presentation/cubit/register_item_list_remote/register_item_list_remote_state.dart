part of 'register_item_list_remote_cubit.dart';

sealed class RegisterItemListRemoteState extends Equatable {
  const RegisterItemListRemoteState();

  @override
  List<Object> get props => [];
}

final class RegisterItemListInitial extends RegisterItemListRemoteState {}

final class RegisterItemListLoading extends RegisterItemListRemoteState {}

final class RegisterItemListLoaded extends RegisterItemListRemoteState {
  final List<RegisterItem> items;
  const RegisterItemListLoaded({required this.items});

  @override
  List<Object> get props => [items];
}

final class RegisterItemListError extends RegisterItemListRemoteState {
  final String message;
  const RegisterItemListError({required this.message});

  @override
  List<Object> get props => [message];
}
