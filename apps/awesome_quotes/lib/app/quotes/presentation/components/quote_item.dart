import 'package:app_domain/app_domain.dart';
import 'package:app_ui/app_ui.dart';
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
        left: UIConstants.defaultPadding,
        right: UIConstants.defaultPadding,
        top: UIConstants.defaultPadding,
      ),
      child: Padding(
        padding: const EdgeInsets.all(UIConstants.defaultPadding),
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
