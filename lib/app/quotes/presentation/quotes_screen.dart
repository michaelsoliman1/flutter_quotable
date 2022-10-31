import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotes/app/quotes/application/quotes_provider.dart';
import 'package:quotes/app/quotes/presentation/components/quote_item.dart';
import 'package:quotes/shared/widgets/error_view_widget.dart';
import 'package:quotes/shared/widgets/loading_indicator_widget.dart';

class QuotesScreen extends ConsumerWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quotesProvider);

    return state.when(
      loading: () => const LoadingIndicator(),
      error: (_, __) => ErrorIndicator(
        onTryAgainPressed: () => ref.invalidate(quotesProvider),
      ),
      data: (quotes) => RefreshIndicator(
        onRefresh: () async => ref.invalidate(quotesProvider),
        child: ListView.builder(
          itemCount: quotes.length,
          itemBuilder: (context, index) => QuoteItem(qoute: quotes[index]),
        ),
      ),
    );
  }
}
