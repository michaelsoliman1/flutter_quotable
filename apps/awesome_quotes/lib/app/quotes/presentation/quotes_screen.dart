import 'package:awesome_quotes/app/quotes/application/quotes_provider.dart';
import 'package:awesome_quotes/app/quotes/presentation/components/quote_item.dart';
import 'package:awesome_quotes/shared/widgets/error_view_widget.dart';
import 'package:awesome_quotes/shared/widgets/loading_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
