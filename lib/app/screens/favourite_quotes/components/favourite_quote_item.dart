import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/quotes_controller.dart';
import '../../../models/quote.dart';
import '../../../shared/constants/constants.dart';

class FavouriteQuoteItem extends StatelessWidget {
  const FavouriteQuoteItem({Key? key, required this.quote}) : super(key: key);
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(
        left: Constants.DEFAULT_PADDING,
        right: Constants.DEFAULT_PADDING,
        top: Constants.DEFAULT_PADDING,
      ),
      child: Dismissible(
        key: UniqueKey(),
        dismissThresholds: {DismissDirection.endToStart: 0.7},
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          context.read<QuotesController>().removeQouteFromFavourite(
                context: context,
                id: quote.id,
              );
        },
        confirmDismiss: (_) {
          return showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.dangerous_outlined,
                    size: 60,
                    color: Theme.of(context).errorColor,
                  ),
                  const Text("Are you sure you want to remove the quote from favourites? "),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    "Yes, Delete!",
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("Cancel"),
                )
              ],
            ),
          );
        },
        background: Container(
          padding: const EdgeInsets.only(right: Constants.DEFAULT_PADDING),
          color: Theme.of(context).errorColor,
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete_outline,
            size: 30,
            color: Theme.of(context).colorScheme.onError,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Constants.DEFAULT_PADDING),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quote.content,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(quote.author),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
