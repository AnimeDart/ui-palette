import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../navigation/module_navigator.dart';
import '../../navigation/tab_navigator.dart';
import '../constants/dp.dart';
import '../widgets/app_bar_action.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return TabNavigator(
      moduleNavigator: ModuleNavigator.library,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Library'),
          actions: [
            AppBarAction(icon: Icon(Icons.search)),
            AppBarAction(icon: Icon(Icons.more_vert)),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(k1dp),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, __) {
                    return Card(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(k1dp),
                        onTap: () => {},
                        child: Container(height: 200),
                      ),
                    );
                  },
                  childCount: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
