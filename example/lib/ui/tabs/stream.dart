import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_palette_example/ui/constants/dp.dart';
import 'package:ui_palette_example/ui/widgets/app_bar_action.dart';

import '../../navigation/module_navigator.dart';
import '../../navigation/tab_navigator.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({Key key}) : super(key: key);

  @override
  _StreamScreenState createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  @override
  Widget build(BuildContext context) {
    return TabNavigator(
      moduleNavigator: ModuleNavigator.stream,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Stream'),
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
