import 'package:app_domain/app_domain.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotable/app/quotes/application/quotes_provider.dart';
import 'package:flutter_quotable/app/quotes/presentation/components/quote_item.dart';
import 'package:flutter_quotable/l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuotesScreen extends ConsumerWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(quotesProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.quotes)),
      body: PagedListView<Quote>(
        pagingController: provider.pagingController,
        itemBuilder: (context, quote, index) => QuoteItem(qoute: quote),
      ),
    );
  }
}
