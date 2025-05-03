class BaseApiResponse<T> {
  final String message;
  final T data;

  BaseApiResponse({
    required this.message,
    required this.data,
  });

  factory BaseApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (json['data'] is Map<String, dynamic>) {
      return BaseApiResponse<T>(
        message: json['message'] as String,
        data: fromJson(json['data'] as Map<String, dynamic>),
      );
    } else {
      throw Exception('Unexpected type for "data" field');
    }
  }

  factory BaseApiResponse.fromJsonList(
    Map<String, dynamic> json,
    T Function(List) fromJson,
  ) {
    return BaseApiResponse<T>(
      message: json['message'] as String,
      data: fromJson(json['data'] as List),
    );
  }
}
