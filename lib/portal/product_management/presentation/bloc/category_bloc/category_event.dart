part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.createCategory(String name) = _CreateCategory;
  const factory CategoryEvent.reset() = _Reset;
}
