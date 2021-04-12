import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../state/app_global_state.dart';

import '../tabs/app_tab.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({Key key}) : super(key: key);

  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar>
    with AppGlobalStatefulMixin {
  final _tabs = [
    AppTab.home,
    AppTab.search,
    AppTab.stream,
    AppTab.library,
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appTabController,
      builder: (context, _) {
        return BottomNavigationBar(
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: _tabs.indexOf(appTabController.currentTab),
          onTap: (index) => appTabController.currentTab = _tabs[index],
          selectedItemColor: Theme.of(context).iconTheme.color,
          unselectedItemColor:
              Theme.of(context).iconTheme.color.withOpacity(.2),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.whatshot_outlined),
              activeIcon: Icon(Icons.whatshot_sharp),
              label: 'Stream',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_open),
              activeIcon: Icon(Icons.folder),
              label: 'Library',
            ),
          ],
        );
      },
    );
  }
}
