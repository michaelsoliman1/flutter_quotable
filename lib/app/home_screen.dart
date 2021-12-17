import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/favorite_quotes_controller.dart';
import 'controllers/quotes_controller.dart';
import 'screens/favourite_quotes/favourite_quotes_screen.dart';
import 'screens/quotes/quotes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _screens = [
    QoutesScreen(),
    FavouriteQuotesScreen(),
  ];

  @override
  void initState() {
    super.initState();
    // old syntax
    // return Provider.of<QoutesController>(context, listen: false).getQuotes();

    context.read<QuotesController>().getQuotes();
    context.read<FavoriteQuotesController>().loadFavouriteQuotes();
  }

  void _changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeScreen,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: 'Qoutes',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.bookmark_added_outlined),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
