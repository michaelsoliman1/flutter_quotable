import 'package:json_annotation/json_annotation.dart';

part 'server_error.g.dart';

/// Server error returned from backend
///
// you can customize this class to mirror the error object returned
@JsonSerializable()
class ServerError {
  const ServerError({
    this.message = 'Opps! Something went wrong! Please Try again later',
    this.responseCode,
    this.error,
  });

  factory ServerError.fromJson(Map<String, dynamic> json) => _$ServerErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ServerErrorToJson(this);

  final String message;
  final String? responseCode;
  final String? error;

  @override
  String toString() => 'ServerError(message: $message, responseCode: $responseCode, error: $error)';
}
