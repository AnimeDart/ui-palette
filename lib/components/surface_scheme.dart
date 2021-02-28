import 'package:flutter/cupertino.dart';

import '../config/palette_brightness.dart';
import '../gradients/alpha_gradient_palette.dart';

/// Surface colors
class SurfaceScheme extends AlphaGradientPalette {
  /// Create a background palette with [dpCount]
  const SurfaceScheme({
    int dpCount,
    PaletteBrightness brightness,
    double variability,
    double offset,
  }) : super(
          dpCount: dpCount,
          variability: variability,
          offset: offset ?? 0.07,
          brightness: brightness == PaletteBrightness.dark
              ? PaletteBrightness.light
              : PaletteBrightness.dark,
        );

  @override
  double get base => offset;

  @override
  HSLColor fromDp(int dp) {
    return HSLColor.fromAHSL(
      calcVariationWithBase(dp),
      baseHue ?? 0.0,
      0.0,
      brightness.isDark ? 0.0 : 1.0,
    );
  }
}
