import 'package:app_domain/app_domain.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotable/app/authers/application/authors_provider.dart';
import 'package:flutter_quotable/app/authers/presentation/components/author_item.dart';
import 'package:flutter_quotable/l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthorsScreen extends ConsumerWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(authorsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.authors)),
      body: PagedListView<Author>(
        pagingController: provider.pagingController,
        itemBuilder: (context, author, index) => AuthorItem(author: author),
      ),
    );
  }
}
