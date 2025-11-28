part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.processing() = _Processing;
  const factory CategoryState.success(Category category) = _Success;
  const factory CategoryState.failure(String message) = _Failure;
}
