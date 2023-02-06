import 'package:flutter/material.dart';
import 'package:flutter_quotable/router/router.dart';

enum NavigationTab {
  quotes,
  authors,
  account,
}

class RootScreen extends StatelessWidget {
  const RootScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final selectedTab = _calculateSelectedTab(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab.index,
        onTap: (index) => _onTap(index, context),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Quotes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Authors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  NavigationTab _calculateSelectedTab(BuildContext context) {
    final location = GoRouter.of(context).location;

    if (location.startsWith(Paths.quotes)) return NavigationTab.quotes;
    if (location.startsWith(Paths.authors)) return NavigationTab.authors;
    if (location.startsWith(Paths.account)) return NavigationTab.account;
    return NavigationTab.quotes;
  }

  void _onTap(int index, BuildContext context) {
    final navTab = NavigationTab.values[index];
    switch (navTab) {
      case NavigationTab.quotes:
        context.go(Paths.quotes);
        break;
      case NavigationTab.authors:
        context.go(Paths.authors);
        break;
      case NavigationTab.account:
        context.go(Paths.account);
        break;
    }
  }
}
