import 'package:flutter/material.dart';

import '../../../models/quote.dart';
import '../../../shared/constants/constants.dart';

class FavouriteQuoteItem extends StatefulWidget {
  const FavouriteQuoteItem({Key? key, required this.qoute}) : super(key: key);

  final Quote qoute;

  @override
  _FavouriteQuoteItemState createState() => _FavouriteQuoteItemState();
}

class _FavouriteQuoteItemState extends State<FavouriteQuoteItem> {
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
        onDismissed: (direction) {},
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
                      widget.qoute.content,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(widget.qoute.author),
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
