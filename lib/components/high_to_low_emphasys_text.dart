import 'package:flutter/painting.dart';

import '../config/palette_brightness.dart';
import '../gradients/gradient_palette.dart';

/// Create a Background palette from
/// [dpCount], [brightness], [baseHue], [variability], [range]
class HighToLowEmphasysText extends GradientPalette {
  /// Create a background palette with [dpCount]
  const HighToLowEmphasysText({
    int dpCount,
    PaletteBrightness brightness,
    double variability,
    double baseHue,
    double offset,
    double saturation,
  }) : super(
          dpCount: dpCount,
          brightness: brightness,
          variability: variability,
          baseHue: baseHue,
          offset: offset ?? 0.05,
          saturation: saturation,
        );

  /// Disabled color, based on [baseHue] and [brightness]
  Color get disabled => lowEmphasys.withOpacity(.5);

  /// Low emphasys, based on [baseHue] and [brightness]
  Color get lowEmphasys => this[dpCount - 1];

  /// Hight emphasys, based on [baseHue] and [brightness]
  Color get highEmphasys => this[0];

  @override
  Color operator [](int dp) {
    return fromDp(dp).toColor();
  }

  @override
  HSLColor fromDp(int dp) {
    validateDp(dp);

    final diff = calcVariation(dp);

    return HSLColor.fromAHSL(
      1.0 - offset - diff,
      baseHue ?? 0.0,
      0.1,
      brightness.isDark ? 1.0 - diff : diff,
    );
  }
}
