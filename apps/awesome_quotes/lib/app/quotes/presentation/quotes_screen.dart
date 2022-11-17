import 'package:app_core/app_core.dart';
import 'package:app_ui/app_ui.dart';
import 'package:awesome_quotes/app/quotes/application/quotes_provider.dart';
import 'package:awesome_quotes/app/quotes/presentation/components/quote_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuotesScreen extends ConsumerWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quotesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Awesome Quotes')),
      body: state.when(
        loading: () => const LoadingIndicator(),
        error: (e, __) {
          Logger.error(e);
          return ErrorIndicator(
            onTryAgainPressed: () => ref.invalidate(quotesProvider),
          );
        },
        data: (quotes) => RefreshIndicator(
          onRefresh: () async => ref.invalidate(quotesProvider),
          child: ListView.builder(
            itemCount: quotes.length,
            itemBuilder: (context, index) => QuoteItem(qoute: quotes[index]),
          ),
        ),
      ),
    );
  }
}
