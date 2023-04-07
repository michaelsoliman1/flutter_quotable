import 'package:app_domain/app_domain.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class QuoteItem extends StatelessWidget {
  const QuoteItem({
    required this.qoute,
    super.key,
  });

  final Quote qoute;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: Corners.outerRadius),
      child: Padding(
        padding: const EdgeInsets.all(Spacing.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              qoute.content,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                qoute.author,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
