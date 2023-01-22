import 'package:app_core/app_core.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

const firstPageIndex = 0;
const defaultPageLimit = 20;

mixin PagingMixin<T> {
  final pagingController = PagingController<int, T>(
    firstPageKey: firstPageIndex,
  );

  List<T> get items => pagingController.itemList ?? [];

  void pageRequestListener(int pageIndex);

  void addPageRequestListener() {
    pagingController.addPageRequestListener(
      pageRequestListener,
    );
  }

  /// Helper method to use directly to handle the response
  void handleResponse(Either<Failure, Page<T>> response, int pageIndex) {
    response.fold(
      (failure) => error = failure.message,
      (newPage) => addNewPage(pageIndex, newPage),
    );
  }

  set error(String message) {
    pagingController.error = message;
  }

  void addNewPage(int pageIndex, Page<T> newPage) {
    final newItems = newPage.items;

    if (newPage.isLastPage) {
      pagingController.appendLastPage(newItems);
    } else {
      final nextPageKey = pageIndex + 1;
      pagingController.appendPage(newItems, nextPageKey);
    }
  }
}
