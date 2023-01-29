import 'package:app_domain/app_domain.dart';
import 'package:app_ui/app_ui.dart';
import 'package:awesome_quotes/app/authers/application/authors_provider.dart';
import 'package:awesome_quotes/app/authers/presentation/components/author_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorsScreen extends ConsumerWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(authorsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Authors')),
      body: PagedListView<Author>(
        pagingController: provider.pagingController,
        itemBuilder: (context, author, index) => AuthorItem(author: author),
      ),
    );
  }
}
