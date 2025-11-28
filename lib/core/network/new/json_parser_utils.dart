/// A generic function type for parsing JSON data into an object of type [T].
///
/// Accepts `dynamic` instead of `Map<String, dynamic>` to allow flexibility
/// in handling both single objects and lists in a generic way.
typedef JsonParser<T> = T Function(dynamic json);

/// A helper that casts dynamic to Map<String, dynamic> and calls your [fromJson].
///
/// Useful to wrap strongly-typed `fromJson(Map)` functions (like in freezed models)
/// to match the [JsonParser<T>] typedef, which takes dynamic.
T parse<T>(dynamic json, T Function(Map<String, dynamic>) fromJson) {
  return fromJson(json as Map<String, dynamic>);
}

/// Defines the expected format of the API response.
///
/// - [single]: A single JSON object.
/// - [list]: A list of JSON objects.
/// - [paginated]: A paginated response with metadata and a list of items.
/// - [empty]: An empty response with no content.
enum ResponseFormat {
  single,
  list,
  paginated,
  empty,
}
