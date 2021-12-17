import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/favorite_quotes_controller.dart';
import '../../shared/widgets/error_view_widget.dart';
import '../../shared/widgets/loading_indicator_widget.dart';
import 'components/favourite_quote_item.dart';

class FavouriteQuotesScreen extends StatelessWidget {
  const FavouriteQuotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Qoutes"),
      ),
      body: Consumer<FavoriteQuotesController>(
        builder: (context, controller, _) => controller.isFavouritesLoading
            ? LoadingIndicator()
            : controller.isFavouritesError
                ? ErrorIndicator(onButtonPress: controller.loadFavouriteQuotes)
                : controller.favouriteQuotes.isEmpty
                    ? emptyView
                    : ListView.builder(
                        itemCount: controller.favouriteQuotes.length,
                        itemBuilder: (context, index) {
                          return FavouriteQuoteItem(quote: controller.favouriteQuotes[index]);
                        },
                      ),
      ),
    );
  }

  Widget get emptyView => Center(
        child: Text(
          "Favourite qoutes to show them here",
          style: TextStyle(fontSize: 20),
        ),
      );
}
