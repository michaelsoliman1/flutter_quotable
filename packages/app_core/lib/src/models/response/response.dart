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

class Page<T> {
  Page({
    required this.totalCount,
    required this.items,
    required this.pageIndex,
    required this.totalPages,
  });

  /// The total number of quotes matching this query
  final int totalCount;

  /// The total number of pages matching this request
  final int totalPages;

  /// The current page index
  final int pageIndex;

  final List<T> items;

  bool get isLastPage => pageIndex == totalPages - 1;
}
