import 'package:app_domain/app_domain.dart';
import 'package:awesome_quotes/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class QuoteItem extends StatelessWidget {
  const QuoteItem({
    super.key,
    required this.qoute,
  });

  final Quote qoute;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(
        left: Constants.defaultPadding,
        right: Constants.defaultPadding,
        top: Constants.defaultPadding,
      ),
      child: Padding(
        padding: const EdgeInsets.all(Constants.defaultPadding),
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
    );
  }
}
