import 'package:json_annotation/json_annotation.dart';

part 'server_response.g.dart';

/// Response returned from backend
///
// TODO customize this class to mirror the server body returned
@JsonSerializable()
class ServerResponse {
  const ServerResponse({
    this.message = '',
    this.responseCode,
    this.result,
    this.url,
  });

  factory ServerResponse.fromJson(Map<String, dynamic> json) => _$ServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServerResponseToJson(this);

  final String message;
  final String? responseCode;
  final Map<String, dynamic>? result;

  /// url for media uploaded
  ///
  /// **only availabe for media upload, might be removed
  final String? url;
}

/// Response that contains a list of [Map<String, dynamic>]
@JsonSerializable()
class ServerListResponse {
  const ServerListResponse({
    this.message = '',
    this.responseCode,
    this.result,
    this.totalPages,
    this.afterId,
  });

  factory ServerListResponse.fromJson(Map<String, dynamic> json) => _$ServerListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServerListResponseToJson(this);

  final String message;
  final List<Map<String, dynamic>>? result;

  @JsonKey(name: 'numPages')
  final int? totalPages;
  final String? afterId;

  final String? responseCode;
}
