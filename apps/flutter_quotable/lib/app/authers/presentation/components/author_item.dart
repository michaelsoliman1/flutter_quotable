import 'package:app_domain/app_domain.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AuthorItem extends StatelessWidget {
  const AuthorItem({
    required this.author,
    super.key,
  });

  final Author author;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(Paddings.inner),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    author.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '#Quotes: ${author.quoteCount}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  LinkWidget(
                    link: WebPageLink(author.link),
                    child: Text(
                      author.link,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.blue[400],
                            decoration: TextDecoration.underline,
                          ),
                    ),
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
