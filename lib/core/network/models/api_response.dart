import 'package:medglobal_admin_portal/core/core.dart';

class ApiResponse<T> {
  final String message;
  final T? data;
  final List<T>? items;
  final PageInfo? pageInfo;

  const ApiResponse({
    required this.message,
    this.data,
    this.items,
    this.pageInfo,
  });

  factory ApiResponse.fromJson(JSON json) {
    return ApiResponse(
      message: json['message'],
      data: json.keys.contains('data') ? json['data'] : null,
      items: json.keys.contains('data') ? json['data']['items'] : null,
      pageInfo: json.keys.contains('data') && json['data']['page'] != null ? PageInfo.fromJson(json['data']) : null,
    );
  }
}

class PageInfo {
  final int page;
  final int totalCount;
  final int totalPages;

  PageInfo({
    required this.page,
    required this.totalCount,
    required this.totalPages,
  });

  factory PageInfo.fromJson(JSON json) {
    return PageInfo(
      page: json['page'],
      totalCount: json['totalCount'],
      totalPages: json['totalPages'],
    );
  }
}
