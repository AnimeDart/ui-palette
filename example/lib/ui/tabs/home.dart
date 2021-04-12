import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_palette_example/ui/constants/dp.dart';
import 'package:ui_palette_example/ui/widgets/app_bar_action.dart';

import '../../navigation/module_navigator.dart';
import '../../navigation/tab_navigator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final overlayColor =
        Theme.of(context).bottomNavigationBarTheme.backgroundColor;
    final overlayBrightness = Theme.of(context).brightness;

    final overlayIconBrightness = overlayBrightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;

    return TabNavigator(
      moduleNavigator: ModuleNavigator.home,
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            systemNavigationBarColor: overlayColor,
            statusBarColor: overlayColor, // status bar color
            statusBarBrightness: overlayBrightness, //status bar brigtness
            statusBarIconBrightness: overlayIconBrightness,
            systemNavigationBarDividerColor: overlayColor,
            systemNavigationBarIconBrightness: overlayIconBrightness,
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                toolbarHeight: kToolbarHeight,
                title: Opacity(opacity: 0.5, child: Text('Browse')),
                actions: [
                  AppBarAction(icon: Icon(Icons.search)),
                  AppBarAction(icon: Icon(Icons.more_vert)),
                ],
              ),
              SliverPadding(
                padding: EdgeInsets.all(k1dp),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: k1dp,
                    crossAxisSpacing: k1dp,
                    childAspectRatio: 1 / 1.5,
                  ),
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
      ),
    );
  }
}
