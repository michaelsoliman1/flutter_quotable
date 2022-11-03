/// {@template response}
///
/// A generic operation response that holds data
/// and optionally a message.
///
/// Can be customized to hold more info.
///
/// {@endtemplate}
class Response<T> {
  /// {@macro response}
  const Response({
    required this.result,
    this.message,
  });

  /// result of the response
  final T result;

  /// an optional message with the response
  final String? message;
}
