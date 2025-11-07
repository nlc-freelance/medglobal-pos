import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medglobal_admin_portal/core/errors/failures.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = ApiSuccess<T>;
  const factory ApiResult.failure(Failure failure) = ApiFailure<T>;
}
