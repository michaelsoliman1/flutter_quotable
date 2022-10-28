import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotes/app/controllers/quotes_controller.dart';
import 'package:quotes/app/screens/quotes/components/quote_item.dart';
import 'package:quotes/app/shared/widgets/error_view_widget.dart';
import 'package:quotes/app/shared/widgets/loading_indicator_widget.dart';

class QuotesScreen extends ConsumerWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(quotesProvider);
    return RefreshIndicator(
      onRefresh: controller.refreshQuotes,
      child: controller.isLoading
          ? const LoadingIndicator()
          : controller.isError
              ? ErrorIndicator(onTryAgainPressed: controller.getQuotes)
              : ListView.builder(
                  itemCount: controller.quotes.length,
                  itemBuilder: (context, index) {
                    return QuoteItem(qoute: controller.quotes[index]);
                  },
                ),
    );
  }
}
