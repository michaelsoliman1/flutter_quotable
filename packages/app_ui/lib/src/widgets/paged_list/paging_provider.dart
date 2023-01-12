import 'package:app_ui/src/widgets/paged_list/paged_list.dart';

/// A helper class that provides a PagingController
///
/// See also:
///
/// - [PagedListView], which uses the paging controller to display paginated data
abstract class PagingProvider<T> with PagingMixin<T> {
  PagingProvider() {
    addPageRequestListener();
  }

  NewPageCallback<T> get pageRequest;

  @override
  void pageRequestListener(int pageIndex) {
    pageRequest(pageIndex) //
        .then((either) => handleResponse(either, pageIndex));
  }

  void refresh() => pagingController.refresh();
}
