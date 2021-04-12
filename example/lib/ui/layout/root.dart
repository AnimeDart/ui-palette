import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_palette_example/ui/tabs/stream.dart';

import '../../state/app_global_state.dart';
import '../tabs/app_tab.dart';
import '../tabs/home.dart';
import '../tabs/library.dart';
import '../tabs/search.dart';

class Root extends StatelessWidget with AppGlobalStatelessMixin {
  const Root({Key key}) : super(key: key);

  static final _tabs = {
    AppTab.home: HomeScreen(),
    AppTab.search: SearchScreen(),
    AppTab.library: LibraryScreen(),
    AppTab.stream: StreamScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: appTabController(context),
        builder: (context, _) {
          return Stack(
            children: [
              _buildTabScreen(context, AppTab.home),
              _buildTabScreen(context, AppTab.search),
              _buildTabScreen(context, AppTab.library),
              _buildTabScreen(context, AppTab.stream),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabScreen(BuildContext context, AppTab tab) {
    return Offstage(
      offstage: appTabController(context).currentTab != tab,
      child: _tabs[tab],
    );
  }
}
