import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ui_palette/config/palette_brightness.dart';

import 'theme/my_app_theme.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State<App> {
  double spacing(int spacing) => spacing * 2.0;

  var _theme = MyAppTheme(brightness: PaletteBrightness.light);

  void _toggle() {
    _theme = MyAppTheme(
      brightness:
          _theme.isDark ? PaletteBrightness.light : PaletteBrightness.dark,
    );
    setState(() {});
  }

  final items = [
    [
      'Xbox 360',
      (color) => Icon(Icons.gamepad, color: color, size: 40),
    ],
    [
      'Meditation',
      (color) => Icon(Icons.military_tech_outlined, color: color, size: 40),
    ],
    [
      'PlayStation',
      (color) => Icon(Icons.play_arrow, color: color, size: 40),
    ],
    [
      'Whirlpool',
      (color) => Icon(Icons.bathtub, color: color, size: 40),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        splashColor: _theme.surface[0].withAlpha(_theme.surface[0].alpha + 5),
        highlightColor:
            _theme.surface[1].withAlpha(_theme.surface[0].alpha + 10),
        textTheme:
            ThemeData.light().textTheme.apply(fontFamily: 'Josefin Sans'),
      ),
      home: Scaffold(
        backgroundColor: (() {
          return _theme.backgroundColor;
        })(),
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(spacing(10)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: _theme.surfaceColor,
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(spacing(4)),
                          child: Icon(
                            Icons.location_on,
                            color: _theme.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: spacing(4),
                            ),
                            child: Text(
                              'Berlin, Germany',
                              style: TextStyle(
                                color: _theme.text.lowEmphasys,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.notifications_outlined,
                          color: _theme.primaryColor,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: spacing(10)),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Hello Robert',
                      style: TextStyle(
                        color: _theme.primaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Divider(height: spacing(3), color: Colors.transparent),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: spacing(10),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "What's your plain today",
                      style: TextStyle(
                        color: _theme.text.lowEmphasys,
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    color: _theme.elevationOverlay[3],
                    padding: EdgeInsets.symmetric(
                      vertical: spacing(15),
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: spacing(15),
                    ),
                    child: ListView(
                      physics: RangeMaintainingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        for (var i = 0; i < items.length; i++)
                          (() {
                            final last = i == items.length - 1;
                            final first = i == 0;
                            final active = first;
                            final item = items[i];

                            return Padding(
                              padding: EdgeInsets.only(
                                right: last ? spacing(10) : spacing(5),
                                left: first ? spacing(10) : spacing(5),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(spacing(2)),
                                    color: first
                                        ? _theme.primaryColor
                                        : (() {
                                            print(HSLColor.fromColor(
                                                _theme.surfaceColor));
                                            return _theme.surfaceColor;
                                          })(),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      (item[1] as Function)(
                                        active
                                            ? _theme.backgroundColor
                                            : _theme.primaryColor,
                                      ),
                                      Divider(
                                        height: spacing(10),
                                        color: Colors.transparent,
                                      ),
                                      Text(
                                        item[0],
                                        style: TextStyle(
                                          color: active
                                              ? _theme.backgroundColor
                                              : _theme.primaryColor,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })()
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: _toggle,
                    color: _theme.primaryColor,
                    child: Row(
                      children: [
                        Text(
                          'Toggle Theme',
                          style: TextStyle(
                            color: _theme.backgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
