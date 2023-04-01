import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart' as p;

class PagedGridView<T> extends StatelessWidget {
  const PagedGridView({
    required this.pagingController,
    required this.itemBuilder,
    required this.crossAxisCount,
    this.shrinkWrap = false,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.primary,
    super.key,
  });

  final int crossAxisCount;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;

  final p.PagingController<int, T> pagingController;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final bool shrinkWrap;
  final bool? primary;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(pagingController.refresh),
      child: p.PagedGridView(
        primary: primary,
        shrinkWrap: shrinkWrap,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing ?? 10,
          mainAxisSpacing: mainAxisSpacing ?? 10,
        ),
        pagingController: pagingController,
        builderDelegate: p.PagedChildBuilderDelegate<T>(
          itemBuilder: itemBuilder,
          firstPageErrorIndicatorBuilder: (_) => Center(
            child: Icon(
              Icons.error,
              color: Theme.of(context).colorScheme.error,
              size: 40,
            ),
          ),
          noItemsFoundIndicatorBuilder: (_) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.error,
                  size: 40,
                ),
              ],
            ),
          ),
        ),
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}
