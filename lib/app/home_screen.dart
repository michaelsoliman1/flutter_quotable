import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/app_state_controller.dart';
import 'controllers/favorite_quotes_controller.dart';
import 'controllers/quotes_controller.dart';
import '../router/app_pages.dart';
import 'screens/favourite_quotes/favourite_quotes_screen.dart';
import 'screens/quotes/quotes_screen.dart';

class HomeScreen extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: AppPages.homePath,
      key: ValueKey(AppPages.homePath),
      child: HomeScreen(
        currentTab: currentTab,
      ),
    );
  }

  const HomeScreen({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  final int currentTab;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Widget> _screens = [
    QuotesScreen(),
    FavouriteQuotesScreen(),
  ];

  @override
  void initState() {
    super.initState();
    // old syntax
    // return Provider.of<QuotesController>(context, listen: false).getQuotes();

    context.read<QuotesController>().getQuotes();
    context.read<FavoriteQuotesController>().loadFavouriteQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateController>(
      builder: (
        context,
        appStateManager,
        child,
      ) {
        return Scaffold(
          appBar: AppBar(
            // TODO find a name for the app xD
            title: Text('Quotes'),
          ),
          body: IndexedStack(
            index: widget.currentTab,
            children: _screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: widget.currentTab,
            onTap: (index) {
              Provider.of<AppStateController>(context, listen: false).goToTab(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                label: 'Quotes',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.bookmark_added_outlined),
                label: 'Favorites',
              ),
            ],
          ),
        );
      },
    );
  }
}
