import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/quotes_controller.dart';
import '../../navigation/app_pages.dart';
import '../../shared/widgets/error_view_widget.dart';
import '../../shared/widgets/loading_indicator_widget.dart';
import 'components/quote_item.dart';

class QuotesScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: AppPages.quotesPath,
      key: ValueKey(AppPages.quotesPath),
      child: const QuotesScreen(),
    );
  }

  const QuotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<QuotesController>().refreshQuotes(),
      child: Consumer<QuotesController>(
        builder: (context, controller, _) => controller.isLoading
            ? LoadingIndicator()
            : controller.isError
                ? ErrorIndicator(onButtonPress: context.read<QuotesController>().getQuotes)
                : ListView.builder(
                    itemCount: controller.quotes.length,
                    itemBuilder: (context, index) {
                      return QuoteItem(qoute: controller.quotes[index]);
                    },
                  ),
      ),
    );
  }
}
