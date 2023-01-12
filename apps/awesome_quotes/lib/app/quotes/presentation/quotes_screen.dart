import 'package:app_domain/app_domain.dart';
import 'package:app_ui/app_ui.dart';
import 'package:awesome_quotes/app/quotes/application/quotes_provider.dart';
import 'package:awesome_quotes/app/quotes/presentation/components/quote_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuotesScreen extends ConsumerWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(quotesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Awesome Quotes')),
      body: PagedListView<Quote>(
        pagingController: provider.pagingController,
        itemBuilder: (context, quote, index) => QuoteItem(qoute: quote),
      ),
    );
  }
}
