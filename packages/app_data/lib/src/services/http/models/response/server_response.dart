import 'package:json_annotation/json_annotation.dart';

part 'server_response.g.dart';

/// basic response returned from backend
@JsonSerializable()
class ServerResponse {
  const ServerResponse({
    this.result = const {},
  });

  factory ServerResponse.fromJson(Map<String, dynamic> json) => _$ServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServerResponseToJson(this);

  @JsonKey(readValue: resultReadValue)
  final Map<String, dynamic> result;

  // since our result is object itself, we pass it to [ServerResponse.fromJson] directly
  static Object? resultReadValue(Map<dynamic, dynamic> json, _) => json;
}

/// Response that contains a list of [Map<String, dynamic>]
@JsonSerializable()
class ServerPageResponse {
  const ServerPageResponse({
    required this.count,
    required this.totalCount,
    required this.page,
    required this.totalPages,
    required this.lastItemIndex,
    this.result = const [],
  });

  factory ServerPageResponse.fromJson(Map<String, dynamic> json) => _$ServerPageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServerPageResponseToJson(this);

  ///  The number of quotes returned in this response
  final int count;

  /// The total number of quotes matching this query
  final int totalCount;

  /// The current page index
  final int page;

  /// The total number of pages matching this request
  final int totalPages;

  /// The 1-based index of the last result included in the current response.
  final int lastItemIndex;

  /// list containing the items
  final List<Map<String, dynamic>> result;
}
