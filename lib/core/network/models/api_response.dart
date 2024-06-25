import 'package:medglobal_admin_portal/core/core.dart';

class ApiResponse<T> {
  final String message;
  final T? data;
  final PageInfo? pageInfo;

  const ApiResponse({
    required this.message,
    this.data,
    this.pageInfo,
  });

  factory ApiResponse.fromJson(JSON json) {
    return ApiResponse(
      message: json['message'],
      data: json['data'],
      pageInfo: json.keys.contains('data') && json['data']['page'] != null ? PageInfo.fromJson(json['data']) : null,
    );
  }
}

class PageInfo {
  final int page;
  final int size;
  final int totalCount;
  final int totalPages;

  PageInfo({
    required this.page,
    required this.size,
    required this.totalCount,
    required this.totalPages,
  });

  factory PageInfo.fromJson(JSON json) {
    return PageInfo(
      page: json['page'],
      size: json['size'],
      totalCount: json['totalCount'],
      totalPages: json['totalPages'],
    );
  }
}
