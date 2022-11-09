import 'package:awesome_quotes/router/router.dart';
import 'package:flutter/material.dart';

enum NavigationTab {
  home,
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  NavigationTab _calculateSelectedTab(BuildContext context) {
    final location = GoRouter.of(context).location;

    if (location.startsWith(Paths.home)) return NavigationTab.home;
    if (location.startsWith(Paths.account)) return NavigationTab.account;
    return NavigationTab.home;
  }

  void _onTap(int index, BuildContext context) {
    final navTab = NavigationTab.values[index];
    switch (navTab) {
      case NavigationTab.home:
        GoRouter.of(context).go(Paths.home);
        break;
      case NavigationTab.account:
        GoRouter.of(context).go(Paths.account);
        break;
    }
  }
}
