import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/quotes_controller.dart';
import '../../shared/widgets/error_view_widget.dart';
import '../../shared/widgets/loading_indicator_widget.dart';
import 'components/quote_item.dart';

class QoutesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Qoutes")),
      body: RefreshIndicator(
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
      ),
    );
  }
}
