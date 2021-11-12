import 'package:flutter/material.dart';

import '../qoutes/qoutes_screen.dart';
import '../saved_qoutes/saved_qoutes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _screens = [
    QoutesScreen(),
    SavedQoutesScreen(),
  ];

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
            label: 'Saved',
          ),
        ],
      ),
    );
  }
}
