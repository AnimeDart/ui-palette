import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_palette_example/ui/constants/dp.dart';

class AppBarAction extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final EdgeInsets margin;

  const AppBarAction({
    Key key,
    this.onTap,
    this.icon,
    this.margin,
  }) : super(key: key);

  static const actionSize = Size.square(kToolbarHeight - k2dp);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(actionSize.width / 2),
        onTap: onTap ?? () => {},
        child: SizedBox(
          height: actionSize.height,
          child: Center(child: icon),
          width: actionSize.width,
        ),
      ),
    );
  }
}
