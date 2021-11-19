import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/quotes_controller.dart';
import '../../../models/quote.dart';
import '../../../shared/constants/constants.dart';

class QuoteItem extends StatelessWidget {
  const QuoteItem({
    Key? key,
    required this.qoute,
  }) : super(key: key);

  final Quote qoute;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(
        left: Constants.DEFAULT_PADDING,
        right: Constants.DEFAULT_PADDING,
        top: Constants.DEFAULT_PADDING,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(Constants.DEFAULT_PADDING),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        qoute.content,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(qoute.author),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 10,
            child: InkWell(
              onTap: () {
                context.read<QuotesController>().addQuoteToFavourite(
                      context: context,
                      quote: qoute,
                    );
              },
              borderRadius: BorderRadius.circular(10),
              child: Icon(
                // It would be definitly a better experience to show if the qoute is saved or not
                // but that won't work for our example here, because this info is usually fetched with
                // each quote (think of an attribute isFavorite in the Quote model) from the server
                // If we have this feature, then we could've done something like the following,
                //    qoute.isFavourite
                //    ? Icons.bookmark_add
                //    : Icons.bookmark_add_outlined
                Icons.bookmark_add_outlined,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
